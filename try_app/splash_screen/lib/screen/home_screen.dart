import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text('잘내려가라', style: TextStyle(fontSize: 30.0)),
          Text('홈!!', style: TextStyle(fontSize: 40.0)),
        ],
      ),
    );
  }
}
