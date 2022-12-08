import 'dart:async';
import 'dart:convert';

import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/grade_colors.dart';
import '../../screen/const/ip_address.dart';

class MyRanking extends StatefulWidget {
  final loginID;
  final nickname;
  final grade;
  const MyRanking({
    required this.nickname,
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<MyRanking> createState() => _MyRankingState();
}

class _MyRankingState extends State<MyRanking> {
  StreamController controller = StreamController();
  Timer? _timer;

  Future getDatas() async {
    int ranking = 0;
    List<String> friendsLst = [];
    List<String> requestLst = [];
    List<String> requestedLst = [];

    // 모든 사용자: 순위를 구하기 위해 사용
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_all_user.php");
    /*
    var url =
        Uri.http(IP_ADDRESS, '/test_select_all_user.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{});
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);

    //친구: 친구이면 아이콘을 보이지 않음
    var url2 = Uri.parse("http://${IP_ADDRESS}/test_select_all_friends.php");
    /*
    var url2 =
        Uri.http(IP_ADDRESS, '/test_select_all_friends.php', {'q': '{http}'});

     */
    var response2 = await http.post(url2, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata2 = jsonDecode(json.decode(json.encode(response2.body)));
    USERDATA data2 = USERDATA.fromJson(jsondata2);

    //내가 받은 요청: 수락 아이콘을 보임
    var url3 = Uri.parse("http://${IP_ADDRESS}/test_select_requested.php");
    /*
    var url3 =
        Uri.http(IP_ADDRESS, '/test_select_requested.php', {'q': '{http}'});

     */
    var response3 = await http.post(url3, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata3 = jsonDecode(json.decode(json.encode(response3.body)));
    REQUESTED data3 = REQUESTED.fromJson(jsondata3);

    //내가 한 요청: 대기중 아이콘을 보임
    var url4 = Uri.parse("http://${IP_ADDRESS}/test_select_request.php");
    /*
    var url4 =
        Uri.http(IP_ADDRESS, '/test_select_request.php', {'q': '{http}'});

     */
    var response4 = await http.post(url4, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata4 = jsonDecode(json.decode(json.encode(response4.body)));
    REQUESTED data4 = REQUESTED.fromJson(jsondata4);

    for (int i = 0; i < data.result!.length; i++) {
      if (data.result![i].nickname == widget.nickname) ranking = i;
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

    controller.add([friendsLst, requestedLst, requestLst, ranking, data]);
  }

  @override
  void initState() {
    getDatas();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => getDatas());
    super.initState();
  }

  @override
  void dispose() {
    if (_timer!.isActive) _timer!.cancel();
    super.dispose();
  }

  String friends = 'no';

  @override
  Widget build(BuildContext context) {
    /*
    조건문 순서: 나야 -> 요청받았어 -> 요청했어 -> 친구가 아니야 -> 친구야
     */
    return StreamBuilder(
        stream: controller.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data[0].contains(widget.nickname))
              friends = "friend";
            else if (snapshot.data[1].contains(widget.nickname))
              friends = "requested";
            else if (snapshot.data[2].contains(widget.nickname))
              friends = "request";
            else
              friends = "no";
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
                              'asset/images/ranking/${snapshot.data[4].result![snapshot.data[3]].rating}.png',
                              height: 150.0),
                          Text('전체 랭킹: ${snapshot.data[3] + 1}위',
                              style: TextStyle(fontSize: 18.0)),
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
                                      fontSize: 27.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 8.0),
                              //친구가 아님
                              friends == 'no'
                                  ? GestureDetector(
                                      onTap: () async {
                                        var url = Uri.parse(
                                            "http://${IP_ADDRESS}/test_add_request.php");
                                        /*
                                        var url = Uri.http(
                                            IP_ADDRESS,
                                            '/test_add_request.php',
                                            {'q': '{http}'});

                                         */
                                        var response = await http
                                            .post(url, body: <String, String>{
                                          "nickname": widget.loginID.toString(),
                                          "requested":
                                              widget.nickname.toString(),
                                        });
                                        MyShortToast(context, '친구 요청을 보냈습니다.');
                                      },
                                      child: Icon(Icons.person_add, size: 25.0),
                                    )
                                  //친구 요청을 누름
                                  : friends == 'request'
                                      ? GestureDetector(
                                          onTap: () async {
                                            var url2 = Uri.parse(
                                                "http://${IP_ADDRESS}/test_remove_request.php");
                                            /*
                                            var url2 = Uri.http(
                                                IP_ADDRESS,
                                                '/test_remove_request.php',
                                                {'q': '{http}'});

                                             */
                                            var response = await http.post(url2,
                                                body: <String, String>{
                                                  "nickname": widget.nickname
                                                      .toString(),
                                                  "request":
                                                      widget.loginID.toString(),
                                                });
                                            MyShortToast(
                                                context, '친구 요청을 취소했습니다.');
                                          },
                                          child: Icon(Icons.schedule_send,
                                              size: 25.0),
                                        )
                                      //친구 요청을 받음
                                      : friends == 'requested'
                                          ? GestureDetector(
                                              onTap: () async {
                                                var url = Uri.parse(
                                                    "http://${IP_ADDRESS}/test_add_friends.php");
                                                /*
                                                var url = Uri.http(
                                                    IP_ADDRESS,
                                                    '/test_add_friends.php',
                                                    {'q': '{http}'});

                                                 */
                                                var response = await http.post(
                                                    url,
                                                    body: <String, String>{
                                                      "nickname": widget.loginID
                                                          .toString(),
                                                      "request": widget.nickname
                                                          .toString(),
                                                    });

                                                var url2 = Uri.parse(
                                                    "http://${IP_ADDRESS}/test_remove_request.php");
                                                /*
                                                var url2 = Uri.http(
                                                    IP_ADDRESS,
                                                    '/test_remove_request.php',
                                                    {'q': '{http}'});

                                                 */
                                                var response2 = await http.post(
                                                    url2,
                                                    body: <String, String>{
                                                      "nickname": widget.loginID
                                                          .toString(),
                                                      "request": widget.nickname
                                                          .toString(),
                                                    });
                                                MyShortToast(
                                                    context, '친구 요청을 수락했습니다.');
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
                              '3대 총합: ${snapshot.data[4].result![snapshot.data[3]].total}kg',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold)),
                          Text(
                              '데드리프트: ${snapshot.data[4].result![snapshot.data[3]].deadlift}kg',
                              style: TextStyle(fontSize: 18.0)),
                          Text(
                              '벤치프레스: ${snapshot.data[4].result![snapshot.data[3]].benchpress}kg',
                              style: TextStyle(fontSize: 18.0)),
                          Text(
                              '스쿼트: ${snapshot.data[4].result![snapshot.data[3]].squat}kg',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
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
          );
        });
  }
}
