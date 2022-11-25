import 'package:flutter/material.dart';
import 'package:test_exercise_guide/const/set_exercise.dart';

import '../screen/exercise_guide.dart';

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

class SetImage extends StatelessWidget {
  final dir;
  final col;
  final muscleLst;
  final level;

  SetImage({
    required this.dir,
    required this.col,
    required this.muscleLst,
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> exerciseLst = [];
    Map<int, String> mapExNum = {
      1:"이두",
      2:"가슴",
      3:'대퇴 사두근',
      4:'승모근',
      5:'삼두',
      6:'어깨',
      7:'광배근',
      8:'대퇴 이두근',
      9:'둔근',
      10:'전완근',
      11:'종아리',
      12:'복근',
      13:'등 하부',
      14:'등 중앙부',
      15:'복사근'
    };
    for (int i = 1; i <= 15; i++) {
      exerciseLst.add(setExercise(i, level, '맨몸'));
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
                        exerciseImage1: exerciseLst[muscleLst[i - 1] - 1][2],
                        exerciseImage2: exerciseLst[muscleLst[i - 1] - 1][3],
                        equipment: exerciseLst[muscleLst[i - 1] - 1][4],
                        exerciseStep: exerciseLst[muscleLst[i - 1] - 1][6],
                        difficulty: exerciseLst[muscleLst[i - 1] - 1][7],
                        level: level,
                      ),
                    ),
                  );
              },
              dir: dir,
              col: col,
              row: i,),
      ],
    );
  }
}
