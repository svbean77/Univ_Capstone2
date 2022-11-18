import 'package:final_app/exercise/select_body.dart';
import 'package:final_app/exercise/select_routine.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class BeginnerMain extends StatelessWidget {
  final loginID;
  const BeginnerMain({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 0;
    if (loginID != "")
      grade = 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '원하는 운동 방법을 \n선택해주세요',
          style: TextStyle(fontSize: 25.0),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => SelectBody(loginID: loginID),
            ));
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
            child: Text(
              '근육 부위별 운동',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    SelectRoutine(loginID: loginID),
              ),
            );
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
            child: Text(
              '루틴',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
