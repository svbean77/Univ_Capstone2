//https://eunoia3jy.tistory.com/110

import 'package:final_app/community/free_board.dart';
import 'package:final_app/community/q_and_a_board.dart';
import 'package:flutter/material.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({Key? key}) : super(key: key);

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain> with TickerProviderStateMixin {
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
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: TabBar(
            tabs: [
              Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text('자유게시판'),
              ),
              Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text('질의응답'),
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
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              FreeBoard(),
              QnABoard(),
            ],
          ),
        ),
      ],
    );
  }
}
