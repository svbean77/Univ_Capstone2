import 'package:final_app/exercise/const/part_muscle_image.dart';
import 'package:final_app/exercise/const/search_name.dart';
import 'package:final_app/exercise/const/set_image.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/const_exercise_info.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class SelectMuscle extends StatelessWidget {
  const SelectMuscle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 5;
    String level = '숙련자';

    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              '숙련자 근육 부위별 운동',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            TextButton(
              onPressed: () {

                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView(
                        children: [
                          Card(
                            elevation: 0,
                            child: Text(
                              '근육 이름으로 검색',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          for (int i = 0; i < muscleLst.length; i++)
                            SearchName(name: muscleLst[i], level: level)
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('이름으로 검색', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20.0),
            Text(
              '앞모습',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SetImage(
                    dir: 'muscle_front',
                    col: 1,
                    muscleLst: getLst('f', 1),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 2,
                    muscleLst: getLst('f', 2),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 3,
                    muscleLst: getLst('f', 3),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 4,
                    muscleLst: getLst('f', 4),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 5,
                    muscleLst: getLst('f', 5),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 6,
                    muscleLst: getLst('f', 6),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 7,
                    muscleLst: getLst('f', 7),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 8,
                    muscleLst: getLst('f', 8),
                    level: level),
                SetImage(
                    dir: 'muscle_front',
                    col: 9,
                    muscleLst: getLst('f', 9),
                    level: level),
              ],
            ),
            SizedBox(height: 50.0),
            Text('뒷모습',
                style: TextStyle(
                  fontSize: 20.0,
                )),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SetImage(
                    dir: 'muscle_back',
                    col: 1,
                    muscleLst: getLst('b', 1),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 2,
                    muscleLst: getLst('b', 2),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 3,
                    muscleLst: getLst('b', 3),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 4,
                    muscleLst: getLst('b', 4),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 5,
                    muscleLst: getLst('b', 5),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 6,
                    muscleLst: getLst('b', 6),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 7,
                    muscleLst: getLst('b', 7),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 8,
                    muscleLst: getLst('b', 8),
                    level: level),
                SetImage(
                    dir: 'muscle_back',
                    col: 9,
                    muscleLst: getLst('b', 9),
                    level: level),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
