/*
*
*
*
 나중에 게시글 수정할 때 다시 보기! 일단은 패스~
*
*
*
 */

import 'dart:convert';
import 'dart:typed_data';

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

class EditPost extends StatefulWidget {
  /*
  여기 사진도 보내서 가장 처음에 file에 추가해야겠다 (수정도 있으니까)
   */
  final image;
  final loginID;
  String content;
  String title;
  final id;
  final board;
  final grade;
  EditPost({
    required this.image,
    required this.board,
    required this.grade,
    required this.id,
    required this.loginID,
    required this.content,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  List<File> files = [];
  final GlobalKey<FormState> titleFormKey = GlobalKey();
  final GlobalKey<FormState> contentFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (widget.image != null) {
      //files에 사진을 추가 (사진으로 전달받음) File(사진)
      files.add(widget.image);
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
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                  child: MyText(text: "갤러리", grade: widget.grade),
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
                  child: MyText(text: "카메라", grade: widget.grade),
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
                      board == free: 자유게시판, board == qna: 질의응답게시판
                      update: 에 글을 수정(update)하는 코드
                      변경목록: 제목, 내용
                       */
              },
              child: MyText(text: "수정", grade: widget.grade),
              style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[widget.grade], elevation: 0),
            ),
          ],
        ),
      ),
    );
  }
}
