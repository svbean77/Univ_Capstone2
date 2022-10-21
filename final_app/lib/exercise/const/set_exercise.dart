List<String> setExercise(int num, String level) {
  String muscleName = "";
  String exerciseName = "";
  String exerciseImage1 = "";
  String exerciseImage2 = "";
  String equipment = "";
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
      exerciseStep = '''운동 방법 3''';
      break;
  }
  return [
    muscleName,
    exerciseName,
    exerciseImage1,
    exerciseImage2,
    equipment,
    level,
    exerciseStep
  ];
}

List<String> getExerciseLst(String muscle, String level) {
  List<String> lst = [];
  if (level == '초보자') {
    //php 파일명을 같게 하고 폴더로 초보자, 중상급자 나눌까?
  } else {
    //중상급자 if-else 문을 이용해 폴더를 설정하고 밑의 코드에서 php mysql?
  }
  //이 안에서 snapshot 등등 setExercise의 case 안에 들어갈 내용을 묶음
  //muscle은 각 php 파일의 파일명으로 설정하면 될 것 같다
  return lst;
}