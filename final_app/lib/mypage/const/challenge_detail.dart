import 'package:final_app/mypage/const/videoPlayer.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class ChallengeDetail extends StatelessWidget {
  final exercise;
  final num;
  final date;
  const ChallengeDetail({
    required this.date,
    required this.exercise,
    required this.num,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //게시글 번호를 통해 이미지와 내용을 구함
    String image1 = 'https://www.youtube.com/watch?v=3ZUh-GiRDjM';
    String image2 =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
    String video1 =
        '/data/user/0/com.example.final_app/cache/image_picker3641971445983601714.mp4';
    String contents =
        '이동영상으로말할것같으면제가열심히운동을한결과인데요아주열심히저무게를들었습니다진짜얼마나힘들었을지상상이나가십니까';
    int grade = 5;

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
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
