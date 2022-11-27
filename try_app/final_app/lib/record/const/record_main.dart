import 'package:final_app/record/record_calendar.dart';
import 'package:final_app/record/record_graph.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RecordMain extends StatefulWidget {
  final loginID;
  final grade;
  const RecordMain({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RecordMain> createState() => _RecordMainState();
}

class _RecordMainState extends State<RecordMain> with TickerProviderStateMixin {
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
                child: Text('운동기록'),
              ),
              Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text('체중기록'),
              ),
            ],
            indicator: BoxDecoration(
              color: PRIMARY_COLOR[widget.grade].withOpacity(0.3),
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
              RecordCalendar(loginID: widget.loginID, grade: widget.grade),
              RecordGraph(loginID: widget.loginID, grade: widget.grade),
            ],
          ),
        ),
      ],
    );
  }
}
