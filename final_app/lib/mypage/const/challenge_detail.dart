import 'package:final_app/mypage/const/videoPlayer.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

import '../../screen/const/grade_colors.dart';

class ChallengeDetail extends StatelessWidget {
  /*
  해당 게시글의 내용이 모두 개별 단위로 옴 [i]로 전달이니까
  영상은 없으면 안되게 해야 함
   */
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
  Widget build(BuildContext context) {
    String video1 =
        '/data/user/0/com.example.final_app/cache/image_picker3641971445983601714.mp4';

    if(data.filename != null){
      //base64 to video
    }

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
            myVideo(file: video1),
          ],
        ),
      ),
    );
  }
}
