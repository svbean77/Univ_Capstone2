import 'package:final_app/community/free_board.dart';
import 'package:final_app/community/q_and_a_board.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int grade = 5;
    List<int> freeboardLst = [1, 2, 3, 5, 7];
    List<int> qnaboardLst = [4, 6, 8, 9, 10, 11, 12];

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
      body: Column(
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
                color: (grade == 0 || grade == 7)
                    ? Colors.black.withOpacity(0.1)
                    : PRIMARY_COLOR[grade].withOpacity(0.3),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FreeBoard(boardLst: freeboardLst),
                QnABoard(boardLst: qnaboardLst),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
