import 'dart:convert';

import 'package:final_app/mypage/my_page.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../screen/const/grade_colors.dart';
import '../screen/const/ip_address.dart';

class EditMyInfo extends StatefulWidget {
  String username;
  String password;
  String nickname;
  int userage;
  List<bool> sex;
  final grade;
  EditMyInfo({
    required this.grade,
    required this.nickname,
    required this.username,
    required this.password,
    required this.sex,
    required this.userage,
    Key? key,
  }) : super(key: key);

  @override
  State<EditMyInfo> createState() => _EditMyInfoState();
}

class _EditMyInfoState extends State<EditMyInfo> {
  final GlobalKey<FormState> pwFormKey = GlobalKey();
  final GlobalKey<FormState> nicknameFormKey = GlobalKey();
  final GlobalKey<FormState> userageFormKey = GlobalKey();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final origin = widget.nickname;

    return Scaffold(
      drawer: MyDrawer(loginID: widget.nickname, grade: widget.grade),
      appBar: MyAppBar(grade: widget.grade),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '내 정보 수정',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('아이디', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Text(widget.username),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('비밀번호', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.2)
                                : PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: Form(
                          key: pwFormKey,
                          child: TextFormField(
                            obscureText: isPasswordVisible ? false : true,
                            initialValue: widget.password,
                            onChanged: (String? val) {
                              widget.password = val!;
                            },
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: widget.grade == 0
                                        ? Colors.grey
                                        : PRIMARY_COLOR[widget.grade],
                                  ),
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('닉네임', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.2)
                                : PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: Form(
                          key: nicknameFormKey,
                          child: TextFormField(
                            initialValue: widget.nickname,
                            onChanged: (String? val) {
                              widget.nickname = val!;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('나이', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.grade == 0
                                ? Colors.grey.withOpacity(0.2)
                                : PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: Form(
                          key: userageFormKey,
                          child: TextFormField(
                            initialValue: widget.userage.toString(),
                            onChanged: (String? val) {
                              try {
                                widget.userage = int.parse(val!);
                              } catch (e) {
                                widget.userage = -1;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      child: Text('성별', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ToggleButtons(
                        children: [
                          Text('남자'),
                          Text('여자'),
                        ],
                        isSelected: widget.sex,
                        selectedColor: Colors.black,
                        fillColor: (widget.grade == 0 || widget.grade == 7)
                            ? Colors.black.withOpacity(0.1)
                            : PRIMARY_COLOR[widget.grade].withOpacity(0.3),
                        onPressed: (value) {
                          setState(() {
                            if (value == 0) {
                              widget.sex![0] = true;
                              widget.sex![1] = false;
                            } else {
                              widget.sex![0] = false;
                              widget.sex![1] = true;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () async {
                    print(widget.userage);
                    print(origin);
                    if (widget.password.length != 0 &&
                        widget.nickname.length != 0 &&
                        widget.userage != -1) {
                      var url = Uri.parse(
                          "http://${IP_ADDRESS}/test_change_user.php");
                      /*
                      var url = Uri.http(
                          IP_ADDRESS, '/test_change_user.php', {'q': '{http}'});

                       */
                      var response =
                          await http.post(url, body: <String, String>{
                        "username": widget.username.toString(),
                        "password": widget.password.toString(),
                        "nickname": widget.nickname.toString(),
                        "userage": widget.userage.toString(),
                        "sex": widget.sex[0] == true ? '남자' : '여자',
                        "origin": origin.toString(),
                      });
                      var jsondata = json.decode(json.encode(response.body));
                      if (jsondata.toString() == "Success") {
                        MyToast(
                            '정보를 수정했습니다.',
                            PRIMARY_COLOR[widget.grade],
                            (widget.grade == 0 ||
                                    widget.grade == 1 ||
                                    widget.grade == 2 ||
                                    widget.grade == 4 ||
                                    widget.grade == 8)
                                ? Colors.black
                                : Colors.white);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyPage(
                                loginID: widget.nickname, grade: widget.grade),
                          ),
                        );
                      }
                    } else {
                      MyToast(
                          '모든 칸을 채워주세요.',
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
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PRIMARY_COLOR[widget.grade],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '저장',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
