import 'dart:async';
import 'dart:convert';

import 'package:final_app/mypage/const/challenge_detail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:final_app/mypage/const/writeChallenge.dart';
import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/drawer.dart';
import '../screen/const/ip_address.dart';

class ThreeChallenge extends StatefulWidget {
  final loginID;
  final grade;
  const ThreeChallenge({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<ThreeChallenge> createState() => _ThreeChallengeState();
}

class _ThreeChallengeState extends State<ThreeChallenge> {
  //StreamController controller = StreamController();
  //Timer? _timer;

  Future getDatas() async {
    var url =
        Uri.http(IP_ADDRESS, '/test_select_threeboard.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    ALLCONTENTS data = ALLCONTENTS.fromJson(jsondata);
    //final _directory = await getTemporaryDirectory();

    return data;
    //controller.add(data);
  }

/*
  @override
  void initState() {
    getDatas();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => getDatas());
    super.initState();
  }

  @override
  void dispose() {
    if (_timer!.isActive) _timer!.cancel();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[widget.grade],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => WriteChallenge(
                loginID: widget.loginID,
                grade: widget.grade,
              ),
            ),
          );
        },
        child: Icon(Icons.create,
            color: (widget.grade == 0 ||
                    widget.grade == 1 ||
                    widget.grade == 2 ||
                    widget.grade == 4 ||
                    widget.grade == 8)
                ? Colors.black
                : Colors.white),
      ),
      body: FutureBuilder(
          future: getDatas(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: "3대 챌린지 기록", grade: widget.grade, size: "25"),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: ListView(
                      children: snapshot.hasData
                          ? [
                              snapshot.data.result!.length == 0
                                  ? Center(
                                      child: Text('챌린지 기록이 없습니다.'),
                                    )
                                  : Container(),
                              for (int i = 0;
                                  i < snapshot.data.result!.length;
                                  i++)
                                GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: MyContainer(
                                      height: 70.0,
                                      width: double.infinity,
                                      grade: widget.grade,
                                      child: MyText(
                                        text: snapshot.data.result![i].title,
                                        grade: widget.grade,
                                        size: "20",
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ChallengeDetail(
                                          loginID: widget.loginID,
                                          data: snapshot.data.result![i],
                                          grade: widget.grade,
                                        ),
                                      ),
                                    );
                                  },
                                )
                            ]
                          : [CircularProgressIndicator()],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
