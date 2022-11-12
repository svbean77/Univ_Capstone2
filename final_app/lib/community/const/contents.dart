import 'package:final_app/community/const/community_main.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class Contents extends StatefulWidget {
  //board만 불러오고 나머지 내용들은 여기서 db 불러오기로 할까
  final board;
  final title;
  final contents;
  const Contents({
    required this.board,
    required this.title,
    required this.contents,
    Key? key,
  }) : super(key: key);

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String writer = '작성자이름';
    String date = '2022.11.11';
    List<String> commentWriter = ['유저1', '유저6', '유저33'];
    List<String> comment = ['이거는이렇게해야죠', '댓글내용입니다이건느', '하..\n댓글줄바꿈은뭐..'];

    int grade = 0;
    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(grade: grade),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //어느 페이지로 이동시킬지 생각을 해봐야겠다..
          //pop을 했을 때 변경사항이 반영이 되는지 확인! 일단 pop으로 구현
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => CommunityMain(grade: grade)),
          );
        },
        child: Icon(Icons.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('제목',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            SizedBox(height: 8.0),
            Text(widget.title),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('작성자', style: TextStyle(fontSize: 15.0)),
                Text(writer, style: TextStyle(fontSize: 10.0)),
                Text('작성일자', style: TextStyle(fontSize: 15.0)),
                Text(date, style: TextStyle(fontSize: 10.0)),
              ],
            ),
            SizedBox(height: 8.0),
            Text('내용',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            SizedBox(height: 8.0),
            Text(widget.contents),
            SizedBox(height: 16.0),
            Text('댓글 (${commentWriter.length})',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            SizedBox(height: 8.0),
            for (int i = 0; i < commentWriter.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(commentWriter[i]),
                  SizedBox(height: 8.0),
                  Text(comment[i]),
                  SizedBox(height: 16.0),
                ],
              ),
            SizedBox(height: 16.0),
            Container(
              height: 100.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PRIMARY_COLOR[grade],
                        ),
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  SizedBox(
                      height: 100.0,
                      child: TextButton(
                          onPressed: () {
                            //댓글 db에 추가하는 코드
                          },
                          child: Text('댓글쓰기'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
