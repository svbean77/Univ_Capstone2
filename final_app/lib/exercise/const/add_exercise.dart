import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

enum UnitItems { numbers, times }

class _AddExerciseState extends State<AddExercise> {
  List<String> muscleLst = [
    '근육1',
    '근육2',
    '근육3',
    '근육4',
    '근육5',
    '근육6',
    '근육7',
    '근육8',
    '근육9',
    '근육10',
    '근육11',
    '근육12',
    '근육13',
    '근육14',
    '근육15'
  ];
  int grade = 0;
  String? selectedMuscle;
  String? selectedExercise;
  UnitItems? selectedUnit = UnitItems.numbers;
  List<bool> units = <bool>[true, false];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '운동 추가하기',
            style: TextStyle(fontSize: 20.0),
          ),
          FormField(builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('근육을 선택해주세요'),
                  value: selectedMuscle,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMuscle = newValue!;
                      selectedExercise = null;
                    });
                  },
                  items: muscleLst.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
          FormField(builder: (FormFieldState<String> state) {
            //해당 근육에 따른 운동 리스트를 골라와야함
            List<String> exerciseLst = [];
            //selectedMuscle을 통해 php문을 실행하고 운동 종류를 불러옴
            if (selectedMuscle == '근육1')
              exerciseLst = ['근육1운동1', '근육1운동2', '근육1운동3'];
            else if (selectedMuscle == '근육11')
              exerciseLst = ['근육11운동7', '근육11운동8'];
            else
              exerciseLst = ['그냥운동1', '그냥운동2', '그냥운동3', '그냥운동4', '그냥운동5'];

            return InputDecorator(
              decoration: InputDecoration(),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('운동을 선택해주세요'),
                  value: selectedExercise,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedExercise = newValue!;
                    });
                  },
                  items: exerciseLst.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
          Text('횟수 및 시간 선택', style: TextStyle(fontSize: 20.0)),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      hintText: '횟수 및 시간',
                    ),
                  ),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                ToggleButtons(
                  children: [
                    Text('횟수'), Text('시간'),
                  ],
                  isSelected: units,
                  selectedColor: PRIMARY_COLOR[grade],
                  onPressed: (value){
                    setState(() {
                      if(value == 0){
                        units[0] = true;
                        units[1] = false;
                      }
                      else{
                        units[0] = false;
                        units[1] = true;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
              SizedBox(width: 30.0),
              TextButton(
                onPressed: () {
                  //db에 루틴 추가하는 코드 작성
                  //추가됨에 따라 실시간으로 화면에 추가
                  if (units[1] == true) {
                    //시간으로 db에 저장
                  } else if (units[0] == true) {
                    //횟수로 db에 저장
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  '추가',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
