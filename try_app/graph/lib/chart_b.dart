import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartB extends StatelessWidget {
  const ChartB({Key? key}) : super(key: key);
/*
  @override
  Widget build(BuildContext context) {
    List<int> input = [
      20220901,
      20220905,
      20220908,
      20220915,
      20220929,
      20221015
    ];
    List<double> weight = [45.0, 50.0, 47.0, 55.0, 40.0];
    List<WeightData> data = [];

    for (int i = 0; i < weight.length; i++) {
      int year = input[i] ~/ 10000;
      int month = (input[i] % 10000) ~/ 100;
      int day = input[i] % 100;
      data.add(
        WeightData(DateTime(year, month, day), weight[i]),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width + data.length,
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          series: <ChartSeries>[
            LineSeries(
                dataSource: data,
                xValueMapper: (WeightData dates, _) => dates.date.day,
                yValueMapper: (WeightData dates, _) => dates.weight)
          ],
        ),
      ),
    );
  }
}

class WeightData {
  WeightData(this.date, this.weight);
  final DateTime date;
  final double weight;
}


 */

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2010), 35),
      SalesData(DateTime(2011), 28),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 40),
      SalesData(DateTime(2015), 40),
      SalesData(DateTime(2016), 40),
      SalesData(DateTime(2017), 40),
      SalesData(DateTime(2018), 40),
      SalesData(DateTime(2019), 40),
    ];

    return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 200.0,
              width: MediaQuery.of(context).size.width + chartData.length,
              child: SfCartesianChart(
                  primaryXAxis: DateTimeAxis(),
                  series: <ChartSeries>[
            // Renders line chart
            LineSeries<SalesData, DateTime>(
                dataSource: chartData,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales)
          ])),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final DateTime year;
  final double sales;
}
