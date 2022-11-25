import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ip_address.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cont1 = TextEditingController();
  TextEditingController cont2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              child: TextField(
                controller: cont1,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 50.0,
              child: TextField(
                controller: cont2,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                insertData();
              },
              child: Text('입력!'),
            ),
          ],
        ),
      ),
    );
  }

  Future insertData() async {
    var url = Uri.http(IP_ADDRESS, '/test_insert.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "col1": cont1.text.toString(),
      "col2": cont2.text.toString(),
    });
    print(cont1.text.toString());
    var data = json.decode(json.encode(response.body));
    print(data);
  }
}
