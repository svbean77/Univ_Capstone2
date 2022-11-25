import 'package:flutter/material.dart';
import 'package:test_exercise_guide/screen/test_screen.dart';

class TestScreen3 extends StatelessWidget {
  final data;
  const TestScreen3({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(Icons.home),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => TestScreen(level: "숙련자"),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            print(data.runtimeType);
          }, child: Text('타입 출력')),
          ElevatedButton(onPressed: (){
            print(data);
          }, child: Text('내용 출력')),
          ElevatedButton(onPressed: (){
            print(data.length);
          }, child: Text('길이 출력')),
          ElevatedButton(onPressed: (){
            for (int i = 0; i < data.length; i++)
              print(data[i].exercise);
          }, child: Text('for문 출력')),
        ],
      ),
    );
  }
}
