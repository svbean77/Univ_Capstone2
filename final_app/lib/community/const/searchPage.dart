import 'dart:convert';

import 'package:final_app/community/const/contents.dart';
import 'package:final_app/community/const/contents_list.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class SearchPage extends StatefulWidget {
  /*
  boardLst 대신 class 데이터로 받기
   */
  final loginID;
  final data;
  final searchfor;
  final directory;
  final grade;
  final board;
  const SearchPage({
    required this.searchfor,
    required this.data,
    required this.directory,
    required this.grade,
    required this.loginID,
    required this.board,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.searchfor} 검색 결과',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                child: widget.data.length == 0
                    ? Container(
                        child: Center(
                          child: Text('게시글이 없습니다.'),
                        ),
                      )
                    : ListView(
                        children: [
                          for (int i = 0; i < widget.data.length; i++)
                            GestureDetector(
                              child: ContentsList(
                                  data: widget.data[i], grade: widget.grade),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Contents(
                                      loginID: widget.loginID,
                                      board: widget.board,
                                      directory: widget.directory,
                                      data: widget.data[i],
                                      grade: widget.grade,
                                    ),
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
