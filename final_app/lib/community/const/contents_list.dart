import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ContentsList extends StatelessWidget {
  /*
  어차피 모든 페이지들에서 class까지는 다 구하니까
  게시글번호, 제목, 작성자를 모두 외부에서 받아오기
   */
  final data;
  final grade;
  const ContentsList({
    required this.data,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 70.0,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: PRIMARY_COLOR[grade].withOpacity(0.5),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 30.0,
                child:
                    Text(data.id.toString(), style: TextStyle(fontSize: 18.0))),
            SizedBox(width: 16.0),
            Expanded(
              child: Container(
                child: Text(
                  data.title,
                  style: TextStyle(fontSize: 23.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
