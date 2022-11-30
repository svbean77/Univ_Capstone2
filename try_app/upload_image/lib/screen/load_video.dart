import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image/screen/home_screen.dart';

class LoadVideo extends StatefulWidget {
  const LoadVideo({Key? key}) : super(key: key);

  @override
  State<LoadVideo> createState() => _LoadVideoState();
}

class _LoadVideoState extends State<LoadVideo> {
  List<File> files = [];
  final TextEditingController contentsController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('제목', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Container(
              height: 100.0,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: InputBorder.none,
                  ),
                  maxLines: 15,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text('내용', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Container(
              height: 300.0,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
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
                if (files.length == 0) {
                  PickedFile? pickedFile =
                      await ImagePicker().getVideo(source: ImageSource.gallery);
                  setState(() {
                    files.add(File(pickedFile!.path));
                  });
                  print(files[0]);
                } else {
                  print("동영상은 한 개만 가능이여ㅠㅠ");
                }
              },
              child: Text(
                '갤러리',
              ),
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
              onPressed: () async {
                print(titleController.text.toString());
                print(contentsController.text.toString());
                if (files.length != 0) {
                  if (files.length != 0) print(files[0]);
                  var url = Uri.http("아이피주소", '/파일이름.php', {'q': '{http}'});
                  var response = await http.post(url, body: <String, String>{
                    "title": titleController.text.toString(),
                    "content": contentsController.text.toString(),
                    "filepath": files[0].toString(),
                    "writer": "작성자",
                  });
                  var jsondata =
                      jsonDecode(json.decode(json.encode(response.body)));

                  if (jsondata == "Success")
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                    );
                } else {
                  print("동영상은 필수요!");
                }
              },
              child: Text(
                '저장',
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
                child: Text('홈으로')),
          ],
        ),
      ),
    );
  }
}
