import 'dart:convert';

import 'package:flutter/material.dart';

import 'ip_address.dart';
import 'package:http/http.dart' as http;

class TestDelete extends StatelessWidget {
  final col1;
  final col2;
  const TestDelete({
    required this.col1,
    required this.col2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                delete1();
              },
              child: Text('col1을 기준으로 삭제!'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                delete2();
              },
              child: Text('col2를 기준으로 삭제!'),
            ),
          ],
        ),
      ),
    );
  }

  Future delete1() async {
    var url = Uri.http(IP_ADDRESS, '/test_delete1.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "col1": col1.toString(),
    });
    var data = json.decode(json.encode(response.body));
    print(data);
  }
  Future delete2() async {
    var url = Uri.http(IP_ADDRESS, '/test_delete2.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "col2": col2.toString(),
    });
    var data = json.decode(json.encode(response.body));
    print(data);
  }
}
