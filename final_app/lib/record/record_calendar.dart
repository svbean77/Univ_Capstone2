import 'dart:async';
import 'dart:convert';

import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/record/const/record_card.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import '../screen/const/ip_address.dart';

class RecordCalendar extends StatefulWidget {
  final loginID;
  final grade;
  const RecordCalendar({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RecordCalendar> createState() => _RecordCalendarState();
}

class _RecordCalendarState extends State<RecordCalendar> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  StreamController controller = StreamController();
  Timer? _timer;

  Future getDatas() async {
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_exercise_record.php");
    /*
    var url = Uri.http(
        IP_ADDRESS, '/test_select_exercise_record.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    MY_EXERCISE_RECORD data = MY_EXERCISE_RECORD.fromJson(jsondata);

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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[widget.grade],
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddRecord(
                    grade: widget.grade,
                    selectedDate: selectedDay,
                    loginID: widget.loginID),
                scrollable: true,
              );
            },
          );
        },
        child: Icon(Icons.add,
            color: (widget.grade == 0 ||
                    widget.grade == 1 ||
                    widget.grade == 2 ||
                    widget.grade == 4 ||
                    widget.grade == 8)
                ? Colors.black
                : Colors.white),
      ),
      body: StreamBuilder(
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            String toyear = selectedDay.year.toString();
            String tomonth = selectedDay.month.toString();
            if (tomonth.length == 1) tomonth = "0" + tomonth;
            String todayday = selectedDay.day.toString();
            if (todayday.length == 1) todayday = "0" + todayday;

            List<List<String>> today_record = [];
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data.result!.length; i++) {
                int today = int.parse(snapshot.data.result![i].writeDate);
                int year = today ~/ 10000;
                int month = (today % 10000) ~/ 100;
                int day = today % 100;

                if (selectedDay.year.toString() == year.toString() &&
                    selectedDay.month.toString() == month.toString() &&
                    selectedDay.day.toString() == day.toString()) {
                  today_record.add([
                    snapshot.data.result![i].comment,
                    snapshot.data.result![i].writeDate
                  ]);
                }
              }
            }
            return ListView(
              children: [
                Calendar(
                  selectedDay: selectedDay,
                  grade: widget.grade,
                  focusedDay: focusedDay,
                  onDaySelected: onDaySelected,
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  height: 30.0,
                  color: PRIMARY_COLOR[widget.grade],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          text:
                              '${toyear}.${tomonth}.${todayday}',
                          grade: widget.grade),
                      MyText(
                          text: '${today_record.length}개', grade: widget.grade),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                if (today_record.length != 0)
                  for (int i = 0; i < today_record.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RecordCard(
                          grade: widget.grade, content: today_record[i][0]),
                    )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 32.0),
                    child: Center(
                      child: Text('운동 기록이 없습니다'),
                    ),
                  ),
                SizedBox(height: 60.0),
              ],
            );
          }),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class Calendar extends StatefulWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  final int grade;

  const Calendar({
    required this.selectedDay,
    required this.grade,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: widget.focusedDay,
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      onDaySelected: widget.onDaySelected,
      selectedDayPredicate: (DateTime date) {
        return date.year == widget.selectedDay!.year &&
            date.month == widget.selectedDay!.month &&
            date.day == widget.selectedDay!.day;
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          border: Border.all(
            color: widget.grade == 0
                ? Colors.grey.withOpacity(0.2)
                : PRIMARY_COLOR[widget.grade],
          ),
          color: widget.grade == 0
              ? Colors.grey.withOpacity(0.2)
              : PRIMARY_COLOR[widget.grade].withOpacity(0.2),
          borderRadius: BorderRadius.circular(100),
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        selectedTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
