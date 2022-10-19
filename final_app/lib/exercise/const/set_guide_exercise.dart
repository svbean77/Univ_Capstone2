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

class EachCols extends StatelessWidget {
  final dir;
  final col;
  final muscleLst;
  final level;

  EachCols({
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
                        exerciseImage1: exerciseLst[muscleLst[i - 1] - 1][2],
                        exerciseImage2: exerciseLst[muscleLst[i - 1] - 1][3],
                        //이미지가 하나인 경우 어떻게 처리할 것인지 생각
                        equipment: exerciseLst[muscleLst[i - 1] - 1][4],
                        difficulty: exerciseLst[muscleLst[i - 1] - 1][5],
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

  List<String> setExercise(int num) {
    String muscleName = "";
    String exerciseName = "";
    String exerciseImage1 = "";
    String exerciseImage2 = "";
    String equipment = "";
    String difficulty = "";
    String exerciseStep = '''''';

    switch (num) {
      case 1:
        muscleName = "Biceps";
        exerciseName = "이두근인가";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
        equipment = '기구 1';
        difficulty = '난이도 1';
        exerciseStep = '''운동 방법 1''';
        break;
      case 2:
        muscleName = "Chest";
        exerciseName = "가슴운동";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-chest-flyes-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-chest-flyes-front.gif";
        equipment = '기구 2';
        difficulty = '난이도 2';
        exerciseStep = '''운동 방법 2''';
        break;
      case 3:
        muscleName = "Quads";
        exerciseName = "허벅지";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-goblet-squat-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-goblet-squat-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 4:
        muscleName = "Traps";
        exerciseName = "승모근";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-uprightrow-side.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-uprightrow-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 5:
        muscleName = "Triceps";
        exerciseName = "삼두근인가";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-bench-tricep-dip-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-bench-tricep-dip-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 6:
        muscleName = "Shoulders";
        exerciseName = "어깨";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-seated-shoulder-press-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-seated-shoulder-press-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 7:
        muscleName = "Lats";
        exerciseName = "옆구리등쪽";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 8:
        muscleName = "Hamstrings";
        exerciseName = "햄스트링";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/ProneLegCurl-Back-021316.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/ProneLegCurl-Back-021316.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 9:
        muscleName = "Glutes";
        exerciseName = "엉덩이";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/bodyweight-slglutebridge-male-side.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/bodyweight-slglutebridge-male-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 10:
        muscleName = "Forearms";
        exerciseName = "팔";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-db-wristflex-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-db-wristflex-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 11:
        muscleName = "Calves";
        exerciseName = "종아리";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-sl-calf-raises-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-sl-calf-raises-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 12:
        muscleName = "Abdominals";
        exerciseName = "복근";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/female-leg-raises-front.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/female-leg-raises-front.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 13:
        muscleName = "Lower back";
        exerciseName = "등 아래";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-deadlift-front_Omfp4bo.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-deadlift-front_Omfp4bo.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 14:
        muscleName = "Traps (mid-back)";
        exerciseName = "등 중간";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-side.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
      case 15:
        muscleName = "Obliques";
        exerciseName = "옆구리";
        exerciseImage1 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-woodchopper-side.gif";
        exerciseImage2 =
            "https://www.musclewiki.com/media/uploads/kettlebell-male-woodchopper-side.gif";
        equipment = '기구 3';
        difficulty = '난이도 3';
        exerciseStep = '''운동 방법 3''';
        break;
    }
    return [
      muscleName,
      exerciseName,
      exerciseImage1,
      exerciseImage2,
      equipment,
      difficulty,
      exerciseStep
    ];
  }

  List<String> getExerciseLst(String muscle){
    List<String> lst = [];
    if (level == '초보자'){
      //php 파일명을 같게 하고 폴더로 초보자, 중상급자 나눌까?
    }else{
      //중상급자 if-else 문을 이용해 폴더를 설정하고 밑의 코드에서 php mysql?
    }
    //이 안에서 snapshot 등등 setExercise의 case 안에 들어갈 내용을 묶음
    //muscle은 각 php 파일의 파일명으로 설정하면 될 것 같다
    return lst;
  }
}
