import 'dart:convert';

import 'package:final_app/community/const/contents.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/ip_address.dart';

class WriteBoard extends StatefulWidget {
  /*
  여기 사진도 보내서 가장 처음에 file에 추가해야겠다 (수정도 있으니까)
   */
  final loginID;
  String content;
  String title;
  final board;
  final grade;
  final mode;
  WriteBoard({
    required this.board,
    required this.grade,
    required this.mode,
    required this.loginID,
    required this.content,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<WriteBoard> createState() => _WriteBoardState();
}

class _WriteBoardState extends State<WriteBoard> {
  List<File> files = []; //방법1: 파일로 리스트 부름
  final GlobalKey<FormState> titleFormKey = GlobalKey();
  final GlobalKey<FormState> contentFormKey = GlobalKey();

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
    return FutureBuilder(
        future: getDatas(widget.loginID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //snapshot.data[0].result![0].apptheme;
          }
          return Scaffold(
            appBar: MyAppBar(grade: widget.grade),
            drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
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
                            padding: EdgeInsets.only(left: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: widget.grade == 0
                                    ? Colors.grey.withOpacity(0.2)
                                    : PRIMARY_COLOR[widget.grade],
                              ),
                            ),
                            child: Form(
                              key: titleFormKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                maxLines: 15,
                                initialValue: widget.title ?? '',
                                onChanged: (String? val) {
                                  widget.title = val!;
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
                      padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.grade == 0
                              ? Colors.grey.withOpacity(0.2)
                              : PRIMARY_COLOR[widget.grade],
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
                          onChanged: (String? val) {
                            widget.content = val!;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          PickedFile? pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                          setState(() {
                            files.add(File(pickedFile!.path));
                          });
                          print(files[0]);
                        },
                        child: Text(
                          '갤러리',
                          style: TextStyle(
                              color: (widget.grade == 0 ||
                                  widget.grade == 1 ||
                                  widget.grade == 2 ||
                                  widget.grade == 4 ||
                                  widget.grade == 8)
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: PRIMARY_COLOR[widget.grade], elevation: 0),
                      ),
                      SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () async {
                          PickedFile? pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.camera);
                          setState(() {
                            files.add(File(pickedFile!.path));
                          });
                        },
                        child: Text(
                          '카메라',
                          style: TextStyle(
                              color: (widget.grade == 0 ||
                                  widget.grade == 1 ||
                                  widget.grade == 2 ||
                                  widget.grade == 4 ||
                                  widget.grade == 8)
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: PRIMARY_COLOR[widget.grade], elevation: 0),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 100.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0; i < files.length; i++)
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(files[i]), //File Image를 삽입
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      /*
                    final saveTitle = titleController.text.toString();
                    final saveContent = contentsController.text.toString();
                    사진들도 저장하도록 코드 작성
                     */
                      String saveTitle =
                          '완전길게글제목을지어보자어떻게까지나오나한번해보는거야이거는그냥텍스ㅡㅌ로해서길게나오도록해엑ㅆ구ㅏㅁ';
                      String saveContent =
                      '''완\n전\n긴\n내\n용\n의\n글\n을\n써\n보\n자\n이\n번\n엔\n몇\n줄\n이\n나\n될\n까\n알\n아\n맞\n춰\n봅\n시\n다''';

                      if (widget.mode == 'edit') {
                        /*
                      board == free: 자유게시판, board == qna: 질의응답게시판
                      update: 에 글을 수정(update)하는 코드
                      변경목록: 제목, 내용
                       */
                      } else {
                        /*
                      board == free: 자유게시판, board == qna: 질의응답게시판
                      insert: 에 새로운 글을 저장(insert)하는 코드
                      들어갈 목록: 제목, 내용, 사진, 작성자, 작성일자
                      contents에게 제목, 내용, 작성자, 작성일자, 조회수, 사진이름, 사진경로 다 보내야 함!
                       */
                      }
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Contents(
                            loginID: widget.loginID,
                            title: saveTitle,
                            contents: saveContent,
                            board: widget.board,
                            grade: widget.grade,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      '저장',
                      style: TextStyle(
                          color: (widget.grade == 0 ||
                              widget.grade == 1 ||
                              widget.grade == 2 ||
                              widget.grade == 4 ||
                              widget.grade == 8)
                              ? Colors.black
                              : Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: PRIMARY_COLOR[widget.grade], elevation: 0),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
