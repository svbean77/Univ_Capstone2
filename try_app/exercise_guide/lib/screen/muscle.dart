import 'package:flutter/material.dart';

class Muscle extends StatefulWidget {
  const Muscle({Key? key}) : super(key: key);

  @override
  State<Muscle> createState() => _MuscleState();
}

class _MuscleState extends State<Muscle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('득근득근'),
      ),
      body: Center(
        child: Text('가이드!'),
      ),
    );
  }
}
