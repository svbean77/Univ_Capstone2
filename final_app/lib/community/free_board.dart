import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:final_app/community/const/contents.dart';
import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/community/const/searchPage.dart';
import 'package:final_app/community/write_board.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/ip_address.dart';

class FreeBoard extends StatefulWidget {
  final loginID;
  final grade;
  const FreeBoard({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeBoard> createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  final TextEditingController controller = TextEditingController();

  Future getDatas() async {
    /*
    var url =
        Uri.http(IP_ADDRESS, '/test_select_freeboard.php', {'q': '{http}'});

     */
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_freeboard.php");
    var response = await http.post(url, body: <String, String>{});
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    ALLCONTENTS data = ALLCONTENTS.fromJson(jsondata);

    final _directory = await getTemporaryDirectory();

    return [data, _directory];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: PRIMARY_COLOR[widget.grade],
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => WriteBoard(
                      board: 'free',
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: snapshot.hasData
                    ? [
                        Container(
                          height: MediaQuery.of(context).size.height / 15,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: widget.grade == 0
                                          ? Colors.grey.withOpacity(0.2)
                                          : PRIMARY_COLOR[widget.grade],
                                    ),
                                  ),
                                  child: TextField(
                                    controller: controller,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      hintText: '제목으로 검색',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              GestureDetector(
                                child: Icon(Icons.search),
                                onTap: () async {
                                  if (controller.text.toString() != "") {
                                    var url = Uri.parse(
                                        "http://${IP_ADDRESS}/test_select_search_board.php");
                                    /*
                              var url = Uri.http(
                                  IP_ADDRESS,
                                  '/test_select_search_board.php',
                                  {'q': '{http}'});

                               */
                                    var response = await http
                                        .post(url, body: <String, String>{
                                      "board": "free".toString(),
                                      "search": controller.text.toString(),
                                    });
                                    var jsondata = jsonDecode(json
                                        .decode(json.encode(response.body)));
                                    ALLCONTENTS data =
                                        ALLCONTENTS.fromJson(jsondata);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SearchPage(
                                          data: data.result!,
                                          searchfor: controller.text.toString(),
                                          loginID: widget.loginID,
                                          directory: snapshot.data[1],
                                          board: 'free',
                                          grade: widget.grade,
                                        ),
                                      ),
                                    );
                                  } else {
                                    MyToast(
                                        '검색어를 입력해주세요.',
                                        PRIMARY_COLOR[widget.grade],
                                        (widget.grade == 0 ||
                                                widget.grade == 1 ||
                                                widget.grade == 2 ||
                                                widget.grade == 4 ||
                                                widget.grade == 8)
                                            ? Colors.black
                                            : Colors.white);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: Container(
                            child: snapshot.data[0].result!.length == 0
                                ? Container(
                                    child: Center(
                                      child: Text('게시글이 없습니다.'),
                                    ),
                                  )
                                : ListView(
                                    children: [
                                      for (int i = 0;
                                          i < snapshot.data[0].result!.length;
                                          i++)
                                        GestureDetector(
                                          child: ContentsList(
                                              data: snapshot.data[0].result![i],
                                              grade: widget.grade),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Contents(
                                                  loginID: widget.loginID,
                                                  board: 'free',
                                                  data: snapshot
                                                      .data[0].result![i],
                                                  directory: snapshot.data[1],
                                                  grade: widget.grade,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                          ),
                        ),
                      ]
                    : [
                        Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 8.0),
                              Text('데이터를 불러오고 있습니다..'),
                              SizedBox(height: 8.0),
                              Text('* 사진을 불러오는 데 많은 시간이 소요됩니다. *'),
                            ],
                          ),
                        ),
                      ],
              ),
            ),
          );
        });
  }
}
