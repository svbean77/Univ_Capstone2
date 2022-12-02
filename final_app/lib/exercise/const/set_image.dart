import 'dart:convert';

import 'package:final_app/exercise/exercise_guide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class LoadImage extends StatelessWidget {
  final loginID;
  final dir;
  final row;
  final col;
  final onTap;

  const LoadImage({
    required this.onTap,
    required this.loginID,
    required this.dir,
    required this.col,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'asset/images/$dir/row-$row-column-$col.png',
        width: MediaQuery.of(context).size.width / 10,
      ),
    );
  }
}

class SetImage extends StatelessWidget {
  final loginID;
  final dir;
  final col;
  final muscleLst;
  final level;
  final grade;

  SetImage({
    required this.loginID,
    required this.dir,
    required this.col,
    required this.muscleLst,
    required this.level,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, String> mapExNum = {
      1: "이두",
      2: "가슴",
      3: '대퇴 사두근',
      4: '승모근',
      5: '삼두',
      6: '어깨',
      7: '광배근',
      8: '대퇴 이두근',
      9: '둔근',
      10: '전완근',
      11: '종아리',
      12: '복근',
      13: '등 하부',
      14: '등 중앙부',
      15: '복사근'
    };

    return Column(
      children: [
        for (int i = 1; i <= 16; i++)
          LoadImage(
            onTap: () async {
              if (muscleLst[i - 1] == 0)
                Navigator.of(context).noSuchMethod;
              else {
                String muscle = mapExNum[muscleLst[i - 1]]!;
                var url = Uri.http(
                    IP_ADDRESS, '/exercise_guide.php', {'q': '{http}'});
                var response = await http.post(url, body: <String, String>{
                  "muscle": muscle.toString(),
                  "equipment": '덤벨'.toString(),
                  "difficulty": level.toString(),
                });
                var jsondata = json.decode(json.encode(response.body));
                if (jsondata.toString() == "Success")
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExerciseGuide(
                        level: level,
                        jsondata: jsondata,
                        muscle: muscle,
                        equipment: '덤벨',
                        loginID: loginID,
                        grade: grade,
                      ),
                    ),
                  );
              }
            },
            dir: dir,
            col: col,
            row: i,
            loginID: loginID,
          ),
      ],
    );
  }
}
