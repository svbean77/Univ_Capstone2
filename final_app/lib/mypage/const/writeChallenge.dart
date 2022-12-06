import 'dart:convert';

import 'package:final_app/mypage/three_challenge.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class WriteChallenge extends StatefulWidget {
  final loginID;
  final grade;
  const WriteChallenge({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<WriteChallenge> createState() => _WriteChallengeState();
}

class _WriteChallengeState extends State<WriteChallenge> {
  List<File> files = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController contentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  Text('제목',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
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
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text('내용',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
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
                child: TextFormField(
                  controller: contentsController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  maxLines: 15,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (files.length == 0) {
                  MyToast(
                      '사진은 한 장만 가능합니다.',
                      PRIMARY_COLOR[widget.grade],
                      (widget.grade == 0 ||
                              widget.grade == 1 ||
                              widget.grade == 2 ||
                              widget.grade == 4 ||
                              widget.grade == 8)
                          ? Colors.black
                          : Colors.white);
                  var chooseImage = await ImagePicker()
                      .pickVideo(source: ImageSource.gallery);
                  setState(() {
                    files.add(File(chooseImage!.path));
                  });
                } else {
                  MyToast(
                      '동영상은 하나만 가능합니다.',
                      PRIMARY_COLOR[widget.grade],
                      (widget.grade == 0 ||
                              widget.grade == 1 ||
                              widget.grade == 2 ||
                              widget.grade == 4 ||
                              widget.grade == 8)
                          ? Colors.black
                          : Colors.white);
                }
              },
              child: MyText(text: "갤러리", grade: widget.grade),
              style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[widget.grade], elevation: 0),
            ),
            files.length != 0
                ? Container(
                    height: 50.0,
                    child: Text(files[0].toString()),
                  )
                : Container(),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.toString().length != 0 &&
                    contentsController.text.toString() != "") {
                  var data;
                  var url = "http://${IP_ADDRESS}/test_add_threeboard.php";

                  MyToast(
                      '업로드!',
                      PRIMARY_COLOR[widget.grade],
                      (widget.grade == 0 ||
                              widget.grade == 1 ||
                              widget.grade == 2 ||
                              widget.grade == 4 ||
                              widget.grade == 8)
                          ? Colors.black
                          : Colors.white);

                  if (files.length != 0) {
                    String filename = files[0].toString().substring(
                        files[0].toString().indexOf("image_picker"),
                        files[0].toString().length - 1);

                    List<int> imgByte = files[0]!.readAsBytesSync();
                    String img = base64Encode(imgByte);

                    var response = await http.post(Uri.parse(url), body: {
                      'image': img,
                      'title': titleController.text.toString(),
                      'content': contentsController.text.toString(),
                      'filename': filename.toString(),
                      'writer': widget.loginID.toString(),
                    });
                    data = json.decode(json.encode(response.body));
                  } else {
                    var response = await http.post(Uri.parse(url), body: {
                      'image': "no",
                      'title': titleController.text.toString(),
                      'content': contentsController.text.toString(),
                      'filename': "no",
                      'writer': widget.loginID.toString(),
                    });
                    data = json.decode(json.encode(response.body));
                  }

                  if (data.toString() == "Success")
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ThreeChallenge(
                            loginID: widget.loginID, grade: widget.grade),
                      ),
                    );
                } else {
                  MyToast(
                      '모든 칸을 채워주세요.',
                      PRIMARY_COLOR[widget.grade],
                      (widget.grade == 0 ||
                              widget.grade == 1 ||
                              widget.grade == 2 ||
                              widget.grade == 4 ||
                              widget.grade == 8)
                          ? Colors.black
                          : Colors.white);
                }
              },
              child: MyText(text: "저장", grade: widget.grade),
              style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[widget.grade], elevation: 0),
            ),
          ],
        ),
      ),
    );
  }
}
