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
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_all_friends.php");
    /*
    var url =
        Uri.http(IP_ADDRESS, '/test_select_all_friends.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: snapshot.hasData
                  ? ListView(
                      children: [
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
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 8.0),
                        Text('데이터를 불러오고 있습니다..'),
                      ],
                    ),
            ),
          );
        });
  }
}
