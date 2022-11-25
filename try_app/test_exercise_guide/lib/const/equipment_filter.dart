import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/exercise_guide.dart';
import 'const_exercise_info.dart';
import 'ip_address.dart';

class EquipmentFilter extends StatelessWidget {
  final level;
  final muscle;

  EquipmentFilter({
    required this.level,
    required this.muscle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height / 2,
      child: ListView(
        children: [
          Card(
            elevation: 0,
            child: ListTile(
              title: Text(
                '운동 도구로 고르기',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          for (int i = 0; i < equipmentLst.length; i++)
            Card(
              elevation: 0,
              child: ListTile(
                title: Text(equipmentLst[i]),
                onTap: () async {
                  String equipment;

                  if (equipmentLst[i] == '밴드') {
                    equipment = '밴드';
                  } else if (equipmentLst[i] == '바벨') {
                    equipment = '바벨';
                  } else if (equipmentLst[i] == '맨몸') {
                    equipment = '맨몸';
                  } else if (equipmentLst[i] == '케이블') {
                    equipment = '케이블';
                  } else if (equipmentLst[i] == '덤벨') {
                    equipment = '덤벨';
                  } else if (equipmentLst[i] == '케틀벨') {
                    equipment = '케틀벨';
                  } else if (equipmentLst[i] == '머신') {
                    equipment = '머신';
                  } else {
                    equipment = '스트레칭';
                  }
                  var url = Uri.http(IP_ADDRESS, '/test_select.php', {'q': '{http}'});
                  var response = await http.post(url, body: <String, String>{
                    "muscle": muscle.toString(),
                    "equipment": equipment.toString(),
                    "difficulty": level.toString(),
                  });
                  var jsondata = jsonDecode(json.decode(json.encode(response.body)));

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ExerciseGuide(level: level, jsondata: jsondata, muscle: muscle, equipment: equipment),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
