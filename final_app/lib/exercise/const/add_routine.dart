import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddRoutine extends StatelessWidget {
  const AddRoutine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    int grade = 0;

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
                hintStyle: TextStyle(
                  color: PRIMARY_COLOR[grade],
                ),
                border: InputBorder.none,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
              SizedBox(width: 30.0),
              TextButton(
                onPressed: () {
                  //db에 루틴 추가하는 코드 작성
                  //추가됨에 따라 실시간으로 화면에 추가
                  Navigator.of(context).pop();
                },
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}