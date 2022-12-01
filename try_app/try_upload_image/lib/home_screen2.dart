import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();

  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  /*
  Future uploadImage() async {
    final uri = Uri.parse("http://192.168.32.82/please_upload.php");
    var request = http.MultipartRequest('POST', uri);

    var pic = await http.MultipartFile.fromString('image', _image!.path);

    request.files.add(pic);

    var response = await request.send();

    print(response);
    print(pic);

    if (response.statusCode == 200) {
      print('이미지 업로드 성공');
    } else {
      print('이미지 업로드 실패');
    }
  }

   */
  Future<void> uploadImage() async {
    // file picker를 통해 파일 선택
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filePath = result.files.single.path;

      // 파일 경로를 통해 formData 생성
      var dio = Dio();
      var formData = FormData.fromMap({
        'file' : await MultipartFile.fromFile(filePath!)
      });

      // 업로드 요청
      final response = await dio.post('/please_upload', data: formData);

    } else {
      // 아무런 파일도 선택되지 않음.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                choiceImage();
              },
              child: Text('갤러리'),
            ),
            Container(
              child: _image == null ? Text('') : Image.file(_image!),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () {
                  uploadImage();
                },
                child: Text('업로드하기!!! 제발!!')),
          ],
        ),
      ),
    );
  }
}
