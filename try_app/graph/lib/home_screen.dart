import 'package:flutter/material.dart';
import 'package:graph/chart_a.dart';
import 'package:graph/chart_b.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        //color: Colors.green[100],
        child: ChartB(),
      ),
    );
  }
}
