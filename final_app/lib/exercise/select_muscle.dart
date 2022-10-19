import 'package:final_app/screen/app_bar.dart';
import 'package:final_app/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'exercise_guide.dart';

class SelectMuscle extends StatelessWidget {
  final int grade;
  const SelectMuscle({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: grade),
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
          muscleLst[6] = 10;
        } else if (col == 2 || col == 8) {
          muscleLst[4] = 1;
          muscleLst[5] = 10;
          muscleLst[6] = 10;
        } else if (col == 3 || col == 7) {
          muscleLst[3] = 6;
          muscleLst[4] = 1;
          muscleLst[5] = 1;
          muscleLst[12] = 11;
          muscleLst[13] = 11;
        } else if (col == 4 || col == 6) {
          muscleLst[2] = 4;
          muscleLst[3] = 2;
          muscleLst[4] = 2;
          muscleLst[5] = 15;
          muscleLst[6] = 15;
          muscleLst[8] = 3;
          muscleLst[9] = 3;
          muscleLst[10] = 3;
          muscleLst[12] = 11;
          muscleLst[13] = 11;
        } else {
          muscleLst[3] = 2;
          muscleLst[4] = 2;
          muscleLst[5] = 12;
          muscleLst[6] = 12;
          muscleLst[7] = 12;
        }
        break;
      case 'b':
        if (col == 1 || col == 9) {
          muscleLst[6] = 10;
        } else if (col == 2 || col == 8) {
          muscleLst[4] = 5;
          muscleLst[5] = 10;
          muscleLst[6] = 10;
        } else if (col == 3 || col == 7) {
          muscleLst[3] = 6;
          muscleLst[4] = 5;
          muscleLst[5] = 5;
          muscleLst[12] = 11;
          muscleLst[13] = 11;
        } else if (col == 4 || col == 6) {
          muscleLst[2] = 4;
          muscleLst[3] = 6;
          muscleLst[4] = 7;
          muscleLst[5] = 7;
          muscleLst[6] = 7;
          muscleLst[7] = 9;
          muscleLst[8] = 9;
          muscleLst[9] = 8;
          muscleLst[10] = 8;
          muscleLst[12] = 11;
          muscleLst[13] = 11;
        } else {
          muscleLst[2] = 4;
          muscleLst[3] = 14;
          muscleLst[4] = 14;
          muscleLst[5] = 13;
          muscleLst[6] = 13;
          muscleLst[7] = 9;
          muscleLst[8] = 9;
          muscleLst[9] = 8;
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
                if (muscleLst[i - 1] == 0)
                  Navigator.of(context).noSuchMethod;
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExerciseGuide(
                        muscleName: exerciseLst[muscleLst[i - 1] - 1][0],
                        exerciseName: exerciseLst[muscleLst[i - 1] - 1][1],
                        exerciseImage: exerciseLst[muscleLst[i - 1] - 1][2],
                        equipment: exerciseLst[muscleLst[i - 1] - 1][3],
                        difficulty: exerciseLst[muscleLst[i - 1] - 1][4],
                        exerciseStep: exerciseLst[muscleLst[i - 1] - 1][5],
                      ),
                    ),
                  );
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
      case 1:
        muscleName = "Biceps";
        exerciseName = "이두근인가";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
        equipment = '기구 1';
        difficulty = '난이도 1';
        exerciseStep = '''운동 방법 1''';
        break;
      case 2:
        muscleName = "Chest";
        exerciseName = "가슴운동";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-chest-flyes-front.gif";
        equipment = '기구 2';
        difficulty = '난이도 2';
        exerciseStep = '''운동 방법 2''';
        break;
      case 3:
        muscleName = "Quads";
        exerciseName = "허벅지";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-goblet-squat-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 4:
        muscleName = "Traps";
        exerciseName = "승모근";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-uprightrow-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 5:
        muscleName = "Triceps";
        exerciseName = "삼두근인가";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-bench-tricep-dip-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 6:
        muscleName = "Shoulders";
        exerciseName = "어깨";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-seated-shoulder-press-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 7:
        muscleName = "Lats";
        exerciseName = "옆구리등쪽";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 8:
        muscleName = "Hamstrings";
        exerciseName = "햄스트링";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/ProneLegCurl-Back-021316.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 9:
        muscleName = "Glutes";
        exerciseName = "엉덩이";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/bodyweight-slglutebridge-male-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 10:
        muscleName = "Forearms";
        exerciseName = "팔";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-db-wristflex-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 11:
        muscleName = "Calves";
        exerciseName = "종아리";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-sl-calf-raises-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 12:
        muscleName = "Abdominals";
        exerciseName = "복근";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/female-leg-raises-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 13:
        muscleName = "Lower back";
        exerciseName = "등 아래";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-deadlift-front_Omfp4bo.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 14:
        muscleName = "Traps (mid-back)";
        exerciseName = "등 중간";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 15:
        muscleName = "Obliques";
        exerciseName = "옆구리";
        exerciseImage =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-woodchopper-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
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
