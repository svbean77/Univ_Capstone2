import 'package:final_app/exercise/const/set_exercise.dart';
import 'package:final_app/exercise/exercise_guide.dart';
import 'package:flutter/material.dart';

class SearchName extends StatelessWidget {
  final name;
  final level;
  const SearchName({
    required this.name,
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, int> mapExNum = {
      "Biceps": 1,
      "Chest": 2,
      'Quads': 3,
      'Traps': 4,
      'Triceps': 5,
      'Shoulders': 6,
      'Lats': 7,
      'Hamstrings': 8,
      'Glutes': 9,
      'Forearms': 10,
      'Calves': 11,
      'Abdominals': 12,
      'Lower back': 13,
      'Traps (mid-back)': 14,
      'Obliques': 15
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
              ),
            ),
          );
        },
      ),
    );
  }
}
