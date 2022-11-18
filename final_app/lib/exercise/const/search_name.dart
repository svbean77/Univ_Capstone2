import 'package:final_app/exercise/const/set_exercise.dart';
import 'package:final_app/exercise/exercise_guide.dart';
import 'package:flutter/material.dart';

class SearchName extends StatelessWidget {
  final loginID;
  final name;
  final level;
  const SearchName({
    required this.loginID,
    required this.name,
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, int> mapExNum = {
      "이두": 1,
      "가슴": 2,
      '대퇴 사두근': 3,
      '승모근': 4,
      '삼두': 5,
      '어깨': 6,
      '광배근': 7,
      '대퇴 이두근': 8,
      '둔근': 9,
      '전완근': 10,
      '종아리': 11,
      '복근': 12,
      '등 하부': 13,
      '등 중앙부': 14,
      '복사근': 15
    };

    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(name),
        onTap: () {
          List<String> tmpLst = setExercise(mapExNum[name]!, level);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ExerciseGuide(
                  muscleName: tmpLst[0],
                  exerciseName: tmpLst[1],
                  exerciseImage1: tmpLst[2],
                  exerciseImage2: tmpLst[3],
                  equipment: tmpLst[4],
                  level: tmpLst[5],
                  exerciseStep: tmpLst[6],
                  difficulty: tmpLst[7],
                  loginID: loginID),
            ),
          );
        },
      ),
    );
  }
}
