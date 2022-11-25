import 'dart:convert';

import 'package:flutter/material.dart';

import 'ip_address.dart';
import 'package:http/http.dart' as http;

class TestSelect extends StatelessWidget {
  const TestSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String muscle = "복근";
    String equipment = "맨몸";
    String difficulty = "초보자";

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                select(muscle, equipment, difficulty);
              },
              child: Text('데이터 가져오기~'),
            )
          ],
        ),
      ),
    );
  }

  Future select(String muscle, String equipment, String difficulty) async {
    var url = Uri.http(IP_ADDRESS, '/test_select.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "muscle": muscle.toString(),
      "equipment": equipment.toString(),
      "difficulty": difficulty.toString(),
    });
    var jsondata = json.decode(json.encode(response.body));
    final data = jsonDecode(jsondata);
    print(data.runtimeType);
    print(data);
    print(data['result']);
    print(data['result'][0]);
    print(data['result'][0]['step']);
    print(data['result'][0]['equipment']);
  }
}
