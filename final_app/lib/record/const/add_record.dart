import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddRecord extends StatelessWidget {
  final grade;
  const AddRecord({
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();

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
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  //db에 기록 추가하는 코드
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
