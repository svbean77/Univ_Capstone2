import 'package:final_app/community/const/contents.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class WriteBoard extends StatefulWidget {
  String content;
  final board;
  final mode;
  WriteBoard({
    required this.board,
    required this.mode,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<WriteBoard> createState() => _WriteBoardState();
}

class _WriteBoardState extends State<WriteBoard> {
  final GlobalKey<FormState> titleFormKey = GlobalKey();
  final GlobalKey<FormState> contentFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int grade = 5;

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
                          color: grade == 0
                              ? Colors.black.withOpacity(0.2)
                              : PRIMARY_COLOR[grade],
                        ),
                      ),
                      child: Form(
                        key: titleFormKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: 15,
                          initialValue: widget.content ?? '',
                          onSaved: (String? val) {
                            widget.content = val!;
                          },
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
                    color: grade == 0
                        ? Colors.black.withOpacity(0.2)
                        : PRIMARY_COLOR[grade],
                  ),
                ),
                child: Form(
                  key: contentFormKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    maxLines: 15,
                    initialValue: widget.content ?? '',
                    onSaved: (String? val) {
                      widget.content = val!;
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '갤러리',
                    style: TextStyle(
                        color: (grade == 0 ||
                                grade == 1 ||
                                grade == 2 ||
                                grade == 4 ||
                                grade == 8)
                            ? Colors.black
                            : Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR[grade], elevation: 0),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '카메라',
                    style: TextStyle(
                        color: (grade == 0 ||
                                grade == 1 ||
                                grade == 2 ||
                                grade == 4 ||
                                grade == 8)
                            ? Colors.black
                            : Colors.white),
                  ),
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

                if (widget.mode == 'edit') {
                  //db의 내용을 수정하는 코드
                } else {
                  //db에 내용을 추가하는 코드
                }
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Contents(
                        title: saveTitle,
                        contents: saveContent,
                        board: widget.board),
                  ),
                );
              },
              child: Text(
                '저장',
                style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade], elevation: 0),
            ),
          ],
        ),
      ),
    );
  }
}
