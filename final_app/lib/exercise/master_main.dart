import 'package:final_app/exercise/select_muscle.dart';
import 'package:final_app/exercise/select_my_routine.dart';
import 'package:final_app/exercise/select_routine.dart';
import 'package:flutter/material.dart';

class MasterMain extends StatelessWidget {
  const MasterMain({Key? key}) : super(key: key);

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
                builder: (BuildContext context) => SelectMuscle(),
              ),
            );
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text('근육 부위별 운동'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext ccontext) => SelectRoutine(),
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
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext ccontext) => SelectMyRoutine(),
              ),
            );
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text('나만의 루틴'),
          ),
        ),
      ],
    );
  }
}
