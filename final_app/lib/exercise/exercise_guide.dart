import 'package:flutter/material.dart';

import '../mypage/my_page.dart';
import '../mypage/notice.dart';
import '../mypage/sign_in.dart';
import '../mypage/three_challenge.dart';
import '../screen/home_screen.dart';
import 'exercise_card.dart';

class ExerciseGuide extends StatefulWidget {
  final muscleName;
  final exerciseName;
  final equipment;
  final difficulty;
  final exerciseImage;
  final exerciseStep;

  const ExerciseGuide({
    required this.exerciseStep,
    required this.exerciseName,
    required this.exerciseImage,
    required this.equipment,
    required this.muscleName,
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseGuide> createState() => _ExerciseGuideState();
}

class _ExerciseGuideState extends State<ExerciseGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignIn(),
                  ),
                );
              },
              child: DrawerHeader(
                child: Text('프로필사진 크게'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('닉네임'),
                    Text('등급'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('수분섭취'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.coffee),
                        Text('nn컵 / mm컵'),
                        TextButton(
                          child: Text('+1컵'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3대 챌린지'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ThreeChallenge(),
                    ),
                  );
                },
              ),
              elevation: 0,
            ),
            Card(
              child: ListTile(
                title: Text('공지사항'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Notice(),
                    ),
                  );
                },
              ),
              elevation: 0,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('득근득근'),
//backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: (){},
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
