import 'package:final_app/friends/const/friend_card.dart';
import 'package:final_app/friends/const/request_card.dart';
import 'package:flutter/material.dart';

import '../screen/const/grade_colors.dart';

class FriendsMain extends StatefulWidget {
  const FriendsMain({Key? key}) : super(key: key);

  @override
  State<FriendsMain> createState() => _FriendsMainState();
}

class _FriendsMainState extends State<FriendsMain> {
  final TextEditingController controller = TextEditingController();
  List<bool> search = [true, false];
  int grade = 0;

  @override
  Widget build(BuildContext context) {
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
                  selectedColor: PRIMARY_COLOR[grade],
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
                        color: PRIMARY_COLOR[grade],
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
                GestureDetector(child: Icon(Icons.search), onTap: () {}),
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
                                      isActive: isActive[i])
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
                                    nickname: requestN[i], rating: requestR[i])
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
