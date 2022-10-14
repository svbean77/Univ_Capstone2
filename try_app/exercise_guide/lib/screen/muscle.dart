import 'package:exercise_guide/screen/guide.dart';
import 'package:flutter/material.dart';

final noAction = () {};

class Muscle extends StatelessWidget {
  const Muscle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              '중상급자 근육 부위별 운동',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '앞모습',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EachCols(dir: 'muscle_front', col: 1),
                EachCols(dir: 'muscle_front', col: 2),
                EachCols(dir: 'muscle_front', col: 3),
                EachCols(dir: 'muscle_front', col: 4),
                EachCols(dir: 'muscle_front', col: 5),
                EachCols(dir: 'muscle_front', col: 6),
                EachCols(dir: 'muscle_front', col: 7),
                EachCols(dir: 'muscle_front', col: 8),
                EachCols(dir: 'muscle_front', col: 9),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EachCols(dir: 'muscle_back', col: 1),
                EachCols(dir: 'muscle_back', col: 2),
                EachCols(dir: 'muscle_back', col: 3),
                EachCols(dir: 'muscle_back', col: 4),
                EachCols(dir: 'muscle_back', col: 5),
                EachCols(dir: 'muscle_back', col: 6),
                EachCols(dir: 'muscle_back', col: 7),
                EachCols(dir: 'muscle_back', col: 8),
                EachCols(dir: 'muscle_back', col: 9),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

  EachCols({
    required this.dir,
    required this.col,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onTap = [];
    for (int i = 0; i < 16; i++) onTap.add(noAction);
    final exerciseStep = '''1. 바 아래에서 1 피트로 서서 어깨 너비를 분리하여 손으로 막대를 잡습니다.
2. 무릎을 구부린 다음 등을 곧게 펴서 막대를 들어 올리십시오.등을 똑바로 유지하는 것이 중요합니다.
3. 전체 높이에 서서 잡으십시오.
4. 무릎을 구부리고 등을 똑바로 유지하여 바를 바닥으로 내립니다.''';
    final exerciseName = '데드리프트';
    final exerciseImage =
        'https://www.musclewiki.com/media/uploads/male-barbell-deadlift-front.gif';
    final equipment = '바벨';
    final muscleName = '등';
    final difficulty = 'Master';
    final gotoFunc = Muscle();

    //onTap[3] = tapMuscle;
    return Column(
      children: [
        for (int i = 1; i <= 16; i++)
          LoadImage(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => gotoFunc,
                  ),
                );
              },
              dir: dir,
              col: col,
              row: i),
      ],
    );
  }
/*
  void tapMuscle() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => Guide(
            exerciseStep: '''1. 바 아래에서 1 피트로 서서 어깨 너비를 분리하여 손으로 막대를 잡습니다.
2. 무릎을 구부린 다음 등을 곧게 펴서 막대를 들어 올리십시오.등을 똑바로 유지하는 것이 중요합니다.
3. 전체 높이에 서서 잡으십시오.
4. 무릎을 구부리고 등을 똑바로 유지하여 바를 바닥으로 내립니다.''',
            exerciseName: '데드리프트',
            exerciseImage:
                'https://www.musclewiki.com/media/uploads/male-barbell-deadlift-front.gif',
            equipment: '바벨',
            muscleName: '등',
            difficulty: 'Master'),
      ),
    );

    //Navigator.pushNamed(context, '/muscleOne');
    print('근육 누르기');
  }

 */
}
