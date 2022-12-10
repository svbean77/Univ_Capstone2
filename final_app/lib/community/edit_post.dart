import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:final_app/community/const/community_main.dart';
import 'package:final_app/community/const/contents.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:final_app/screen/const/my_toast.dart';
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
  String? filename;
  final id;
  final board;
  final grade;
  EditPost({
    required this.image,
    required this.board,
    required this.grade,
    required this.id,
    required this.loginID,
    required this.filename,
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
    if (widget.filename != null) {
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
                        borderRadius: BorderRadius.circular(10),
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
                  borderRadius: BorderRadius.circular(10),
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
                    MyShortToast(context, '사진은 한 장만 가능합니다.');
                    await Future.delayed(Duration(milliseconds: 700));
                    if (files.length == 0) {
                      PickedFile? pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      setState(() {
                        files.add(File(pickedFile!.path));
                      });
                    }
                  },
                  child: MyText(text: "갤러리", grade: widget.grade),
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR[widget.grade], elevation: 0),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    MyShortToast(context, '사진은 한 장만 가능합니다.');
                    await Future.delayed(Duration(milliseconds: 700));
                    if (files.length == 0) {
                      PickedFile? pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.camera);
                      setState(() {
                        files.add(File(pickedFile!.path));
                      });
                    }
                  },
                  child: MyText(text: "카메라", grade: widget.grade),
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR[widget.grade], elevation: 0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            files.length != 0
                ? Row(
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(files[0]), //File Image를 삽입
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                if (widget.title.toString() != "" &&
                    widget.content.toString() != "") {
                  MyShortToast(context, '업로드!');

                  var url;
                  var data;
                  if (widget.board == 'free')
                    url = "http://${IP_ADDRESS}/test_change_freeboard.php";
                  else
                    url = "http://${IP_ADDRESS}/test_change_qnaboard.php";

                  if (files.length != 0) {
                    String filename;
                    if (files[0].toString().contains("image_picker"))
                      filename = files[0].toString().substring(
                          files[0].toString().indexOf("image_picker"),
                          files[0].toString().length - 1);
                    else
                      filename =
                          Random().nextInt(4294967296).toString() + ".jpg";

                    List<int> imgByte = files[0]!.readAsBytesSync();
                    String img = base64Encode(imgByte);

                    var response = await http.post(Uri.parse(url), body: {
                      'image': img,
                      'title': widget.title.toString(),
                      'content': widget.content.toString(),
                      'filename': filename.toString(),
                      'id': widget.id.toString(),
                    });
                    data = json.decode(json.encode(response.body));
                  } else {
                    var response = await http.post(Uri.parse(url), body: {
                      'image': "no",
                      'title': widget.title..toString(),
                      'content': widget.content.toString(),
                      'filename': "no",
                      'id': widget.id.toString(),
                    });
                    data = json.decode(json.encode(response.body));
                  }
                  if (data.toString() == "Success")
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => CommunityMain(
                            loginID: widget.loginID, grade: widget.grade),
                      ),
                    );
                } else {
                  MyShortToast(context, '모든 칸을 채워주세요.');
                }
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
