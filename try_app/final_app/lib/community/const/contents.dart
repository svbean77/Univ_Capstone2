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
  //contents에게 제목, 내용, 작성자, 작성일자, 조회수, 사진이름, 사진경로 다 보내야 함!
  //작성하고 바로 홈으로 이동하면 여기서 게시글 번호만 이동하면 되는데.. 어디로 이동할지는 회의 후 결정!
  //작성 후 게시글로 이동이면 하나씩 풀어서, 게시판으로 이동이면 Future 내부에서 게시글 번호를 통해 정보 구하기!
  //게시판으로 이동: select 테마, 게시글, 댓글
  //게시글로 이동: select 테마, 댓글

  //nono 어차피 게시글 번호, 제목 등을 다 알아야 하기 때문에 이전에 class로 만듦! 따라서 게시글 정보를 class로 전달받으면 됨!
  final loginID;
  final board;
  final title;
  final contents;
  const Contents({
    required this.loginID,
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
  Future getDatas(String username) async {
    var url =
        Uri.http(IP_ADDRESS, '/test_select_userdata.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "username": username.toString(),
      "mode": "Nickname".toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);
    /*
    여러개인 곳들은 여기서 또 구해 리스트로 retrun하면 되는거 아니야?
     */
    return [data];
  }

  @override
  Widget build(BuildContext context) {
    int grade = 0;
    /*
    여기서 구한 댓글을 제외한 모든 내용들은 final로 받아오는 내용들!
    (내 아이디, 작성자, 날짜, 사진 등등 게시물 관련 내용들!)
     */
    /*
    select: 이 게시글에 대한 댓글 json 구하기 -> class -> list
    (board로 db 선택, 게시글 번호로 select)
     */
    String myName = '작성자이름';
    String writer = '작성자이름';
    String date = '2022.11.11';
    List<String> commentWriter = ['유저1', widget.loginID, '유저33'];
    List<String> comment = ['이거는이렇게해야죠', '댓글내용입니다이건느', '하..\n댓글줄바꿈은뭐..'];

    return FutureBuilder(
        future: getDatas(widget.loginID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            grade = snapshot.data[0].result![0].apptheme;
          }

          return Scaffold(
            appBar: MyAppBar(grade: grade),
            drawer: MyDrawer(loginID: widget.loginID),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text('제목',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  Text(widget.title),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('작성자',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Text(writer),
                      Text('작성일자',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Text(date),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text('내용',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  Text(widget.contents),
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
                              builder: (BuildContext context) =>
                                  CommunityMain(loginID: widget.loginID),
                            ),
                          );
                        },
                        child: Text(
                          '목록',
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
                          primary: PRIMARY_COLOR[grade],
                          elevation: 0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      if (myName == writer)
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        WriteBoard(
                                      loginID: widget.loginID,
                                      board: widget.board,
                                      mode: 'edit',
                                      content: widget.contents,
                                      title: widget.title,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                '수정',
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
                                primary: PRIMARY_COLOR[grade],
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
                                                    primary:
                                                        PRIMARY_COLOR[grade],
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    '취소',
                                                    style: TextStyle(
                                                      color: (grade == 0 ||
                                                              grade == 1 ||
                                                              grade == 2 ||
                                                              grade == 4 ||
                                                              grade == 8)
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary:
                                                        PRIMARY_COLOR[grade],
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
                                                                loginID: widget
                                                                    .loginID),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    '확인',
                                                    style: TextStyle(
                                                      color: (grade == 0 ||
                                                              grade == 1 ||
                                                              grade == 2 ||
                                                              grade == 4 ||
                                                              grade == 8)
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
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
                              child: Text(
                                '삭제',
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
                                primary: PRIMARY_COLOR[grade],
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  /*
                json->class->list로 바꾼 댓글 list를 이용해 구함 (길이 등등)
                list로 안바꾸고 그냥 class에서 사용해도 될 것 같은데! 굳이 list로 안바꿔도 되는 애들은 바꾸지 마!
                그냥 class 그대로 result[i].comment 이런식으로 사용해도 될 것 같음!
                 */
                  Text('댓글 (${commentWriter.length})',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  for (int i = 0; i < commentWriter.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(commentWriter[i],
                                style: TextStyle(fontSize: 20.0)),
                            commentWriter[i] == widget.loginID
                                ? GestureDetector(
                                    child: Icon(Icons.cancel_outlined),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: 100.0,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('삭제하시겠습니까?'),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              PRIMARY_COLOR[
                                                                  grade],
                                                          elevation: 0,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          '취소',
                                                          style: TextStyle(
                                                            color:
                                                                (grade == 0 ||
                                                                        grade ==
                                                                            1 ||
                                                                        grade ==
                                                                            2 ||
                                                                        grade ==
                                                                            4 ||
                                                                        grade ==
                                                                            8)
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              PRIMARY_COLOR[
                                                                  grade],
                                                          elevation: 0,
                                                        ),
                                                        onPressed: () {
                                                          /*
                                                        delete: 댓글 삭제하는 코드
                                                         */
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  Contents(
                                                                loginID: widget
                                                                    .loginID,
                                                                board: widget
                                                                    .board,
                                                                title: widget
                                                                    .title,
                                                                contents: widget
                                                                    .contents,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Text(
                                                          '확인',
                                                          style: TextStyle(
                                                            color:
                                                                (grade == 0 ||
                                                                        grade ==
                                                                            1 ||
                                                                        grade ==
                                                                            2 ||
                                                                        grade ==
                                                                            4 ||
                                                                        grade ==
                                                                            8)
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                          ),
                                                        ),
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
                                  )
                                : SizedBox()
                          ],
                        ),
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
                                border: InputBorder.none,
                              ),
                              maxLines: 5,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grade == 0
                                  ? Colors.grey.withOpacity(0.2)
                                  : PRIMARY_COLOR[grade],
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              /*
                            insert: 해당 게시글에 댓글을 추가하는 코드
                             */
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Contents(
                                      loginID: widget.loginID,
                                      board: widget.board,
                                      title: widget.title,
                                      contents: widget.contents),
                                ),
                              );
                            },
                            child: Text(
                              '댓글쓰기',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          );
        });
  }
}
