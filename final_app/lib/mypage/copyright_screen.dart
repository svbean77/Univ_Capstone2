import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/const/app_bar.dart';

class CopyrightScreen extends StatelessWidget {
  final grade;
  final muscleUrl;
  final armUrl;
  final appleUrl;
  final ratingUrl;
  final exerciseUrl;
  final routineUrl;
  final myroutineUrl;
  const CopyrightScreen({
    required this.grade,
    this.muscleUrl = 'https://musclewiki.com/',
    this.armUrl =
        'https://www.flaticon.com/kr/free-icon/exercise_863646?term=%EC%9A%B4%EB%8F%99&page=1&position=32&page=1&position=32&related_id=863646&origin=search',
    this.appleUrl =
        'https://www.flaticon.com/kr/free-icon/apple_1202063?term=%EC%82%AC%EA%B3%BC&page=1&position=11&page=1&position=11&related_id=1202063&origin=search',
    this.ratingUrl =
        'https://namu.wiki/w/%EB%A6%AC%EA%B7%B8%20%EC%98%A4%EB%B8%8C%20%EB%A0%88%EC%A0%84%EB%93%9C/%EB%9E%AD%ED%81%AC%20%EA%B2%8C%EC%9E%84#s-7',
    this.routineUrl =
        'https://www.flaticon.com/free-icon/dumbbell_3349694?related_id=3349694&origin=search',
    this.myroutineUrl =
        'https://www.flaticon.com/free-icon/plan_525866?term=exercise&page=1&position=76&page=1&position=76&related_id=525866&origin=search',
    this.exerciseUrl =
        'https://www.flaticon.com/kr/free-icon/gym_5114256?k=1670254259270&sign-up=google',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('저작권 출처', style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 8.0),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(muscleUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('운동 이미지 및 설명'),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(ratingUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('등급 이미지'),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(armUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('팔 근육 아이콘'),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(appleUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('사과 아이콘'),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(exerciseUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('부위별 운동 아이콘'),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(routineUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('루틴 아이콘'),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchBrowser(myroutineUrl);
                    },
                    child: Icon(Icons.link),
                  ),
                  SizedBox(width: 8.0),
                  Text('내 루틴 아이콘'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchBrowser(String path) async {
    await launch(path, forceWebView: false);
  }
}
