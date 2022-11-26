import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddRecord extends StatelessWidget {
  final loginID;
  final grade;
  final selectedDate;
  const AddRecord({
    required this.loginID,
    required this.grade,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String year = selectedDate.year.toString();
    String month = selectedDate.month.toString();
    String day = selectedDate.day.toString();

    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$year.$month.$day 기록 추가', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 8.0),
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                border: InputBorder.none,
              ),
              maxLines: 7,
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
                  /*
                  insert: 해당 날짜에 기록 추가
                   */
                  /*
                  지금은 pop이지만 homescreen index 해결되면 push로 변경!
                  (tapbar도 해결되면 더더 좋아!)
                   */
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
