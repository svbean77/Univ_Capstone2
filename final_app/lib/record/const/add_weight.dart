import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddWeight extends StatelessWidget {
  const AddWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    int grade = 5;

    return Container(
      height: 180.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '날짜입력: YYYYMMDD',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: grade == 0
                    ? Colors.black.withOpacity(0.2)
                    : PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 16.0),Container(
            child: TextField(
              controller: weightController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '체중입력',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: grade == 0
                    ? Colors.black.withOpacity(0.2)
                    : PRIMARY_COLOR[grade],
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
                  int inputDate = int.parse(dateController.text.toString());
                  int year = inputDate ~/ 10000;
                  int month = (inputDate % 10000) ~/ 100;
                  int day = inputDate % 100;
                  DateTime date = DateTime(year, month, day);
                  double weight = double.parse(weightController.text.toString());

                  //date에 weight 입력하는 코드 작성
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
