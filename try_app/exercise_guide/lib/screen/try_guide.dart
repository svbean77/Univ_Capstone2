import 'package:exercise_guide/screen/exercise_card.dart';
import 'package:flutter/material.dart';

class TryGuide extends StatefulWidget {
  final muscleName;
  final exerciseName;
  final equipment;
  final difficulty;
  final exerciseImage;
  final exerciseStep;

  const TryGuide({
    required this.exerciseStep,
    required this.exerciseName,
    required this.exerciseImage,
    required this.equipment,
    required this.muscleName,
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  State<TryGuide> createState() => _TryGuideState();
}

class _TryGuideState extends State<TryGuide> {
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
            final muscleName = widget.muscleName;
            final exerciseName = widget.exerciseName;
            final equipment = widget.equipment;
            final exerciseImage = widget.exerciseImage;
            final exerciseStep = widget.exerciseStep;

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
