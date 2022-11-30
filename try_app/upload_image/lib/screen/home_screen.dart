import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('사진 올리러 가기')),
          SizedBox(height: 8.0),
          ElevatedButton(onPressed: () {}, child: Text('사진 보러 가기')),
          SizedBox(height: 8.0),
          ElevatedButton(onPressed: () {}, child: Text('동영상 올리러 가기')),
          SizedBox(height: 8.0),
          ElevatedButton(onPressed: () {}, child: Text('동영상 보러 가기')),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
