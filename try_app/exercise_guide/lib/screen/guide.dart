import 'package:exercise_guide/screen/exercise_card.dart';
import 'package:flutter/material.dart';

class Guide extends StatefulWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('득근득근'),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.filter_list_alt,
          color: Colors.red,
          size: 30.0,
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final muscleName = "복부";
            final exerciseName = "Crunches";
            final equipment = "Bodyweight";
            final exerciseImage =
                "https://www.musclewiki.com/media/uploads/Crunch-Front-021316.gif";
            final exerciseStep = '''1. 무릎이 구부러지고 발이 바닥에 평평한 상태에서 등을 평평하게 놓으십시오.
2. 손바닥을 향하게하여 사원에 손가락을 놓으십시오.
3. 배를 척추의 바닥으로 끌어 당겨 근육을 참여시킨 다음 머리와 어깨를 바닥에서 내립니다.시작 위치로 돌아가서 반복하십시오.''';

            return ExerciseCard(
              grade: 1,
              muscleName: muscleName,
              exerciseName: exerciseName,
              equipment: equipment,
              exerciseImage: exerciseImage,
              exerciseStep: exerciseStep,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.0);
          },
          itemCount: 3),
    );
  }
}
