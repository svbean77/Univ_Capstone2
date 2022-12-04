import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:final_app/mypage/const/videoPlayer.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

import '../../screen/const/grade_colors.dart';

class ChallengeDetail extends StatefulWidget {
  final loginID;
  final data;

  final grade;
  const ChallengeDetail({
    required this.loginID,
    required this.data,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<ChallengeDetail> createState() => _ChallengeDetailState();
}

class _ChallengeDetailState extends State<ChallengeDetail> {
  Future getDatas() async {
    final _directory = await getTemporaryDirectory();
    File? imgFile;
    if (widget.data.filename != null) {
      imgFile = new File("${_directory.path}/${widget.data.filename}");
      imgFile.writeAsBytes(base64Decode(widget.data.data));
    }
    return imgFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: getDatas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.path);
              }
              /*
              File? imgFile;
              if (snapshot.hasData) {

                if (widget.data.filename != null) {
                  imgFile =
                      File("${snapshot.data.path}/${widget.data.filename}");
                  imgFile.writeAsBytes(base64Decode(widget.data.data));
                }
              }

               */
              return ListView(
                children: [
                  Text('제목',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  Text(widget.data.title, style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 16.0),
                  Text('내용',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.0),
                  Text(widget.data.content),
                  SizedBox(height: 8.0),
                  snapshot.hasData
                      ? myVideo(file: snapshot.data!)
                      : Container(),
                ],
              );
            }),
      ),
    );
  }
}
