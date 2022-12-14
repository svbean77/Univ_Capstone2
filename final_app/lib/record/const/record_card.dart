import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final grade;
  final content;
  const RecordCard({
    required this.grade,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: PRIMARY_COLOR[grade].withOpacity(0.5),
          ),
          color: Colors.white,
        ),
        child: IntrinsicHeight(
          child: Text(content, style: TextStyle(fontSize: 23.0)),
        ),
      ),
    );
  }
}
