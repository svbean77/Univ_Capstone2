import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screen/exercise_guide.dart';
import 'ip_address.dart';

class SearchName extends StatelessWidget {
  final name;
  final level;
  const SearchName({
    required this.name,
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, int> mapExNum = {
      "이두": 1,
      "가슴": 2,
      '대퇴 사두근': 3,
      '승모근': 4,
      '삼두': 5,
      '어깨': 6,
      '광배근': 7,
      '대퇴 이두근': 8,
      '둔근': 9,
      '전완근': 10,
      '종아리': 11,
      '복근': 12,
      '등 하부': 13,
      '등 중앙부': 14,
      '복사근': 15
    };

    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(name),
        onTap: () async {
          var url = Uri.http(IP_ADDRESS, '/test_select.php', {'q': '{http}'});
          var response = await http.post(url, body: <String, String>{
            "muscle": name.toString(),
            "equipment": '맨몸'.toString(),
            "difficulty": level.toString(),
          });
          var jsondata = jsonDecode(json.decode(json.encode(response.body)));

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  ExerciseGuide(level: level, jsondata: jsondata, muscle: name, equipment: '맨몸'),
            ),
          );
        },
      ),
    );
  }
}
