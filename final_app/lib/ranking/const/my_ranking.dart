import 'dart:convert';

import 'package:final_app/ranking/const/user_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class MyRanking extends StatefulWidget {
  final loginID;
  final nickname;
  const MyRanking({
    required this.nickname,
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<MyRanking> createState() => _MyRankingState();
}

class _MyRankingState extends State<MyRanking> {
  Future getDatas() async {
    var url =
        Uri.http(IP_ADDRESS, '/test_select_all_user.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{});
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);
    return [data];
  }

  String friends = '';
  @override
  Widget build(BuildContext context) {
    /*
    select: loginID의 친구정보, 나의요청정보, 내게요청정보
     */
    List<String> myFriends = ['친구1', '친구2', '친구3'];
    List<String> myRequests = ['유저1', '유저2']; //내가 요청함
    List<String> myRequested = ['요청1', '요청2']; //나한테 요청함

    /*
    조건문 순서: 나야 -> 요청받았어 -> 요청했어 -> 친구가 아니야 -> 친구야
     */

    if (widget.nickname == widget.loginID) {
      friends = 'me';
    } else if (myRequested.contains(widget.nickname)) {
      //나한테 요청함
      friends = 'requested';
    } else if (myRequests.contains(widget.nickname)) {
      //내가 요청함
      friends = 'request';
    } else if (!myFriends.contains(widget.nickname)) {
      friends = 'no';
    } else {
      friends = 'friend';
    }

    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
          int ranking = 0;

          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data[0].result!.length; i++) {
              if (snapshot.data[0].result![i].nickname == widget.nickname)
                ranking = i;
            }
          }
          return Container(
            height: 200.0,
            child: snapshot.hasData
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'asset/images/ranking/${snapshot.data[0].result![ranking].rating}.png',
                              height: 150.0),
                          Text(
                              '${snapshot.data[0].result![ranking].rating} (${ranking + 1}위)'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(widget.nickname,
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 16.0),
                              //친구가 아님
                              friends == 'no'
                                  ? GestureDetector(
                                      onTap: () {
                                        /*
                                insert: 친구요청 (내가 친구를 요청함)
                                 */
                                        setState(() {
                                          friends = 'request';
                                        });
                                      },
                                      child: Icon(Icons.person_add, size: 25.0),
                                    )
                                  //친구 요청을 누름
                                  : friends == 'request'
                                      ? GestureDetector(
                                          child: Icon(Icons.schedule_send,
                                              size: 25.0),
                                        )
                                      //친구 요청을 받음
                                      : friends == 'requested'
                                          ? GestureDetector(
                                              onTap: () {
                                                /*
                                        insert: 친구 목록에 추가
                                         */
                                                /*
                                        delete: 친구 요청 목록에서 삭제
                                         */
                                                setState(() {
                                                  friends = 'friend';
                                                });
                                              },
                                              child: Icon(
                                                  Icons.check_circle_outline,
                                                  size: 25.0),
                                            )
                                          //이미 친구이거나 내 정보
                                          : Container(width: 0.0)
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              '3대 총합: ${snapshot.data[0].result![ranking].total}kg',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text(
                              '데드리프트: ${snapshot.data[0].result![ranking].deadlift}kg'),
                          Text(
                              '벤치프레스: ${snapshot.data[0].result![ranking].benchpress}kg'),
                          Text(
                              '스쿼트: ${snapshot.data[0].result![ranking].squat}kg'),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }
}
