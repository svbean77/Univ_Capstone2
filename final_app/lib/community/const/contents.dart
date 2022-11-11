import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class Contents extends StatelessWidget {
  //board만 불러오고 나머지 내용들은 여기서 db 불러오기로 할까
  final board;
  final title;
  final contents;
  const Contents({
    required this.board,
    required this.title,
    required this.contents,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String writer = '작성자이름';
    String date = '2022.11.11';

    int grade = 0;
    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //어느 페이지로 이동시킬지 생각을 해봐야겠다..
          //pop을 했을 때 변경사항이 반영이 되는지 확인! 일단 pop으로 구현
          Navigator.of(context).pop();
        },
        child: Icon(Icons.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('제목', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Text(title),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('작성자', style: TextStyle(fontSize: 15.0)),
                Text(writer, style: TextStyle(fontSize: 10.0)),
                Text('작성일자', style: TextStyle(fontSize: 15.0)),
                Text(date, style: TextStyle(fontSize: 10.0)),
              ],
            ),
            SizedBox(height: 8.0),
            Text('내용', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            Text(contents),
            SizedBox(height: 16.0),
            Text('댓글', style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
