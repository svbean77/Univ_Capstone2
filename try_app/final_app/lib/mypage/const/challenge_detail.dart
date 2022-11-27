import 'package:final_app/mypage/const/videoPlayer.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class ChallengeDetail extends StatelessWidget {
  /*
  해당 게시글의 내용이 모두 개별 단위로 옴 [i]로 전달이니까
  영상은 없으면 안되게 해야 함
   */
  final loginID;
  final exercise;
  final num;
  final date;
  const ChallengeDetail({
    required this.loginID,
    required this.date,
    required this.exercise,
    required this.num,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    select: 사용자 선택 테마
     */
    String video1 =
        '/data/user/0/com.example.final_app/cache/image_picker3641971445983601714.mp4';
    String contents =
        '이동영상으로말할것같으면제가열심히운동을한결과인데요아주열심히저무게를들었습니다진짜얼마나힘들었을지상상이나가십니까';
    int grade = 5;

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(loginID: loginID),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('${exercise} ${date.year}.${date.month}.${date.day} 기록',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 16.0),
            Text(contents),
            SizedBox(height: 8.0),
            myVideo(file: video1),
          ],
        ),
      ),
    );
  }
}
