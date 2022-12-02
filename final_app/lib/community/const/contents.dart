import 'dart:convert';
import 'dart:io';

import 'package:final_app/community/const/community_main.dart';
import 'package:final_app/community/write_board.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class Contents extends StatefulWidget {
  /*
  게시글 번호, 게시글 종류 받아와서 이 안에서 불러오기! FutureBuilder 사용
   */
  final loginID;
  final board;
  final data;
  final grade;
  const Contents({
    required this.loginID,
    required this.board,
    required this.data,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: MyAppBar(grade: widget.grade),
            drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text('제목',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  Text('widget.data.title'),
                  SizedBox(height: 8.0),
                  Row(

                    children: [
                      Text('작성자',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(width: 8.0),
                      Text('widget.data.writer')
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text('내용',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  Text('widget.data.contents'),
                  SizedBox(height: 8.0),
                  /*
                for (int i = 0; i < images.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.file(images[i]),
                  ),
                for (int i = 0; i < files.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.file(File(files[i])),
                  ),
                for (int i = 0; i < imagefiles.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.file(File(imagefiles[i])),
                  ),
                 */
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) => CommunityMain(
                                loginID: widget.loginID,
                                grade: widget.grade,
                              ),
                            ),
                          );
                        },
                        child: MyText(text: "목록", grade: widget.grade),
                        style: ElevatedButton.styleFrom(
                          primary: PRIMARY_COLOR[widget.grade],
                          elevation: 0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      if (widget.loginID == 'widget.data.writer')
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                /*
                                editpost 페이지로 이동~!!!
                              */
                              },
                              child: MyText(text: "수정", grade: widget.grade),
                              style: ElevatedButton.styleFrom(
                                primary: PRIMARY_COLOR[widget.grade],
                                elevation: 0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        height: 100.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('삭제하시겠습니까?'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: PRIMARY_COLOR[
                                                        widget.grade],
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: MyText(
                                                      text: "취소",
                                                      grade: widget.grade),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: PRIMARY_COLOR[
                                                        widget.grade],
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () {
                                                    /*
                                                  board를 이용해 db 선택
                                                  delete: 게시글 번호를 이용해 삭제
                                                   */
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            CommunityMain(
                                                          loginID:
                                                              widget.loginID,
                                                          grade: widget.grade,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: MyText(
                                                      text: "확인",
                                                      grade: widget.grade),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: MyText(text: "삭제", grade: widget.grade),
                              style: ElevatedButton.styleFrom(
                                primary: PRIMARY_COLOR[widget.grade],
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          );

  }
}
