import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image/screen/home_screen.dart';

class LoadImage extends StatefulWidget {
  LoadImage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadImage> createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  List<File> files = [];
  final GlobalKey<FormState> titleFormKey = GlobalKey();
  final GlobalKey<FormState> contentFormKey = GlobalKey();
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 50.0,
              width: double.infinity,
              child: Row(
                children: [
                  Text('제목', style: TextStyle(fontSize: 20.0)),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Form(
                        key: titleFormKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: 15,
                          initialValue: title ?? '',
                          onChanged: (String? val) {
                            title = val!;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text('내용', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Container(
              height: 300.0,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Form(
                  key: contentFormKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    maxLines: 15,
                    initialValue: content ?? '',
                    onChanged: (String? val) {
                      content = val!;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (files.length == 0) {
                      PickedFile? pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      setState(() {
                        files.add(File(pickedFile!.path));
                      });
                      print(files[0]);
                    } else {
                      print("사진은 한 장만 가능이야!");
                    }
                  },
                  child: Text(
                    '갤러리',
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    if (files.length == 0) {
                      PickedFile? pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.camera);
                      setState(() {
                        files.add(File(pickedFile!.path));
                      });
                    } else {
                      print("사진은 한 장만 가능이야!");
                    }
                  },
                  child: Text(
                    '카메라',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Container(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < files.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(files[i]), //File Image를 삽입
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                print(title);
                print(content);
                if (files.length != 0) print(files[0]);
                var url = Uri.http("아이피주소", '/파일이름.php', {'q': '{http}'});
                var response = await http.post(url, body: <String, String>{
                  "title": title.toString(),
                  "content": content.toString(),
                  "filepath": files.length == 0 ? "no" : files[0].toString(),
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
