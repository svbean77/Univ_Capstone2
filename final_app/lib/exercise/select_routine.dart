import 'package:final_app/exercise/list_routine.dart';
import 'package:final_app/screen/app_bar.dart';
import 'package:final_app/screen/drawer.dart';
import 'package:flutter/material.dart';

class SelectRoutine extends StatefulWidget {
  final int grade;
  const SelectRoutine({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectRoutine> createState() => _SelectRoutineState();
}

class _SelectRoutineState extends State<SelectRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Column(
        children: [
          Text('시간으로 루틴 선택'),
          Row(
            children: [
              Container(
                //Container가 아닌 죄우 스크롤뷰로 만들기
                height: 100, width: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListRoutine(),
                      ),
                    );
                  },
                  child: Text('루틴들'),
                ),
              ),
            ],
          ),
          Text('신체 부위로 루틴 선택'),
          Row(
            children: [
              Container(
                //Container가 아닌 죄우 스크롤뷰로 만들기
                height: 100, width: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListRoutine(),
                      ),
                    );
                  },
                  child: Text('루틴들'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
