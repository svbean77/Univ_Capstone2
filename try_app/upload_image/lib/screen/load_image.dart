import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
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
  List<File> imageFile = [];
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
                    if (imageFile.length == 0) {
                      PickedFile? pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      setState(() {
                        imageFile.add(File(pickedFile!.path));
                      });
                      print(imageFile[0]);
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
                    if (imageFile.length == 0) {
                      PickedFile? pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.camera);
                      setState(() {
                        imageFile.add(File(pickedFile!.path));
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
                  for (int i = 0; i < imageFile.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(imageFile[i]), //File Image를 삽입
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
                var stream = new http.ByteStream(
                    DelegatingStream.typed(imageFile[0].openRead()));
                var length = await imageFile[0].length();

                if (imageFile.length != 0) print(imageFile[0]);
                var url = Uri.http("아이피주소", '/파일이름.php', {'q': '{http}'});

                var request = new http.MultipartRequest("POST", url);

                var multipartFile = new http.MultipartFile(
                    "freefilename", stream, length,
                    filename: basename(imageFile[0].path));

                request.files.add(multipartFile);
                request.fields['freetitle'] = title.toString();
                request.fields['freecontent'] = content.toString();
                request.fields['freefilepath'] = imageFile[0].path.toString();
                request.fields['freewriter'] = "작성자".toString();

                var respond = await request.send();
                if (respond.statusCode == 200)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                else
                  print("이미지 업로드 실패..");
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
