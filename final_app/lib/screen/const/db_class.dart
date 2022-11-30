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

/*
select routine list
 */
class ROUTINE_LIST {
  List<classROUTINE_LIST>? result;

  ROUTINE_LIST({this.result});

  ROUTINE_LIST.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classROUTINE_LIST>[];
      jsondata['result'].forEach((v) {
        result!.add(new classROUTINE_LIST.fromJson(v));
      });
    }
  }
}

class classROUTINE_LIST {
  String? routine;
  int? time;

  classROUTINE_LIST({this.routine, this.time});

  classROUTINE_LIST.fromJson(Map<String, dynamic> jsondata) {
    routine = jsondata['routine'];
    time = jsondata['time'];
  }
}

/*
select routine detail
 */
class ROUTINE_DETAIL {
  List<classROUTINE_DETAIL>? result;

  ROUTINE_DETAIL({this.result});

  ROUTINE_DETAIL.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classROUTINE_DETAIL>[];
      jsondata['result'].forEach((v) {
        result!.add(new classROUTINE_DETAIL.fromJson(v));
      });
    }
  }
}

class classROUTINE_DETAIL {
  String? routine;
  String? exercise;
  String? num;
  String? image1;
  String? image2;
  String? step;

  classROUTINE_DETAIL(
      {this.routine,
      this.exercise,
      this.num,
      this.image1,
      this.image2,
      this.step});

  classROUTINE_DETAIL.fromJson(Map<String, dynamic> jsondata) {
    routine = jsondata['routine'];
    exercise = jsondata['exercise'];
    num = jsondata['num'];
    image1 = jsondata['image1'];
    image2 = jsondata['image2'];
    step = jsondata['step'];
  }
}

/*
select my routine list
 */

class MY_ROUTINE_LIST {
  List<classMY_ROUTINE_LIST>? result;

  MY_ROUTINE_LIST({this.result});

  MY_ROUTINE_LIST.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classMY_ROUTINE_LIST>[];
      jsondata['result'].forEach((v) {
        result!.add(new classMY_ROUTINE_LIST.fromJson(v));
      });
    }
  }
}

class classMY_ROUTINE_LIST {
  int? id;
  String? routine;
  String? nickname;

  classMY_ROUTINE_LIST({this.id, this.routine, this.nickname});

  classMY_ROUTINE_LIST.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    routine = jsondata['routine'];
    nickname = jsondata['nickname'];
  }
}

/*
select my routine detail
 */
class MY_ROUTINE_DETAIL {
  List<classMY_ROUTINE_DETAIL>? result;

  MY_ROUTINE_DETAIL({this.result});

  MY_ROUTINE_DETAIL.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classMY_ROUTINE_DETAIL>[];
      jsondata['result'].forEach((v) {
        result!.add(new classMY_ROUTINE_DETAIL.fromJson(v));
      });
    }
  }
}

class classMY_ROUTINE_DETAIL {
  int? id;
  String? nickname;
  String? routine;
  String? exercise;
  String? num;
  String? image1;
  String? image2;
  String? step;

  classMY_ROUTINE_DETAIL(
      {this.nickname,
      this.id,
      this.routine,
      this.exercise,
      this.num,
      this.image1,
      this.image2,
      this.step});

  classMY_ROUTINE_DETAIL.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    nickname = jsondata['nickname'];
    routine = jsondata['routine'];
    exercise = jsondata['exercise'];
    num = jsondata['num'];
    image1 = jsondata['image1'];
    image2 = jsondata['image2'];
    step = jsondata['step'];
  }
}

/*
select my exercise record (on selected date)
 */
class MY_EXERCISE_RECORD {
  List<classMY_EXERCISE_RECORD>? result;

  MY_EXERCISE_RECORD({this.result});

  MY_EXERCISE_RECORD.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classMY_EXERCISE_RECORD>[];
      jsondata['result'].forEach((v) {
        result!.add(new classMY_EXERCISE_RECORD.fromJson(v));
      });
    }
  }
}

class classMY_EXERCISE_RECORD {
  String? comment;
  String? writeDate;

  classMY_EXERCISE_RECORD({
    this.comment,
    this.writeDate,
  });

  classMY_EXERCISE_RECORD.fromJson(Map<String, dynamic> jsondata) {
    comment = jsondata['comment'];
    writeDate = jsondata['writeDate'];
  }
}

/*
select my weight
 */
class WEIGHT {
  List<classWEIGHT>? result;

  WEIGHT({this.result});

  WEIGHT.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classWEIGHT>[];
      jsondata['result'].forEach((v) {
        result!.add(new classWEIGHT.fromJson(v));
      });
    }
  }
}

class classWEIGHT {
  double? weight;
  String? writeDate;

  classWEIGHT({this.weight, this.writeDate});

  classWEIGHT.fromJson(Map<String, dynamic> jsondata) {
    weight = double.parse(jsondata['weight'].toString());
    writeDate = jsondata['writeDate'];
  }
}

/*
select friends
 */
class FRIENDS {
  List<classFRIENDS>? result;

  FRIENDS({this.result});

  FRIENDS.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classFRIENDS>[];
      jsondata['result'].forEach((v) {
        result!.add(new classFRIENDS.fromJson(v));
      });
    }
  }
}

class classFRIENDS {
  String? friends;
  String? rating;

  classFRIENDS({
    this.friends,
    this.rating,
  });

  classFRIENDS.fromJson(Map<String, dynamic> jsondata) {
    friends = jsondata['friends'];
    rating = jsondata['rating'];
  }
}

/*
select request friends
 */
class REQUESTED {
  List<classREQUESTED>? result;

  REQUESTED({this.result});

  REQUESTED.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata['result'] != null) {
      result = <classREQUESTED>[];
      jsondata['result'].forEach((v) {
        result!.add(new classREQUESTED.fromJson(v));
      });
    }
  }
}

class classREQUESTED {
  String? request;
  String? rating;

  classREQUESTED({this.request, this.rating});

  classREQUESTED.fromJson(Map<String, dynamic> jsondata) {
    request = jsondata['request'];
    rating = jsondata['rating'];
  }
}
