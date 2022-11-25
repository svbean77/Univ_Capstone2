import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/community/const/searchPage.dart';
import 'package:final_app/community/write_board.dart';
import 'package:flutter/material.dart';

import '../screen/const/grade_colors.dart';
import 'const/contents.dart';

class QnABoard extends StatefulWidget {
  final loginID;
  const QnABoard({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<QnABoard> createState() => _QnABoardState();
}

class _QnABoardState extends State<QnABoard> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> boardLst = [3, 4, 5, 6, 7];
    int grade = 5;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[grade],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => WriteBoard(
                  board: 'QnA',
                  mode: 'write',
                  content: "",
                  loginID: widget.loginID),
            ),
          );
        },
        child: Icon(Icons.create,
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 15,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grade == 0
                              ? Colors.grey.withOpacity(0.2)
                              : PRIMARY_COLOR[grade],
                        ),
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          hintText: '제목으로 검색',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      List<int> findLst = [];
                      String find = controller.text.toString();

                      findLst = [1, 4, 5];
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => SearchPage(
                              boardLst: findLst,
                              searchfor: find,
                              loginID: widget.loginID),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                child: boardLst.length == 0
                    ? Container(
                        child: Center(
                          child: Text('게시글이 없습니다.'),
                        ),
                      )
                    : ListView(
                        children: [
                          for (int i = 0; i < boardLst.length; i++)
                            GestureDetector(
                              child: ContentsList(
                                  boardnum: boardLst[i], grade: grade),
                              onTap: () {
                                //게시판 번호를 이용해 게시글 정보를 불러오는 코드
                                String title = '게시판 제목';
                                String contents = '게시판 내용${i}';

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Contents(
                                        loginID: widget.loginID,
                                        board: 'QnA',
                                        title: title,
                                        contents: contents),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
