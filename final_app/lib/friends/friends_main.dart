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
  final TextEditingController controller = TextEditingController();

  Future getDatas() async {
    var url = Uri.http(IP_ADDRESS, '/test_select_friend.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    FRIENDS data = FRIENDS.fromJson(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    /*
    친구 요청 목록 select
    select: 1) 내가 신청한 사용자 (join)
    select: 2) 나한테 신청한 사용자 (join)
    => 2개의 결과가 있어야 함 (같은 db를 바탕으로 2번 select)
     */
    /*
    => 얘네들을 각각 목록으로 불러오지 말고 친구목록에 있는 사용자들, 요청목록에 있는 사용자들 등등 sql에서 사람으로 만들어 select하자!
     */
    List<String> requestN = ['요청1', '요청2', '요청3'];
    List<String> requestR = ['실버', '플래티넘', '그랜드마스터'];

    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Padding(
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
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          hintText: '닉네임으로 사용자 검색',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      /*
                      select: 닉네임이 find인 사용자 select -> class
                      (지금처럼 모든 사용자 불러오지 말고 find인 사람만 불러와서 길이가 1이면 이동, 0이면 토스트)
                       */
                      String find = controller.text.toString();
                      List<String> allUser = [
                        'user1',
                        'user2',
                        'user3',
                        'friend3',
                        'friend2',
                        'friend1'
                      ];
                      if (allUser.contains(find)) {
                        /*
                        class 형태로 전달
                         */
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => UserInfo(
                              userdata: null,
                              recorddata: null,
                              loginID: widget.loginID,
                              grade: widget.grade,
                            ),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: '존재하지 않는 닉네임입니다.',
                          backgroundColor: PRIMARY_COLOR[widget.grade],
                          textColor: (widget.grade == 0 ||
                                  widget.grade == 1 ||
                                  widget.grade == 2 ||
                                  widget.grade == 4 ||
                                  widget.grade == 8)
                              ? Colors.black
                              : Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Container(
                child: FutureBuilder(
                    future: getDatas(),
                    builder: (context, snapshot) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: snapshot.hasData
                            ? [
                                Text('친구목록', style: TextStyle(fontSize: 25.0)),
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: snapshot.data.result!.length == 0
                                        ? Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    PRIMARY_COLOR[widget.grade],
                                              ),
                                            ),
                                            child: Text('친구 목록이 없습니다.',
                                                style:
                                                    TextStyle(fontSize: 20.0)),
                                          )
                                        : ListView(
                                            children: [
                                              for (int i = 0;
                                                  i <
                                                      snapshot
                                                          .data.result!.length;
                                                  i++)
                                                FriendCard(
                                                    nickname: snapshot.data
                                                        .result![i].friends,
                                                    rating: snapshot
                                                        .data.result![i].rating,
                                                    grade: widget.grade,
                                                    loginID: widget.loginID)
                                            ],
                                          ),
                                  ),
                                ),
                                Text('친구요청', style: TextStyle(fontSize: 25.0)),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: requestN.length == 0
                                      ? Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  PRIMARY_COLOR[widget.grade],
                                            ),
                                          ),
                                          child: Text('친구 요청이 없습니다.',
                                              style: TextStyle(fontSize: 20.0)),
                                        )
                                      : ListView(
                                          children: [
                                            for (int i = 0;
                                                i < requestN.length;
                                                i++)
                                              /*
                                        class로 보내줘야 함 ([i]가 들어가니까)
                                         */
                                              RequestCard(
                                                  nickname: requestN[i],
                                                  rating: requestR[i],
                                                  grade: widget.grade,
                                                  loginID: widget.loginID)
                                          ],
                                        ),
                                ),
                              ]
                            : [
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
