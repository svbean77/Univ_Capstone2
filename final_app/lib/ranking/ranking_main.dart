//https://eunoia3jy.tistory.com/110

import 'all_ranking.dart';
import 'package:final_app/ranking/friends_ranking.dart';
import 'package:flutter/material.dart';


class RankingMain extends StatefulWidget {
  const RankingMain({Key? key}) : super(key: key);

  @override
  State<RankingMain> createState() => _RankingMainState();
}

class _RankingMainState extends State<RankingMain> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //나의 등급을 표시해줄 컨테이너
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: Center(
            child: Text(
              '나의 등급 표시',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
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
              color: Colors.blue[300],
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
          ),
        ),
        //탭바 뷰어 컨테이너
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              AllRanking(),
              FriendsRanking(),
            ],
          ),
        ),
      ],
    );
  }
}
