import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ContentsList extends StatelessWidget {
  final boardnum;
  final grade;
  const ContentsList({
    required this.boardnum,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //게시판 번호를 이용해 글의 정보 찾아오기
    String title =
        '엄청나게긴제목인데이렇게하면제목이잘리는데이걸어떻게보완해야할까궁금하구나제목인데이렇게하면제목이잘리는데이걸어떻게보완해야할까궁금하구나';
    if (title.length >= 25) {
      title = title.substring(0, 24) + '...';
    }
    String writer = '작성자';
    if (writer.length >= 13) {
      writer = writer.substring(0, 12) + '...';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
            border: Border.all(
          color: PRIMARY_COLOR[grade],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 30.0, child: Text(boardnum.toString())),
            SizedBox(width: 16.0),
            Expanded(child: Container(child: Text(title))),
            SizedBox(width: 16.0),
            Container(
                width: 100.0, child: Text(writer, textAlign: TextAlign.end))
          ],
        ),
      ),
    );
  }
}
