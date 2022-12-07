import 'package:final_app/community/free_board.dart';
import 'package:final_app/community/q_and_a_board.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class CommunityMain extends StatefulWidget {
  final loginID;
  final grade;
  const CommunityMain({
    required this.loginID,
    required this.grade,
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
    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[widget.grade].withOpacity(0.7),
              ),
            ),
            child: TabBar(
              tabs: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('자유게시판', style: TextStyle(fontSize: 18.0)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('QnA', style: TextStyle(fontSize: 18.0)),
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FreeBoard(loginID: widget.loginID, grade: widget.grade),
                QnABoard(loginID: widget.loginID, grade: widget.grade),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
