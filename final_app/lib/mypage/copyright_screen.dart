import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/const/app_bar.dart';

class CopyrightScreen extends StatelessWidget {
  final grade;
  final muscleUrl;
  final armUrl;
  final appleUrl;
  final ratingUrl;
  const CopyrightScreen({
    required this.grade,
    this.muscleUrl = 'https://musclewiki.com/',
    this.armUrl =
        'https://www.flaticon.com/kr/free-icon/exercise_863646?term=%EC%9A%B4%EB%8F%99&page=1&position=32&page=1&position=32&related_id=863646&origin=search',
    this.appleUrl =
        'https://www.flaticon.com/kr/free-icon/apple_1202063?term=%EC%82%AC%EA%B3%BC&page=1&position=11&page=1&position=11&related_id=1202063&origin=search',
    this.ratingUrl =
        'https://namu.wiki/w/%EB%A6%AC%EA%B7%B8%20%EC%98%A4%EB%B8%8C%20%EB%A0%88%EC%A0%84%EB%93%9C/%EB%9E%AD%ED%81%AC%20%EA%B2%8C%EC%9E%84#s-7',
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
            Text('저작권 출처', style: TextStyle(fontSize: 20.0)),
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
                  Text('운동 이미지'),
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
          ],
        ),
      ),
    );
  }

  launchBrowser(String path) async {
    await launch(path, forceWebView: false);
  }
}
