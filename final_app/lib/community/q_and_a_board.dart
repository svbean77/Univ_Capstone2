import 'dart:convert';

import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/community/const/searchPage.dart';
import 'package:final_app/community/write_board.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/grade_colors.dart';
import '../screen/const/ip_address.dart';
import 'const/contents.dart';

class QnABoard extends StatefulWidget {
  final loginID;
  final grade;
  const QnABoard({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<QnABoard> createState() => _QnABoardState();
}

class _QnABoardState extends State<QnABoard> {
  final TextEditingController controller = TextEditingController();

  Future getDatas(String username) async {
    var url =
    Uri.http(IP_ADDRESS, '/test_select_userdata.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "username": username.toString(),
      "mode": "Nickname".toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);
    return [data];
  }

  @override
  Widget build(BuildContext context) {
    /*
      select: qna 게시글들 불러오기
      (게시글번호, 제목, 작성자, 작성일자, 내용, 사진주소를 리스트로 변경)
       */
    List<int> boardLst = [3, 4, 5, 6, 7];

    return FutureBuilder(
        future: getDatas(widget.loginID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //snapshot.data[0].result![0].apptheme;
          }

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: PRIMARY_COLOR[widget.grade],
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => WriteBoard(
                      board: 'qna',
                      mode: 'write',
                      content: "",
                      loginID: widget.loginID,
                      title: "",
                      grade: widget.grade,
                    ),
                  ),
                );
              },
              child: Icon(Icons.create,
                  color: (widget.grade == 0 ||
                      widget.grade == 1 ||
                      widget.grade == 2 ||
                      widget.grade == 4 ||
                      widget.grade == 8)
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
                                color: widget.grade == 0
                                    ? Colors.grey.withOpacity(0.2)
                                    : PRIMARY_COLOR[widget.grade],
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
                            /*
                          select: qna 게시판 목록에서 제목에 검색어를 포함하는 게시글만 불러오기
                          (json으로 보내기)
                          */
                            List<int> findLst = [];
                            String find = controller.text.toString();

                            findLst = [1, 4, 5];
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SearchPage(
                                  boardLst: findLst,
                                  searchfor: find,
                                  loginID: widget.loginID,
                                  board: 'qna',
                                  grade: widget.grade,
                                ),
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
                                  boardnum: boardLst[i],
                                  grade: widget.grade),
                              onTap: () {
                                /*
                                    위에서 구한 json에서 각 내용들을 클래스로 매핑하는걸 여기서 해도 되나?
                                    여기는 이미 for문 내부라서 안될 것 같은데
                                    각각의 내용을 보냄!!
                                    ex) result.title[i]
                                    contents에게 제목, 내용, 작성자, 작성일자, 조회수, 사진이름, 사진경로 다 보내야 함!
                                    */
                                String title = '게시판 제목';
                                String contents = '게시판 내용${i}';

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Contents(
                                          loginID: widget.loginID,
                                          board: 'qna',
                                          title: title,
                                          contents: contents,
                                          grade: widget.grade,
                                        ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
