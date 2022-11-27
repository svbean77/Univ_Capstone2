/*
select user data
 */

class USERDATA {
  List<classUSERDATA>? result;

  USERDATA({this.result});

  USERDATA.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <classUSERDATA>[];
      json['result'].forEach((v) {
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

  classUSERDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    nickname = json['nickname'];
    userage = json['userage'];
    sex = json['sex'];
    rating = json['rating'];
    deadlift = json['deadlift'];
    benchpress = json['benchpress'];
    squat = json['squat'];
    total = json['total'];
    apptheme = json['apptheme'];
  }
}

/*
select exercise guide data
 */
class EXERCISE_GUIDE {
  List<classEXERCISE_GUIDE>? result;

  EXERCISE_GUIDE({this.result});

  EXERCISE_GUIDE.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <classEXERCISE_GUIDE>[];
      json['result'].forEach((v) {
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

  classEXERCISE_GUIDE.fromJson(Map<String, dynamic> json) {
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulty'];
    exercise = json['exercise'];
    image1 = json['image1'];
    image2 = json['image2'];
    step = json['step'];
  }
}

/*
select all exercise separated by muscle
 */

class ALL_EXERCISE {
  List<classALL_EXERCISE>? result;

  ALL_EXERCISE({this.result});

  ALL_EXERCISE.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <classALL_EXERCISE>[];
      json['result'].forEach((v) {
        result!.add(new classALL_EXERCISE.fromJson(v));
      });
    }
  }
}

class classALL_EXERCISE {
  String? exercise;

  classALL_EXERCISE({this.exercise});

  classALL_EXERCISE.fromJson(Map<String, dynamic> json) {
    exercise = json['exercise'];
  }
}
