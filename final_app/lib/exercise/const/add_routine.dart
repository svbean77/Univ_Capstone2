import 'package:final_app/exercise/select_my_routine.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddRoutine extends StatefulWidget {
  final loginID;
  const AddRoutine({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<AddRoutine> createState() => _AddRoutineState();
}

class _AddRoutineState extends State<AddRoutine> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int grade = 5;

    return Container(
      height: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '루틴 이름을 입력해주세요',
                border: InputBorder.none,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '취소',
                  style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () {
                  //db에 루틴 추가하는 코드 작성
                  //추가됨에 따라 실시간으로 화면에 추가
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SelectMyRoutine(loginID: widget.loginID),
                    ),
                  );
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
