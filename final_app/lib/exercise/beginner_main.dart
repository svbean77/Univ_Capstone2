import 'package:final_app/exercise/select_body.dart';
import 'package:final_app/exercise/select_routine.dart';
import 'package:flutter/material.dart';

class BeginnerMain extends StatelessWidget {
  const BeginnerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('원하는 운동 방법을 선택해주세요'),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SelectBody(),
              )
            );
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text('신체 부위별 운동'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SelectRoutine(),
              ),
            );
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text('루틴 선택'),
          ),
        ),
      ],
    );
  }
}
