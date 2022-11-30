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
    int ranking = 0;
    List<String> friendsLst = [];
    List<String> requestLst = [];
    List<String> requestedLst = [];

    // 모든 사용자: 순위를 구하기 위해 사용
    var url =
        Uri.http(IP_ADDRESS, '/test_select_all_user.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{});
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);

    //친구: 친구이면 아이콘을 보이지 않음
    var url2 =
        Uri.http(IP_ADDRESS, '/test_select_all_friends.php', {'q': '{http}'});
    var response2 = await http.post(url2, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata2 = jsonDecode(json.decode(json.encode(response2.body)));
    USERDATA data2 = USERDATA.fromJson(jsondata2);

    //내가 한 요청: 대기중 아이콘을 보임
    var url3 =
        Uri.http(IP_ADDRESS, '/test_select_requested.php', {'q': '{http}'});
    var response3 = await http.post(url3, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata3 = jsonDecode(json.decode(json.encode(response3.body)));
    REQUESTED data3 = REQUESTED.fromJson(jsondata3);

    //내가 받은 요청: 수락 아이콘을 보임
    var url4 =
        Uri.http(IP_ADDRESS, '/test_select_request.php', {'q': '{http}'});
    var response4 = await http.post(url4, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata4 = jsonDecode(json.decode(json.encode(response4.body)));
    REQUESTED data4 = REQUESTED.fromJson(jsondata4);

    for(int i = 0; i < data.result!.length; i++){
      if (data.result![i].nickname == widget.nickname)
        ranking = i;
    }
    for (int i = 0; i < data2.result!.length; i++) {
      friendsLst.add(data2.result![i].nickname!);
    }
    for (int i = 0; i < data3.result!.length; i++) {
      requestedLst.add(data3.result![i].request!);
    }
    for (int i = 0; i < data4.result!.length; i++) {
      requestLst.add(data4.result![i].request!);
    }
    return [data, data2, data3, data4];
  }

  String friends = 'no';
  @override
  Widget build(BuildContext context) {
    /*
    조건문 순서: 나야 -> 요청받았어 -> 요청했어 -> 친구가 아니야 -> 친구야
     */
    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
          int ranking = 0;
          List<String> friendsLst = [];
          List<String> requestLst = [];
          List<String> requestedLst = [];

          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data[0].result!.length; i++) {
              if (snapshot.data[0].result![i].nickname == widget.nickname)
                ranking = i;
            }
            for (int i = 0; i < snapshot.data[1].result!.length; i++) {
              friendsLst.add(snapshot.data[1].result![i].nickname);
            }
            for (int i = 0; i < snapshot.data[2].result!.length; i++) {
              requestedLst.add(snapshot.data[2].result![i].request);
            }
            for (int i = 0; i < snapshot.data[3].result!.length; i++) {
              requestLst.add(snapshot.data[3].result![i].request);
            }

            if (widget.loginID == widget.nickname)
              friends = "me";
            else if (friendsLst.contains(widget.nickname))
              friends = "friend";
            else if (requestedLst.contains(widget.nickname))
              friends = "requested";
            else if (requestLst.contains(widget.nickname)) friends = "request";
          }
          print(friends);
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
                                                  friends = 'request';
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
