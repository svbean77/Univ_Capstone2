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

  Future getDatas() async {
    var url =
        Uri.http(IP_ADDRESS, '/test_select_qnaboard.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{});
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    ALLCONTENTS data = ALLCONTENTS.fromJson(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.result!.length);
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
                      loginID: widget.loginID,
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
                          onTap: () async {
                            if (controller.text.toString() != "") {
                              var url = Uri.http(
                                  IP_ADDRESS,
                                  '/test_select_search_board.php',
                                  {'q': '{http}'});
                              var response =
                                  await http.post(url, body: <String, String>{
                                "board": "qna".toString(),
                                "search": controller.text.toString(),
                              });
                              var jsondata = jsonDecode(
                                  json.decode(json.encode(response.body)));
                              ALLCONTENTS data = ALLCONTENTS.fromJson(jsondata);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SearchPage(
                                    data: data.result!,
                                    searchfor: controller.text.toString(),
                                    loginID: widget.loginID,
                                    board: 'qna',
                                    grade: widget.grade,
                                  ),
                                ),
                              );
                            } else {
                              /*
                              토스트 메시지
                               */
                              print("검색어");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: snapshot.hasData
                        ? Container(
                            child: snapshot.data.result!.length == 0
                                ? Container(
                                    child: Center(
                                      child: Text('게시글이 없습니다.'),
                                    ),
                                  )
                                : ListView(
                                    children: [
                                      for (int i = 0;
                                          i < snapshot.data.result!.length;
                                          i++)
                                        GestureDetector(
                                          child: ContentsList(
                                              data: snapshot.data.result![i],
                                              grade: widget.grade),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Contents(
                                                  loginID: widget.loginID,
                                                  board: 'qna',
                                                  data:
                                                      snapshot.data.result![i],
                                                  grade: widget.grade,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
