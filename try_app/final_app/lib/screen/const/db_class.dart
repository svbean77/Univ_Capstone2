/*
select user data join select theme index
 */

class USERDATA {
  List<classUSERDATA>? result;

  USERDATA({this.result});

  USERDATA.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classUSERDATA>[];
      jsondata['result'].forEach((v) {
        result!.add(new classUSERDATA.fromJson(v));
      });
    }
  }
}

class classUSERDATA {
  int? id;
  String? username;
  String? password;
  String? nickname;
  int? userage;
  String? sex;
  String? rating;
  int? deadlift;
  int? benchpress;
  int? squat;
  int? total;
  int? apptheme;

  classUSERDATA({
    this.id,
    this.username,
    this.password,
    this.nickname,
    this.userage,
    this.sex,
    this.rating,
    this.deadlift,
    this.benchpress,
    this.squat,
    this.total,
    this.apptheme,
  });

  classUSERDATA.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    username = jsondata['username'];
    password = jsondata['password'];
    nickname = jsondata['nickname'];
    userage = jsondata['userage'];
    sex = jsondata['sex'];
    rating = jsondata['rating'];
    deadlift = jsondata['deadlift'];
    benchpress = jsondata['benchpress'];
    squat = jsondata['squat'];
    total = jsondata['total'];
    apptheme = jsondata['apptheme'];
  }
}

/*
select exercise guide data
 */
class EXERCISE_GUIDE {
  List<classEXERCISE_GUIDE>? result;

  EXERCISE_GUIDE({this.result});

  EXERCISE_GUIDE.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classEXERCISE_GUIDE>[];
      jsondata['result'].forEach((v) {
        result!.add(new classEXERCISE_GUIDE.fromJson(v));
      });
    }
  }
}

class classEXERCISE_GUIDE {
  String? muscle;
  String? equipment;
  String? difficulty;
  String? exercise;
  String? image1;
  String? image2;
  String? step;

  classEXERCISE_GUIDE(
      {this.muscle,
      this.equipment,
      this.difficulty,
      this.exercise,
      this.image1,
      this.image2,
      this.step});

  classEXERCISE_GUIDE.fromJson(Map<String, dynamic> jsondata) {
    muscle = jsondata['muscle'];
    equipment = jsondata['equipment'];
    difficulty = jsondata['difficulty'];
    exercise = jsondata['exercise'];
    image1 = jsondata['image1'];
    image2 = jsondata['image2'];
    step = jsondata['step'];
  }
}

/*
select all exercise separated by muscle
 */

class ALL_EXERCISE {
  List<classALL_EXERCISE>? result;

  ALL_EXERCISE({this.result});

  ALL_EXERCISE.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classALL_EXERCISE>[];
      jsondata['result'].forEach((v) {
        result!.add(new classALL_EXERCISE.fromJson(v));
      });
    }
  }
}

class classALL_EXERCISE {
  String? exercise;

  classALL_EXERCISE({this.exercise});

  classALL_EXERCISE.fromJson(Map<String, dynamic> jsondata) {
    exercise = jsondata['exercise'];
  }
}

