import 'package:final_app/exercise/exercise_guide.dart';
import 'package:final_app/screen/const/const_exercise_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class EquipmentFilter extends StatelessWidget {
  String level;
  String muscleName;
  String exerciseName;
  String equipment;
  String difficulty;
  String exerciseImage1;
  String exerciseImage2;
  String exerciseStep;

  EquipmentFilter({
    required this.level,
    required this.exerciseImage2,
    required this.muscleName,
    required this.exerciseStep,
    required this.equipment,
    required this.difficulty,
    required this.exerciseName,
    required this.exerciseImage1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView(
        children: [
          Card(
            elevation: 0,
            child: Text(
              '운동 도구로 고르기',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          for (int i = 0; i < equipmentLst.length; i++)
            Card(
              elevation: 0,
              child: ListTile(
                title: Text(equipmentLst[i]),
                onTap: () {
                  if (equipmentLst[i] == '밴드') {
                    equipment = '밴드';
                  } else if (equipmentLst[i] == '바벨') {
                    equipment = '바벨';
                  } else if (equipmentLst[i] == '맨몸') {
                    equipment = '맨몸';
                  } else if (equipmentLst[i] == '케이블') {
                    equipment = '케이블';
                  } else if (equipmentLst[i] == '덤벨') {
                    equipment = '덤벨';
                  } else if (equipmentLst[i] == '케틀벨') {
                    equipment = '케틀벨';
                  } else if (equipmentLst[i] == '머신') {
                    equipment = '머신';
                  } else if (equipmentLst[i] == '스트레칭') {
                    equipment = '스트레칭';
                  }

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExerciseGuide(
                        level: level,
                        exerciseStep: exerciseStep,
                        exerciseName: exerciseName,
                        exerciseImage1: exerciseImage1,
                        exerciseImage2: exerciseImage2,
                        equipment: equipment,
                        muscleName: muscleName,
                        difficulty: difficulty,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
