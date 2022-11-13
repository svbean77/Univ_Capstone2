import 'package:final_app/friends/const/friend_card.dart';
import 'package:final_app/friends/const/request_card.dart';
import 'package:final_app/ranking/const/user_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screen/const/grade_colors.dart';

class FriendsMain extends StatefulWidget {
  const FriendsMain({Key? key}) : super(key: key);

  @override
  State<FriendsMain> createState() => _FriendsMainState();
}

class _FriendsMainState extends State<FriendsMain> {
  final TextEditingController controller = TextEditingController();
  List<bool> search = [true, false];

  @override
  Widget build(BuildContext context) {
    int grade = 5;
    //친구 목록 불러오기
    List<String> friendN = ['친구1', '친구2', '친구3', '친구4', '친구5'];
    List<String> friendR = ['챌린저', '다이아몬드', '골드', '브론즈', '아이언'];
    List<bool> isActive = [false, false, true, true, false];
    List<String> requestN = ['요청1', '요청2', '요청3'];
    List<String> requestR = ['실버', '플래티넘', '그랜드마스터'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 15,
            child: Row(
              children: [
                ToggleButtons(
                  children: [
                    Text('닉네임'),
                    Text('아이디'),
                  ],
                  isSelected: search,
                  selectedColor: Colors.black,
                  fillColor: (grade == 0 || grade == 7)
                      ? Colors.black.withOpacity(0.1)
                      : PRIMARY_COLOR[grade].withOpacity(0.3),
                  onPressed: (value) {
                    setState(() {
                      if (value == 0) {
                        search[0] = true;
                        search[1] = false;
                      } else {
                        search[0] = false;
                        search[1] = true;
                      }
                    });
                  },
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grade == 0
                            ? Colors.black.withOpacity(0.2)
                            : PRIMARY_COLOR[grade],
                      ),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () {
                    String find = controller.text.toString();
                    if (search[0] == true) {
                      //닉네임을 이용해 검색
                      //모든 사용자 불러옴 (랭킹처럼)
                      List<String> allUser = [
                        'user1',
                        'user2',
                        'user3',
                        'friend3',
                        'friend2',
                        'friend1'
                      ];
                      if (allUser.contains(find)) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                UserInfo(nickname: find),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: '존재하지 않는 닉네임입니다.',
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    } else {
                      //아이디를 이용해 검색
                      List<String> allUser = [
                        'id1',
                        'id2',
                        'id3',
                        'id4',
                        'id5',
                        'id6'
                      ];
                      if (allUser.contains(find)) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                UserInfo(nickname: find),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: '존재하지 않는 아이디입니다.',
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('친구목록', style: TextStyle(fontSize: 20.0)),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: friendN.length == 0
                          ? Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PRIMARY_COLOR[grade],
                                ),
                              ),
                              child: Text('친구 목록이 없습니다.',
                                  style: TextStyle(fontSize: 20.0)),
                            )
                          : ListView(
                              children: [
                                for (int i = 0; i < friendN.length; i++)
                                  FriendCard(
                                      nickname: friendN[i],
                                      rating: friendR[i],
                                      isActive: isActive[i],
                                      grade: grade)
                              ],
                            ),
                    ),
                  ),
                  Text('친구요청', style: TextStyle(fontSize: 20.0)),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: requestN.length == 0
                        ? Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PRIMARY_COLOR[grade],
                              ),
                            ),
                            child: Text('친구 요청이 없습니다.',
                                style: TextStyle(fontSize: 20.0)),
                          )
                        : ListView(
                            children: [
                              for (int i = 0; i < requestN.length; i++)
                                RequestCard(
                                    nickname: requestN[i],
                                    rating: requestR[i],
                                    grade: grade)
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
