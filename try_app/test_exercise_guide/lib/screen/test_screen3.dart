import 'package:flutter/material.dart';

class TestScreen3 extends StatelessWidget {
  final data;
  const TestScreen3({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
