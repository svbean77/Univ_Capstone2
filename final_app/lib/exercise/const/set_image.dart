import 'package:final_app/exercise/const/set_exercise.dart';
import 'package:final_app/exercise/exercise_guide.dart';
import 'package:flutter/material.dart';

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
    for (int i = 1; i <= 16; i++) {
      exerciseLst.add(setExercise(i, level));
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
                        //이미지가 하나인 경우 어떻게 처리할 것인지 생각
                        equipment: exerciseLst[muscleLst[i - 1] - 1][4],
                        exerciseStep: exerciseLst[muscleLst[i - 1] - 1][6],
                        level: level,
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


}
