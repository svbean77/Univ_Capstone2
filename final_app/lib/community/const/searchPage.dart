import 'package:final_app/community/const/contents.dart';
import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final boardLst;
  final searchfor;
  const SearchPage({
    required this.searchfor,
    required this.boardLst,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  List<bool> search = [true, false];


  @override
  Widget build(BuildContext context) {
    int grade = 5;
    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.searchfor} 검색 결과', style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 16.0),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              child: Row(
                children: [
                  ToggleButtons(
                    children: [
                      Text('제목'),
                      Text('작성자'),
                    ],
                    isSelected: search,
                    selectedColor: Colors.black,
                    fillColor: (grade == 0 || grade == 7)
                        ? Colors.black.withOpacity(0.1)
                        : PRIMARY_COLOR[grade].withOpacity(0.3),
                    onPressed: (value) {
                      setState(() {
                        if (value == 0) {
                          search[0] = true;
                          search[1] = false;
                        } else {
                          search[0] = false;
                          search[1] = true;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grade == 0
                              ? Colors.black.withOpacity(0.2)
                              : PRIMARY_COLOR[grade],
                        ),
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      List<int> findLst = [];
                      String find = controller.text.toString();
                      if (search[0] == true) {
                        //제목으로 게시글 검색
                        //php로 제목에 find가 포함된 게시글 번호 가져옴
                        findLst = [1, 4, 5];
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SearchPage(
                                boardLst: findLst, searchfor: widget.searchfor),
                          ),
                        );
                      } else {
                        //작성자로 게시글 검색
                        //php로 작성자가 find인 게시글 번호 가져옴
                        findLst = [2, 6, 7, 8];
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SearchPage(
                                boardLst: findLst, searchfor: widget.searchfor),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                child: widget.boardLst.length == 0
                    ? Container(
                        child: Center(
                          child: Text('게시글이 없습니다.'),
                        ),
                      )
                    : ListView(
                        children: [
                          for (int i = 0; i < widget.boardLst.length; i++)
                            GestureDetector(
                              child: ContentsList(
                                  boardnum: widget.boardLst[i], grade: grade),
                              onTap: () {
                                //게시판 번호를 이용해 게시글 정보를 불러오는 코드
                                String title = '게시판 제목';
                                String contents = '게시판 내용${i}';

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Contents(
                                        board: '자유게시판',
                                        title: title,
                                        contents: contents),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}