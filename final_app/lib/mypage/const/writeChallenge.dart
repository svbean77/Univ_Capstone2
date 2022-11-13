import 'package:final_app/mypage/const/challenge_main.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController weightController = TextEditingController();
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
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grade == 0
                        ? Colors.black.withOpacity(0.2)
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
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('무게', style: TextStyle(fontSize: 20.0)),
                  SizedBox(width: 16.0),
                  Container(
                    width: 150,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grade == 0
                            ? Colors.black.withOpacity(0.2)
                            : PRIMARY_COLOR[grade],
                      ),
                    ),
                    child: TextField(
                      controller: weightController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
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
            ElevatedButton(
              onPressed: () {
                //db에 게시글 저장하는 코드
                //final saveWeight = int.parse(weightController.text.toString());
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