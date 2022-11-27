import 'package:final_app/community/free_board.dart';
import 'package:final_app/community/q_and_a_board.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class CommunityMain extends StatefulWidget {
  final loginID;
  const CommunityMain({
    required this.loginID,
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
    /*
      select: 사용자의 테마 선택 가져오기
       */
    /*
    (보류)select: 각 게시글 데이터의 json을 여기서 구해 보내도 되려나???
    이건 일단 보류.. 각 게시판에서 구하는거 못하겠으면 이거로 해보기
     */
    int grade = 5;

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(loginID: widget.loginID),
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
                  child: Text('QnA'),
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
                FreeBoard(loginID: widget.loginID),
                QnABoard(loginID: widget.loginID),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
