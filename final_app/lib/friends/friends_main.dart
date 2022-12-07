import 'dart:async';
import 'dart:convert';

import 'package:final_app/friends/const/friend_card.dart';
import 'package:final_app/friends/const/request_card.dart';
import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../screen/const/grade_colors.dart';
import '../screen/const/ip_address.dart';

class FriendsMain extends StatefulWidget {
  final loginID;
  final grade;
  const FriendsMain({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<FriendsMain> createState() => _FriendsMainState();
}

class _FriendsMainState extends State<FriendsMain> {
  final TextEditingController textController = TextEditingController();
  StreamController controller = StreamController();
  Timer? _timer;

  Future getDatas() async {
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_friend.php");
    /*
    var url = Uri.http(IP_ADDRESS, '/test_select_friend.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    FRIENDS data = FRIENDS.fromJson(jsondata);
    var url2 = Uri.parse("http://${IP_ADDRESS}/test_select_requested.php");
    /*
    var url2 =
        Uri.http(IP_ADDRESS, '/test_select_requested.php', {'q': '{http}'});

     */
    var response2 = await http.post(url2, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata2 = jsonDecode(json.decode(json.encode(response2.body)));
    REQUESTED data2 = REQUESTED.fromJson(jsondata2);

    controller.add([data, data2]);
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 15,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.grade == 0
                            ? Colors.grey.withOpacity(0.2)
                            : PRIMARY_COLOR[widget.grade],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        hintText: '닉네임으로 사용자 검색',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () async {
                    var url = Uri.parse(
                        "http://${IP_ADDRESS}/test_select_userdata.php");
                    /*
                    var url = Uri.http(IP_ADDRESS, '/test_select_userdata.php',
                        {'q': '{http}'});

                     */
                    var response = await http.post(url, body: <String, String>{
                      "username": textController.text.toString(),
                      "mode": "Nickname".toString(),
                    });
                    var jsondata =
                        jsonDecode(json.decode(json.encode(response.body)));
                    USERDATA data = USERDATA.fromJson(jsondata);

                    if (data.result!.length != 0) {
                      var url2 = Uri.parse(
                          "http://${IP_ADDRESS}/test_select_exercise_record.php");
                      /*
                      var url2 = Uri.http(IP_ADDRESS,
                          '/test_select_exercise_record.php', {'q': '{http}'});

                       */
                      var response2 =
                          await http.post(url2, body: <String, String>{
                        "nickname": textController.text.toString(),
                      });
                      var jsondata2 =
                          jsonDecode(json.decode(json.encode(response2.body)));
                      MY_EXERCISE_RECORD data2 =
                          MY_EXERCISE_RECORD.fromJson(jsondata2);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserInfo(
                            userdata: data.result!,
                            recorddata: data2.result!,
                            loginID: widget.loginID,
                            grade: widget.grade,
                          ),
                        ),
                      );
                    } else {
                      MyToast(
                          '존재하지 않는 닉네임입니다.',
                          PRIMARY_COLOR[widget.grade],
                          (widget.grade == 0 ||
                                  widget.grade == 1 ||
                                  widget.grade == 2 ||
                                  widget.grade == 4 ||
                                  widget.grade == 8)
                              ? Colors.black
                              : Colors.white);
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: Container(
              child: StreamBuilder(
                  stream: controller.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: snapshot.hasData
                          ? [
                              Text('친구 목록',
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: snapshot.data[0].result!.length == 1
                                      ? Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text('친구 목록이 없습니다.',
                                              style: TextStyle(fontSize: 18.0)),
                                        )
                                      : ListView(
                                          children: [
                                            for (int i = 0;
                                                i <
                                                    snapshot
                                                        .data[0].result!.length;
                                                i++)
                                              if (snapshot.data[0].result![i]
                                                      .friends !=
                                                  widget.loginID)
                                                FriendCard(
                                                    nickname: snapshot.data[0]
                                                        .result![i].friends,
                                                    rating: snapshot.data[0]
                                                        .result![i].rating,
                                                    grade: widget.grade,
                                                    loginID: widget.loginID)
                                          ],
                                        ),
                                ),
                              ),
                              Text('친구 요청',
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: snapshot.data[1].result!.length == 0
                                    ? Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Text('친구 요청이 없습니다.',
                                            style: TextStyle(fontSize: 18.0)),
                                      )
                                    : ListView(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  snapshot
                                                      .data[1].result!.length;
                                              i++)
                                            RequestCard(
                                                nickname: snapshot
                                                    .data[1].result![i].request,
                                                rating: snapshot
                                                    .data[1].result![i].rating,
                                                grade: widget.grade,
                                                loginID: widget.loginID)
                                        ],
                                      ),
                              ),
                            ]
                          : [
                              Center(
                                  child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 8.0),
                                  Text('데이터를 불러오고 있습니다..'),
                                ],
                              )),
                            ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
