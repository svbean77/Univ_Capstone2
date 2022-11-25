
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ip_address.dart';

List<String> setExercise(int num, String level, String equipment) {
  //이 모든 것을 각각 리스트로 만들어 넣으면 될 것 같아! List<String> 어쩌구 (return에서 마저 설명)
  //나중에 equipment도 파라미터 사용해야 할 수 있음 일단 이렇게 해두기

  String muscleName = "";
  String exerciseName = "";
  String exerciseImage1 = "";
  String exerciseImage2 = "";
  String equipment = "맨몸";
  String difficulty = "";
  String exerciseStep = '''''';

  switch (num) {
    case 1:
      muscleName = "이두";
      exerciseName = "이두운동";
      difficulty = "초보자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 1''';
      break;
    case 2:
      muscleName = "가슴";
      exerciseName = "가슴운동";
      difficulty = "초보자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-chest-flyes-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-chest-flyes-front.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 2''';
      break;
    case 3:
      muscleName = "대퇴 사두근";
      exerciseName = "대퇴사두근운동";
      difficulty = "초보자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-goblet-squat-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-goblet-squat-front.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 3''';
      break;
    case 4:
      muscleName = "승모근";
      exerciseName = "승모근";
      difficulty = "초보자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-uprightrow-side.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-uprightrow-side.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 3''';
      break;
    case 5:
      muscleName = "삼두";
      exerciseName = "삼두";
      difficulty = "초보자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-bench-tricep-dip-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-bench-tricep-dip-front.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 3''';
      break;
    case 6:
      muscleName = "어깨";
      exerciseName = "어깨";
      difficulty = "중급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-seated-shoulder-press-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-seated-shoulder-press-front.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 3''';
      break;
    case 7:
      muscleName = "광배근";
      exerciseName = "광배근";
      difficulty = "중급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-front.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 3''';
      break;
    case 8:
      muscleName = "대퇴 이두근";
      exerciseName = "대퇴 이두근";
      difficulty = "중급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/ProneLegCurl-Back-021316.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/ProneLegCurl-Back-021316.gif";
      //equipment = '맨몸';
      exerciseStep = '''운동 방법 3''';
      break;
    case 9:
      muscleName = "둔근";
      exerciseName = "둔근";
      difficulty = "중급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/bodyweight-slglutebridge-male-side.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/bodyweight-slglutebridge-male-side.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
    case 10:
      muscleName = "전완근";
      exerciseName = "전완근";
      difficulty = "중급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-db-wristflex-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-db-wristflex-front.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
    case 11:
      muscleName = "종아리";
      exerciseName = "종아리";
      difficulty = "상급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-sl-calf-raises-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-sl-calf-raises-front.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
    case 12:
      muscleName = "복근";
      exerciseName = "복근";
      difficulty = "상급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/female-leg-raises-front.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/female-leg-raises-front.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
    case 13:
      muscleName = "등 하부";
      difficulty = "상급자";
      exerciseName = "등 하부";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-deadlift-front_Omfp4bo.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-deadlift-front_Omfp4bo.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
    case 14:
      muscleName = "등 중앙부";
      exerciseName = "등 중앙부";
      difficulty = "상급자";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-side.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/male-dumbbell-bilateral-row-side.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
    case 15:
      muscleName = "복사근";
      difficulty = "상급자";
      exerciseName = "복사근";
      exerciseImage1 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-woodchopper-side.gif";
      exerciseImage2 =
      "https://www.musclewiki.com/media/uploads/kettlebell-male-woodchopper-side.gif";
      //equipment = '기구 3';
      exerciseStep = '''운동 방법 3''';
      break;
  }
  //return 형태는 List<List<String>>이 됨!
  return [
    muscleName,
    exerciseName,
    exerciseImage1,
    exerciseImage2,
    equipment,
    level,
    exerciseStep,
    difficulty
  ];
}
