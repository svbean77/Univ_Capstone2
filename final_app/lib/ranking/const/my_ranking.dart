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
  @override
  Widget build(BuildContext context) {
    //loginID를 통해 내 닉네임 구하기
    String myNickName = "안녕";
    //nickname을 이용해 등수, 등급, 무게 구하기
    String myRating = "실버";
    int myRanking = 3;
    //db에서 친구 목록을 불러와 닉네임이 그 안에 속하는지 알아보기
    //조건문 사용해 요청받았니 -> 요청했니 -> 친구가 아니니 -> 나머지
    List<String> myFriends = ['친구1', '친구2', '친구3'];
    List<String> myRequests = ['유저1', '유저2']; //내가 요청함
    List<String> myRequested = ['요청1', '요청2']; //나한테 요청함

    String friends = '';
    if (widget.nickname == myNickName){
      friends = 'me';
    }
    else if (myRequested.contains(widget.nickname)){
      //나한테 요청함
      friends = 'requested';
    }
    else if(myRequests.contains(widget.nickname)){
      //내가 요청함
      friends = 'request';
    }
    else if (!myFriends.contains(widget.nickname)){
      friends = 'no';
    }
    else{
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
              Text('$myRating ($myRanking위)', style: TextStyle(fontSize: 20.0)),
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
                            //friends를 request로 바꿔서 db에 업데이트 하는 코드
                            //친구 요청 테이블에 삽입하거나 등등
                            setState(() {
                              friends = 'request';
                            });
                          },
                          child: Icon(Icons.person_add, size: 25.0),
                        )
                      //친구 요청을 누름
                      //아이콘 다시 찾기..
                      : friends == 'request'
                          ? GestureDetector(
                              child:
                                  Icon(Icons.schedule_send, size: 25.0),
                            )
                          //친구 요청을 받음
                          //아이콘 다시 찾기
                          : friends == 'requested'
                              ? GestureDetector(
                                  onTap: () {
                                    //friends를 친구로 바꿔서 db에 업데이트 하는 코드
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
              SizedBox(height: 20.0),
              Text('3대 총합: ${weight[0] + weight[1] + weight[2]}kg',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('데드리프트: ${weight[0]}kg', style: TextStyle(fontSize: 15.0)),
              Text('벤치프레스: ${weight[1]}kg', style: TextStyle(fontSize: 15.0)),
              Text('스쿼트: ${weight[2]}kg', style: TextStyle(fontSize: 15.0)),
            ],
          )
        ],
      ),
    );
  }
}
