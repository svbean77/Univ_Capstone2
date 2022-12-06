import 'dart:async';
import 'dart:convert';
import 'package:final_app/record/const/add_weight.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import '../screen/const/ip_address.dart';

class RecordGraph extends StatefulWidget {
  final loginID;
  final grade;
  const RecordGraph({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RecordGraph> createState() => _RecordGraphState();
}

class _RecordGraphState extends State<RecordGraph> {
  StreamController controller = StreamController();
  Timer? _timer;

  Future getDatas() async {
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_weight_record.php");
    /*
    var url =
        Uri.http(IP_ADDRESS, '/test_select_weight_record.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    WEIGHT data = WEIGHT.fromJson(jsondata);

    controller.add(data);
  }

  @override
  void initState() {
    getDatas();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => getDatas());
    super.initState();
  }

  @override
  void dispose() {
    if (_timer!.isActive) _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: StreamBuilder(
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            int dif = 1;
            List<WeightData> record_date = [];
            double minWeight = 100000;
            double maxWeight = -1;
            if (snapshot.hasData) {
              if (snapshot.data.result!.length == 0) {
                DateTime now = DateTime.now();
                record_date.add(WeightData(
                    DateTime(now.year, now.month, now.day), double.parse("0")));
              } else {
                for (int i = 0; i < snapshot.data.result!.length; i++) {
                  int today = int.parse(snapshot.data.result![i].writeDate);
                  int year = today ~/ 10000;
                  int month = (today % 10000) ~/ 100;
                  int day = today % 100;

                  if (minWeight > snapshot.data.result![i].weight)
                    minWeight = snapshot.data.result![i].weight;
                  if (maxWeight < snapshot.data.result![i].weight)
                    maxWeight = snapshot.data.result![i].weight;

                  record_date.add(WeightData(
                      DateTime(year, month, day),
                      double.parse(
                          snapshot.data.result![i].weight.toString())));
                }

                dif = record_date[record_date.length - 1]
                    .date
                    .difference(record_date[0].date)
                    .inDays;
              }
            }

            return ListView(
              children: [
                Text('체중',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 16.0),
                if (snapshot.hasData)
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 250.0,
                      width: dif * 40 < MediaQuery.of(context).size.width
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width + dif * 40,
                      color: PRIMARY_COLOR[widget.grade].withOpacity(0.03),
                      child: SfCartesianChart(
                        primaryXAxis: DateTimeAxis(
                          intervalType: DateTimeIntervalType.days,
                          interval: 1,
                          rangePadding: ChartRangePadding.additional,
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: minWeight - 5,
                          maximum: maxWeight + 5,
                          isVisible: false,
                        ),
                        series: <ChartSeries>[
                          LineSeries<WeightData, DateTime>(
                            markerSettings: MarkerSettings(
                                isVisible: true,
                                height: 8.0,
                                width: 8.0,
                                color: Colors.white,
                                borderColor: widget.grade == 0
                                    ? Colors.grey.withOpacity(0.1)
                                    : widget.grade == 2
                                        ? Colors.yellow[600]
                                        : widget.grade == 8
                                            ? Colors.lightGreen[200]
                                            : PRIMARY_COLOR[widget.grade],
                                shape: DataMarkerType.circle),
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.1)
                                : widget.grade == 2
                                    ? Colors.yellow[600]
                                    : widget.grade == 8
                                        ? Colors.lightGreen[200]
                                        : PRIMARY_COLOR[widget.grade],
                            dataSource: record_date,
                            xValueMapper: (WeightData info, _) => info.date,
                            yValueMapper: (WeightData info, _) => info.weight,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: AddWeight(
                              loginID: widget.loginID,
                              grade: widget.grade,
                            ),
                            scrollable: true,
                          );
                        },
                      );
                    },
                    child: Text('체중입력', style: TextStyle(color: Colors.black)),
                  ),
                )
              ],
            );
          }),
    );
  }
}

class WeightData {
  WeightData(this.date, this.weight);
  final DateTime date;
  final double weight;
}
