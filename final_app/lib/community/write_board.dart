import 'package:final_app/community/const/contents.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class WriteBoard extends StatefulWidget {
  final board;
  const WriteBoard({
    required this.board,
    Key? key,
  }) : super(key: key);

  @override
  State<WriteBoard> createState() => _WriteBoardState();
}

class _WriteBoardState extends State<WriteBoard> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int grade = 0;

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                children: [
                  Text('제목', style: TextStyle(fontSize: 20.0)),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PRIMARY_COLOR[grade],
                        ),
                      ),
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text('내용', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Container(
              height: 300.0,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PRIMARY_COLOR[grade],
                  ),
                ),
                child: TextField(
                  controller: contentsController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: InputBorder.none,
                  ),
                  maxLines: 15,
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('갤러리'),
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR[grade], elevation: 0),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('카메라'),
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR[grade], elevation: 0),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                //db에 게시글 저장하는 코드
                //final saveTitle = titleController.text.toString();
                //final saveContent = contentsController.text.toString();
                //이거를 페이지로 옮기지 말고 Contents에서 db 불러오는거로 할까
                String saveTitle =
                    '완전길게글제목을지어보자어떻게까지나오나한번해보는거야이거는그냥텍스ㅡㅌ로해서길게나오도록해엑ㅆ구ㅏㅁ';
                String saveContent =
                    '''완\n전\n긴\n내\n용\n의\n글\n을\n써\n보\n자\n이\n번\n엔\n몇\n줄\n이\n나\n될\n까\n알\n아\n맞\n춰\n봅\n시\n다''';
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Contents(title: saveTitle, contents: saveContent, board: widget.board),
                  ),
                );
              },
              child: Text('저장'),
              style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade], elevation: 0),
            ),
          ],
        ),
      ),
    );
  }
}
