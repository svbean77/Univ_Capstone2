import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ListExercise extends StatefulWidget {
  /*
  class 형태로 불러왔다고 가정!
   */
  final loginID;
  final routineName;
  const ListExercise({
    required this.loginID,
    required this.routineName,
    Key? key,
  }) : super(key: key);

  @override
  State<ListExercise> createState() => _ListExerciseState();
}

class _ListExerciseState extends State<ListExercise> {
  @override
  Widget build(BuildContext context) {
    /*
    select: 사용자 테마 선택
     */
    List<String> exerciseName = ['운동1', '운동2', '운동3', '운동4'];
    List<int> number = [15, 10, 12, 20];
    List<String> isTime = ['f', 'f', 'f', 't'];
    int grade = 5;

    String numberUnit(String boolean) {
      String unit = (boolean == 't') ? '초' : '회';

      return unit;
    }

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    widget.routineName,
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(height: 16.0),
                  for (int i = 0; i < exerciseName.length; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PRIMARY_COLOR[grade],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              exerciseName[i],
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                                '${number[i].toString()}${numberUnit(isTime[i])}'),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR[grade],
                elevation: 0,
              ),
              onPressed: () {
                /*
                class 형태로 전달
                 */
                String exerciseStep = '운동방법';
                String exerciseImage1 =
                    "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
                String exerciseImage2 =
                    "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RoutineGuide(
                      routineName: widget.routineName,
                      exerciseName: exerciseName[0],
                      exerciseStep: exerciseStep,
                      exerciseImage1: exerciseImage1,
                      exerciseImage2: exerciseImage2,
                      numberUnit: numberUnit(isTime[0]),
                      number: number[0],
                      loginID: widget.loginID,
                    ),
                  ),
                );
              },
              child: Text(
                '운동시작',
                style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
