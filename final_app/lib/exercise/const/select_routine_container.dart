import 'package:final_app/exercise/list_routine.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class SelectRoutineContainer extends StatelessWidget {
  final title;
  final grade;
  const SelectRoutineContainer({
    required this.grade,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(right: 8.0, top: 10.0, bottom: 10.0),
      child: GestureDetector(
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: PRIMARY_COLOR[grade],
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ListRoutine(title: title),
            ),
          );
        },
      ),
    );
  }
}
