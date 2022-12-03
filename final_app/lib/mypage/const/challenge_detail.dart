import 'dart:convert';
import 'dart:io';

import 'package:final_app/mypage/const/videoPlayer.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

import '../../screen/const/grade_colors.dart';

class ChallengeDetail extends StatelessWidget {
  final loginID;
  final data;
  final directory;
  final grade;
  const ChallengeDetail({
    required this.loginID,
    required this.directory,
    required this.data,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? imgFile;
    if (data.filename != null) {
      imgFile = File("${directory.path}/${data.filename}");
      imgFile.writeAsBytes(base64Decode(data.data));
    }

    print(data.data.replaceAll("\n",""));
    print(base64Decode(data.data.replaceAll("\n","")));
    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(loginID: loginID, grade: grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MyText(text: data.title, grade: grade, size: "20"),
            SizedBox(height: 16.0),
            Text(data.content),
            SizedBox(height: 8.0),
            data.filename == null
                ? Container()
                : myVideo(file: imgFile!),
          ],
        ),
      ),
    );
  }
}
