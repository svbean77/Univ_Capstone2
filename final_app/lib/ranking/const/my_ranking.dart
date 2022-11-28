import 'package:final_app/ranking/const/user_info.dart';
import 'package:flutter/material.dart';

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
  String friends = '';
  @override
  Widget build(BuildContext context) {
    /*
    select: nickname의 사용자 정보
     */
    /*
    select: loginID의 친구정보, 나의요청정보, 내게요청정보
     */
    String myRating = "실버";
    int myRanking = 3;
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

    List<int> weight = [50, 60, 70];

    return Container(
      height: 200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/images/ranking/$myRating.png', height: 150.0),
              Text('$myRating ($myRanking위)'),
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
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                    child: Icon(Icons.schedule_send, size: 25.0),
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
                    child: Icon(Icons.check_circle_outline,
                        size: 25.0),
                  )
                  //이미 친구이거나 내 정보
                      : Container(width: 0.0)
                ],
              ),
              SizedBox(height: 8.0),
              Text('3대 총합: ${weight[0] + weight[1] + weight[2]}kg',
                  style:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('데드리프트: ${weight[0]}kg'),
              Text('벤치프레스: ${weight[1]}kg'),
              Text('스쿼트: ${weight[2]}kg'),
            ],
          )
        ],
      ),
    );
  }
}
