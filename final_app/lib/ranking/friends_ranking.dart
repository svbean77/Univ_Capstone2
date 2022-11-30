import 'dart:convert';

import 'package:final_app/ranking/const/ranking_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/ip_address.dart';

class FriendsRanking extends StatefulWidget {
  final loginID;
  final grade;
  const FriendsRanking({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<FriendsRanking> createState() => _FriendsRankingState();
}

class _FriendsRankingState extends State<FriendsRanking> {
  Future getDatas() async {
    var url =
        Uri.http(IP_ADDRESS, '/test_select_all_friends.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    /*
    select: 친구인 사용자 정보
     */
    List<String> nickname = ['친구1', '친구2', '친구3', '친구4', '친구5'];
    List<String> rating = ['챌린저', '다이아몬드', '골드', '브론즈', '아이언'];
    List<int> total3th = [500, 380, 220, 190, 80];

    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: ListView(
                children: [
                  if (snapshot.hasData)
                    if (snapshot.data.result!.length != 0)
                      for (int i = 0; i < snapshot.data.result!.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: RankingCard(
                            grade: widget.grade,
                            loginID: widget.loginID,
                            nickname: snapshot.data.result![i].nickname,
                            rating: snapshot.data.result![i].rating,
                            ranking: i + 1,
                            total3th: snapshot.data.result![i].total,
                          ),
                        )
                    else
                      Center(child: Text('친구 목록 없습니다.'))
                  else
                    Center(child: CircularProgressIndicator())
                ],
              ),
            ),
          );
        });
  }
}
