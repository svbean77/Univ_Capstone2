//https://eunoia3jy.tistory.com/110

import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/grade_colors.dart';

import '../all_ranking.dart';
import 'package:final_app/ranking/friends_ranking.dart';
import 'package:flutter/material.dart';

class RankingMain extends StatefulWidget {
  final loginID;
  final grade;
  const RankingMain({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RankingMain> createState() => _RankingMainState();
}

class _RankingMainState extends State<RankingMain>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //loginID를 통해 닉네임 구하기
    String myNickName = '안녕';

    return Column(
      children: [
        //나의 등급을 표시해줄 컨테이너
        MyRanking(
          nickname: myNickName,
          loginID: widget.loginID,
        ),
        //탭바 컨테이너
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: TabBar(
            tabs: [
              Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text('전체 사용자'),
              ),
              Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text('친구'),
              ),
            ],
            indicator: BoxDecoration(
              color: (widget.grade == 0 || widget.grade == 7)
                  ? Colors.black.withOpacity(0.1)
                  : PRIMARY_COLOR[widget.grade].withOpacity(0.3),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
          ),
        ),
        //탭바 뷰어 컨테이너
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              AllRanking(loginID: widget.loginID),
              FriendsRanking(loginID: widget.loginID),
            ],
          ),
        ),
      ],
    );
  }
}
