import 'package:final_app/exercise/master_main.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import '../beginner_main.dart';

class ExerciseMain extends StatefulWidget {
  final loginID;
  final grade;
  const ExerciseMain({
    required this.grade,
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseMain> createState() => _ExerciseMainState();
}

class _ExerciseMainState extends State<ExerciseMain>
    with TickerProviderStateMixin {
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
                child: Text('초보자'),
              ),
              Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text('숙련자'),
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
              BeginnerMain(loginID: widget.loginID, grade: widget.grade),
              MasterMain(loginID: widget.loginID, grade: widget.grade),
            ],
          ),
        ),
      ],
    );
  }
}
