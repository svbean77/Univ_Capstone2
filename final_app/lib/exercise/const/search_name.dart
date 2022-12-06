import 'dart:convert';

import 'package:final_app/exercise/exercise_guide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class SearchName extends StatelessWidget {
  final loginID;
  final name;
  final level;
  final grade;
  const SearchName({
    required this.loginID,
    required this.name,
    required this.level,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(name, style: TextStyle(fontSize: 18.0)),
        onTap: () async {
          var url = Uri.parse("http://${IP_ADDRESS}/exercise_guide.php");
          /*
          var url =
              Uri.http(IP_ADDRESS, '/exercise_guide.php', {'q': '{http}'});

           */
          var response = await http.post(url, body: <String, String>{
            "muscle": name.toString(),
            "equipment": '덤벨'.toString(),
            "difficulty": level.toString(),
          });
          var jsondata = jsonDecode(json.decode(json.encode(response.body)));

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => ExerciseGuide(
                  level: level,
                  jsondata: jsondata,
                  muscle: name,
                  equipment: '덤벨',
                  loginID: loginID,
                  grade: grade,
                ),
              ),
            );
        },
      ),
    );
  }
}
