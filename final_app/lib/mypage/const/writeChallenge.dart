import 'package:final_app/mypage/const/challenge_main.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class WriteChallenge extends StatefulWidget {
  final loginID;
  final exercise;
  final grade;
  const WriteChallenge({
    required this.exercise,
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<WriteChallenge> createState() => _WriteChallengeState();
}

class _WriteChallengeState extends State<WriteChallenge> {
  List<File> files = [];
  final TextEditingController contentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('내용', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Container(
              height: 300.0,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.grade == 0
                        ? Colors.grey.withOpacity(0.2)
                        : PRIMARY_COLOR[widget.grade],
                  ),
                ),
                child: TextField(
                  controller: contentsController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: InputBorder.none,
                  ),
                  maxLines: 15,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                PickedFile? pickedFile =
                await ImagePicker().getVideo(source: ImageSource.gallery);
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
            Container(
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  for (int i = 0; i < files.length; i++)
                    Text(files[i].toString()),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                /*
                insert: 오늘 날짜, loginID, 내용, 영상 저장 (영상은 항상 있어야하는데!!)
                 */
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChallengeMain(
                      exercise: widget.exercise,
                      loginID: widget.loginID,
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
  }
}
