import 'package:final_app/exercise/const/equipment_filter.dart';
import 'package:final_app/exercise/select_body.dart';
import 'package:final_app/exercise/select_muscle.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import '../screen/const/grade_colors.dart';
import 'const/exercise_card.dart';

class ExerciseGuide extends StatefulWidget {
  final int grade;
  final String level;
  final muscleName;
  final exerciseName;
  final equipment;
  final exerciseImage1;
  final exerciseImage2;
  final exerciseStep;

  const ExerciseGuide({
    this.grade = 0,
    required this.level,
    required this.exerciseStep,
    required this.exerciseName,
    required this.exerciseImage1,
    required this.exerciseImage2,
    required this.equipment,
    required this.muscleName,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseGuide> createState() => _ExerciseGuideState();
}

class _ExerciseGuideState extends State<ExerciseGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return EquipmentFilter(
                  level: widget.level,
                  exerciseImage2: widget.exerciseImage2,
                  muscleName: widget.muscleName,
                  exerciseStep: widget.exerciseStep,
                  equipment: widget.equipment,
                  exerciseName: widget.exerciseName,
                  exerciseImage1: widget.exerciseImage1);
            },
          );
        },
        backgroundColor: PRIMARY_COLOR[widget.grade],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.level} ${widget.muscleName} 운동 가이드 > ${widget.equipment}',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            TextButton(
              onPressed: () {
                if (widget.level == '초보자')
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SelectBody(),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SelectMuscle(),
                    ),
                  );
              },
              child: Text('근육 선택'),
            ),
            SizedBox(height: 16.0),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final muscleName = widget.muscleName;
                      final exerciseName = widget.exerciseName;
                      final equipment = widget.equipment;
                      final exerciseImage1 = widget.exerciseImage1;
                      final exerciseImage2 = widget.exerciseImage2;
                      final exerciseStep = widget.exerciseStep;

                      return ExerciseCard(
                        grade: 1,
                        muscleName: muscleName,
                        exerciseName: exerciseName,
                        equipment: equipment,
                        exerciseImage1: exerciseImage1,
                        exerciseImage2: exerciseImage2,
                        exerciseStep: exerciseStep,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8.0);
                    },
                    itemCount: 3)
                /*
              StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  /*
                  if(!snapshot.hasData){
                    return Center(
                      child: Text('해당하는 운동이 없습니다.', style: TextStyle(fontSize: 30.0)),
                    );
                  }
                   */
                  /*
                  if(snapshot.hasData && snapshot.data!.isEmpty){
                    return Center(
                      child: Text('운동기록이 없습니다.'),
                    );
                  }
                   */

                  //Dismissible 위젯으로 감싸면 슬라이드 했을 때 삭제 가능!
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final muscleName = widget.muscleName;
                        final exerciseName = widget.exerciseName;
                        final equipment = widget.equipment;
                        final exerciseImage1 = widget.exerciseImage1;
                        final exerciseImage2 = widget.exerciseImage2;
                        final exerciseStep = widget.exerciseStep;

                        return ExerciseCard(
                          grade: 1,
                          muscleName: muscleName,
                          exerciseName: exerciseName,
                          equipment: equipment,
                          exerciseImage1: exerciseImage1,
                          exerciseImage2: exerciseImage2,
                          exerciseStep: exerciseStep,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8.0);
                      },
                      itemCount: 3);
                }
              ),
              */
                ),
          ],
        ),
      ),
    );
  }
}
