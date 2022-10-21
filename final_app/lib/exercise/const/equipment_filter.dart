import 'package:final_app/exercise/exercise_guide.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class EquipmentFilter extends StatelessWidget {
  String level;
  String muscleName;
  String exerciseName;
  String equipment;
  String exerciseImage1;
  String exerciseImage2;
  String exerciseStep;

  EquipmentFilter({
    required this.level,
    required this.exerciseImage2,
    required this.muscleName,
    required this.exerciseStep,
    required this.equipment,
    required this.exerciseName,
    required this.exerciseImage1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equipmentLst = [
      '모든 운동',
      'band',
      'barbell',
      'bodyweight',
      'cables',
      'dumbbells',
      'kettlebells',
      'machine',
      'stretches'
    ];
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
                  if (equipmentLst[i] == '모든 운동') {
                    //모든 운동을 선택한 php 파일 이용해 운동 정보 받음
                    exerciseStep = '운동 방법';
                  } else if (equipmentLst[i] == 'band') {
                    exerciseStep = '밴드를 이용한 운동들';
                  } else if (equipmentLst[i] == 'barbell') {
                    exerciseStep = '바벨을 이용한 운동들';
                  } else if (equipmentLst[i] == 'bodyweight') {
                    exerciseStep = '맨몸 운동들';
                  } else if (equipmentLst[i] == 'cables') {
                    exerciseStep = 'cables을 이용한 운동들';
                  } else if (equipmentLst[i] == 'dumbbells') {
                    exerciseStep = '덤벨을 이용한 운동들';
                  } else if (equipmentLst[i] == 'kettlebells') {
                    exerciseStep = '케틀벨을 이용한 운동들';
                  } else if (equipmentLst[i] == 'machine') {
                    exerciseStep = '머신을 이용한 운동들';
                  } else if (equipmentLst[i] == 'stretches') {
                    exerciseStep = '스트레칭 운동들';
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
