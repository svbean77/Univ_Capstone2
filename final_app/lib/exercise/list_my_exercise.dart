import 'package:final_app/exercise/const/add_exercise.dart';
import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ListMyExercise extends StatefulWidget {
  final String routineName;
  const ListMyExercise({
    required this.routineName,
    Key? key,
  }) : super(key: key);

  @override
  State<ListMyExercise> createState() => _ListMyExerciseState();
}

class _ListMyExerciseState extends State<ListMyExercise> {
  int grade = 0;

  @override
  Widget build(BuildContext context) {
    //운동 이름 등 db에서 select
    List<String> exerciseName = ['운동1', '운동2', '운동3', '운동4'];
    List<int> number = [15, 10, 12, 20];
    //횟수랑 시간은 어떻게 구분할 것인가?
    //db 속성으로 횟수 t/f를 만들고 t이면 회, f이면 초로 단위를 추가
    List<String> isTime = ['f', 'f', 'f', 't'];
    int grade = 0;

    String numberUnit(String boolean){
      String unit = (boolean == 't') ? '초' : '회';

      return unit;
    }

    return Scaffold(
      drawer: MyDrawer(grade: grade),
      appBar: MyAppBar(grade: grade),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //db에 운동을 추가하는 코드
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddExercise(),
                scrollable: true,
              );
            },
          );
        },
        backgroundColor: PRIMARY_COLOR[grade],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              widget.routineName,
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 30.0),
            for (int i = 0; i < exerciseName.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: (){
                    //db 횟수를 변경하는 코드 작성
                    //ListView를 실시간으로 바꿀 수 있도록 코드 수정
                  },
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
                        Text('${number[i].toString()}${numberUnit(isTime[i])}'),
                      ],
                    ),
                  ),
                ),
              ),
            TextButton(
              onPressed: () {
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
                        number: number[0]),
                  ),
                );
              },
              child: Text('운동시작'),
            ),
          ],
        ),
      ),
    );
  }
}
