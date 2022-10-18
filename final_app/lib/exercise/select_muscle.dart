import 'package:flutter/material.dart';

import '../mypage/my_page.dart';
import '../mypage/notice.dart';
import '../mypage/sign_in.dart';
import '../mypage/three_challenge.dart';
import '../screen/home_screen.dart';
import 'exercise_guide.dart';

class SelectMuscle extends StatelessWidget {
  const SelectMuscle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignIn(),
                  ),
                );
              },
              child: DrawerHeader(
                child: Text('프로필사진 크게'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('닉네임'),
                    Text('등급'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('수분섭취'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.coffee),
                        Text('nn컵 / mm컵'),
                        TextButton(
                          child: Text('+1컵'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3대 챌린지'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ThreeChallenge(),
                    ),
                  );
                },
              ),
              elevation: 0,
            ),
            Card(
              child: ListTile(
                title: Text('공지사항'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Notice(),
                    ),
                  );
                },
              ),
              elevation: 0,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('득근득근'),
//backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              '중상급자 근육 부위별 운동',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('이름으로 검색'),
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
                EachCols(
                    dir: 'muscle_front', col: 1, muscleLst: getLst('f', 1)),
                EachCols(
                    dir: 'muscle_front', col: 2, muscleLst: getLst('f', 2)),
                EachCols(
                    dir: 'muscle_front', col: 3, muscleLst: getLst('f', 3)),
                EachCols(
                    dir: 'muscle_front', col: 4, muscleLst: getLst('f', 4)),
                EachCols(
                    dir: 'muscle_front', col: 5, muscleLst: getLst('f', 5)),
                EachCols(
                    dir: 'muscle_front', col: 6, muscleLst: getLst('f', 6)),
                EachCols(
                    dir: 'muscle_front', col: 7, muscleLst: getLst('f', 7)),
                EachCols(
                    dir: 'muscle_front', col: 8, muscleLst: getLst('f', 8)),
                EachCols(
                    dir: 'muscle_front', col: 9, muscleLst: getLst('f', 9)),
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
                EachCols(dir: 'muscle_back', col: 1, muscleLst: getLst('b', 1)),
                EachCols(dir: 'muscle_back', col: 2, muscleLst: getLst('b', 2)),
                EachCols(dir: 'muscle_back', col: 3, muscleLst: getLst('b', 3)),
                EachCols(dir: 'muscle_back', col: 4, muscleLst: getLst('b', 4)),
                EachCols(dir: 'muscle_back', col: 5, muscleLst: getLst('b', 5)),
                EachCols(dir: 'muscle_back', col: 6, muscleLst: getLst('b', 6)),
                EachCols(dir: 'muscle_back', col: 7, muscleLst: getLst('b', 7)),
                EachCols(dir: 'muscle_back', col: 8, muscleLst: getLst('b', 8)),
                EachCols(dir: 'muscle_back', col: 9, muscleLst: getLst('b', 9)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<int> getLst(String type, int col) {
    List<int> muscleLst = List.filled(16, 0);
    switch (type) {
      case 'f':
        if (col == 1 || col == 9) {
          muscleLst[0] = 1;
          muscleLst[1] = 1;
          muscleLst[2] = 1;
          muscleLst[3] = 1;
          muscleLst[4] = 1;
          muscleLst[5] = 1;
          muscleLst[6] = 1;
          muscleLst[7] = 1;
          muscleLst[8] = 1;
        } else if (col == 2 || col == 8) {
          muscleLst[6] = 1;
        } else if (col == 3 || col == 7) {
          muscleLst[3] = 2;
          muscleLst[4] = 2;
          muscleLst[5] = 2;
          muscleLst[6] = 2;
          muscleLst[7] = 2;
          muscleLst[8] = 2;
        } else if (col == 4 || col == 6) {
          muscleLst[2] = 3;
          muscleLst[3] = 4;
        } else {
          muscleLst[3] = 4;
          muscleLst[5] = 5;
        }
        break;
      case 'b':
        if (col == 1 || col == 9) {
          muscleLst[6] = 1;
        } else if (col == 2 || col == 8) {
          muscleLst[6] = 1;
        } else if (col == 3 || col == 7) {
          muscleLst[3] = 2;
        } else if (col == 4 || col == 6) {
          muscleLst[2] = 3;
          muscleLst[3] = 4;
        } else {
          muscleLst[3] = 4;
          muscleLst[5] = 5;
        }
        break;
    }
    return muscleLst;
  }
}

class LoadImage extends StatelessWidget {
  final dir;
  final row;
  final col;
  final onTap;

  const LoadImage({
    required this.onTap,
    required this.dir,
    required this.col,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'asset/images/$dir/row-$row-column-$col.png',
        width: MediaQuery.of(context).size.width / 10,
      ),
    );
  }
}

class EachCols extends StatelessWidget {
  final dir;
  final col;
  final muscleLst;

  EachCols({
    required this.dir,
    required this.col,
    required this.muscleLst,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> exerciseLst = [];
    for (int i = 1; i <= 16; i++) {
      exerciseLst.add(setExercise(i));
    }

    return Column(
      children: [
        for (int i = 1; i <= 16; i++)
          LoadImage(
              onTap: () {
                switch (muscleLst[i]) {
                  case 0:
                    break;
                  case 1:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ExerciseGuide(
                          muscleName: exerciseLst[1][0],
                          exerciseName: exerciseLst[1][1],
                          exerciseImage: exerciseLst[1][2],
                          equipment: exerciseLst[1][3],
                          difficulty: exerciseLst[1][4],
                          exerciseStep: exerciseLst[1][5],
                        ),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ExerciseGuide(
                          muscleName: exerciseLst[2][0],
                          exerciseName: exerciseLst[2][1],
                          exerciseImage: exerciseLst[2][2],
                          equipment: exerciseLst[2][3],
                          difficulty: exerciseLst[2][4],
                          exerciseStep: exerciseLst[2][5],
                        ),
                      ),
                    );
                    break;
                }
              },
              dir: dir,
              col: col,
              row: i),
      ],
    );
  }

  List<String> setExercise(int num) {
    String muscleName = "";
    String exerciseName = "";
    String exerciseImage = "";
    String equipment = "";
    String difficulty = "";
    String exerciseStep = '''''';

    switch (num) {
      case 0:
        break;
      case 1:
        muscleName = "근육 1";
        exerciseName = "운동 1";
        exerciseImage =
        "https://www.musclewiki.com/media/uploads/male-barbell-curl-front_uKPCb8P.gif";
        equipment = '기구 1';
        difficulty = '난이도 1';
        exerciseStep = '''운동 방법 1''';
        break;
      case 2:
        muscleName = "근육 2";
        exerciseName = "운동 2";
        exerciseImage =
        "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
        equipment = '기구 2';
        difficulty = '난이도 2';
        exerciseStep = '''운동 방법 2''';
        break;
      case 3:
        muscleName = "근육 3";
        exerciseName = "운동 3";
        exerciseImage =
        "https://www.musclewiki.com/media/uploads/male-barbell-curl-front_uKPCb8P.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      default:
        muscleName = "근육 4";
        exerciseName = "운동 4";
        exerciseImage =
        "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
        equipment = '기구 4';
        difficulty = '난이도 4';
        exerciseStep = '''운동 방법 4''';
    }
    return [
      muscleName,
      exerciseName,
      exerciseImage,
      equipment,
      difficulty,
      exerciseStep
    ];
  }
}
