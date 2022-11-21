import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddWeight extends StatelessWidget {
  final loginID;
  const AddWeight({
    required this.loginID,
    Key? key,
  }) : super(key: key);

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
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            child: TextField(
              controller: weightController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '체중입력',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 16.0),
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
                  /*
                  int inputDate = int.parse(dateController.text.toString());
                  int year = inputDate ~/ 10000;
                  int month = (inputDate % 10000) ~/ 100;
                  int day = inputDate % 100;
                  DateTime date = DateTime(year, month, day);
                  double weight =
                      double.parse(weightController.text.toString());
                   */

                  //date에 weight 입력하는 코드 작성
                  Navigator.of(context).pop();
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
