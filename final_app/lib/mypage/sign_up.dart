import 'dart:convert';

import 'package:final_app/mypage/sign_in.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../screen/const/ip_address.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _userageController = TextEditingController();

  bool isPasswordVisible = false;
  List<bool> sex = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(loginID: ""),
      appBar: MyAppBar(grade: 0),
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
                  '회원가입',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28),
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
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: TextField(
                          controller: _idController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
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
                      child: Text('비밀번호', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: TextField(
                          controller: _pwController,
                          //이거 그냥 true로 하면 비밀번호 안 보이는 것!!!!
                          obscureText: isPasswordVisible ? false : true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
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
                                color: Colors.grey,
                              ),
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
                      child: Text('닉네임', style: TextStyle(fontSize: 16.0)),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: TextField(
                          controller: _nicknameController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: TextField(
                          controller: _userageController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          keyboardType: TextInputType.number,
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
                        isSelected: sex,
                        selectedColor: Colors.black,
                        fillColor: Colors.black.withOpacity(0.2),
                        onPressed: (value) {
                          setState(() {
                            if (value == 0) {
                              sex[0] = true;
                              sex[1] = false;
                            } else {
                              sex[0] = false;
                              sex[1] = true;
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
                  onTap: () {
                    register();
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignIn(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      '로그인 하러 가기',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future register() async {
    var url = Uri.http(IP_ADDRESS, '/register.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "username": _idController.text.toString(),
      "password": _pwController.text.toString(),
      "nickname": _nicknameController.text.toString(),
      if (sex[0] == true) "sex": 'male' else "sex": 'female',
      "userage": _userageController.text.toString(),
    });
    var data = json.decode(json.encode(response.body));

    if (data == "Error") {
      Fluttertoast.showToast(
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        msg: '아이디 또는 닉네임이 중복됩니다.',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        msg: '회원가입이 완료되었습니다.',
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
      );
    }
  }
}
