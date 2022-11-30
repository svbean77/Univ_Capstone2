import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upload_image/const/db_class.dart';
import 'package:upload_image/screen/load_image.dart';
import 'package:upload_image/screen/load_video.dart';
import 'package:upload_image/screen/show_image.dart';
import 'package:upload_image/screen/show_video.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    아이디는 게시글 번호를 의미
     */
    int id = 1;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoadImage(),
                  ),
                );
              },
              child: Text('사진 올리러 가기')),
          SizedBox(height: 8.0),
          ElevatedButton(
              onPressed: () async {
                var url = Uri.http("아이피주소", '/파일이름.php', {'q': '{http}'});
                var response = await http.post(url, body: <String, String>{
                  "id": id.toString(),
                });
                var jsondata =
                    jsonDecode(json.decode(json.encode(response.body)));
                UploadData data = UploadData.fromJson(jsondata);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ShowImage(
                      data: data.result![0],
                    ),
                  ),
                );
              },
              child: Text('사진 보러 가기')),
          SizedBox(height: 8.0),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoadVideo(),
                  ),
                );
              },
              child: Text('동영상 올리러 가기')),
          SizedBox(height: 8.0),
          ElevatedButton(
              onPressed: () async {
                var url = Uri.http("아이피주소", '/파일이름.php', {'q': '{http}'});
                var response = await http.post(url, body: <String, String>{
                  "id": id.toString(),
                });
                var jsondata =
                    jsonDecode(json.decode(json.encode(response.body)));
                UploadData data = UploadData.fromJson(jsondata);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ShowVideo(data: data.result![0]),
                  ),
                );
              },
              child: Text('동영상 보러 가기')),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
