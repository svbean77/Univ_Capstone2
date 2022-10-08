import 'package:final_app/exercise/senior_main.dart';
import 'package:flutter/material.dart';
import 'beginner_main.dart';

class ExerciseMain extends StatefulWidget {
  const ExerciseMain({Key? key}) : super(key: key);

  @override
  State<ExerciseMain> createState() => _ExerciseMainState();
}

class _ExerciseMainState extends State<ExerciseMain> with TickerProviderStateMixin {
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
                child: Text('중상급자'),
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
              BeginnerMain(),
              SeniorMain(),
            ],
          ),
        ),
      ],
    );
  }
}
