import 'dart:convert';

import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class RankingCard extends StatelessWidget {
  final loginID;
  final nickname;
  final rating;
  final total3th;
  final ranking;
  final grade;

  const RankingCard({
    required this.grade,
    required this.loginID,
    required this.nickname,
    required this.rating,
    required this.ranking,
    required this.total3th,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var url = Uri.parse("http://${IP_ADDRESS}/test_select_userdata.php");
        /*
        var url =
            Uri.http(IP_ADDRESS, '/test_select_userdata.php', {'q': '{http}'});

         */
        var response = await http.post(url, body: <String, String>{
          "username": nickname.toString(),
          "mode": "Nickname".toString(),
        });
        var jsondata = jsonDecode(json.decode(json.encode(response.body)));
        USERDATA data = USERDATA.fromJson(jsondata);

        var url2 =
            Uri.parse("http://${IP_ADDRESS}/test_select_exercise_record.php");
        /*
        var url2 = Uri.http(
            IP_ADDRESS, '/test_select_exercise_record.php', {'q': '{http}'});

         */
        var response2 = await http.post(url2, body: <String, String>{
          "nickname": nickname.toString(),
        });
        var jsondata2 = jsonDecode(json.decode(json.encode(response2.body)));
        MY_EXERCISE_RECORD data2 = MY_EXERCISE_RECORD.fromJson(jsondata2);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => UserInfo(
              userdata: data.result!,
              recorddata: data2.result!,
              loginID: loginID,
              grade: grade,
            ),
          ),
        );
      },
      child: MyContainer(
        height: 70.0,
        width: double.infinity,
        grade: grade,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('asset/images/ranking/$rating.png'),
                Text(' $ranking위 $nickname',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
            Text('$rating  ${total3th}kg'),
          ],
        ),
      ),
    );
  }
}
