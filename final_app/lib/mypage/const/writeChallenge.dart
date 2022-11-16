import 'package:final_app/mypage/const/challenge_main.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class WriteChallenge extends StatefulWidget {
  final exercise;
  const WriteChallenge({
    required this.exercise,
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
    int grade = 5;

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
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
                    color: grade == 0
                        ? Colors.grey.withOpacity(0.2)
                        : PRIMARY_COLOR[grade],
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
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade], elevation: 0),
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
                //db에 게시글 저장하는 코드
                //final saveContent = contentsController.text.toString();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChallengeMain(exercise: widget.exercise),
                  ),
                );
              },
              child: Text(
                '저장',
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
                  primary: PRIMARY_COLOR[grade], elevation: 0),
            ),
          ],
        ),
      ),
    );
  }
}
