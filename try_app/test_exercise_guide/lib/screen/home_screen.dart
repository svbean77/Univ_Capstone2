import 'package:flutter/material.dart';
import 'package:test_exercise_guide/screen/select_muscle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SelectMuscle(level: '초보자'),
                ),
              );
            },
            child: Text('초보자 페이지 이동!'),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SelectMuscle(level: '숙련자'),
                ),
              );
            },
            child: Text('숙련자 페이지 이동!'),
          ),
        ],
      ),
    );
  }
}
