import 'package:flutter/material.dart';

import '../const/const_exercise_info.dart';
import '../const/search_name.dart';

class TestScreen extends StatelessWidget {
  final level;
  const TestScreen({
    required this.level,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: [
                    Card(
                      elevation: 0,
                      child: Text(
                        '근육 이름으로 검색',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    for (int i = 0; i < muscleLst.length; i++)
                      SearchName(name: muscleLst[i], level: level)
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.search),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

class Autogenerated {
  List<Result>? result;

  Autogenerated({this.result});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? muscle;
  String? equipment;
  String? difficulty;
  String? exercise;
  String? image1;
  String? image2;
  String? step;

  Result(
      {this.muscle,
      this.equipment,
      this.difficulty,
      this.exercise,
      this.image1,
      this.image2,
      this.step});

  Result.fromJson(Map<String, dynamic> json) {
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulty'];
    exercise = json['exercise'];
    image1 = json['image1'];
    image2 = json['image2'];
    step = json['step'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['muscle'] = this.muscle;
    data['equipment'] = this.equipment;
    data['difficulty'] = this.difficulty;
    data['exercise'] = this.exercise;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['step'] = this.step;
    return data;
  }
}
