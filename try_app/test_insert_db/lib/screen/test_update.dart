import 'dart:convert';

import 'package:flutter/material.dart';

import 'ip_address.dart';
import 'package:http/http.dart' as http;


class TestUpdate extends StatefulWidget {
  final col1;
  final col2;
  const TestUpdate({
    required this.col1,
    required this.col2,
    Key? key,
  }) : super(key: key);

  @override
  State<TestUpdate> createState() => _TestUpdateState();
}

class _TestUpdateState extends State<TestUpdate> {
  TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String column1 = widget.col1;
    int column2 = widget.col2;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cont,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                delete1(column1);
              },
              child: Text('col1을 기준으로 업데이트! (col1의 값을 바꿔보자)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                delete2(column2);
              },
              child: Text('col2를 기준으로 업데이트! (col2의 값을 바꿔보자'),
            ),
          ],
        ),
      ),
    );
  }

  Future delete1(String column1) async {
    var url = Uri.http(IP_ADDRESS, '/test_update1.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "col1": column1.toString(),  //widget.으로 가져오니까 변경이 안되네..
      "value": cont.text.toString(),
    });
    var data = json.decode(json.encode(response.body));
    print(data);
  }

  Future delete2(int column2) async {
    var url = Uri.http(IP_ADDRESS, '/test_update2.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "col2": column2.toString(),
      "value": cont.text.toString(),
    });
    var data = json.decode(json.encode(response.body));
    print(data);
  }
}
