import 'package:final_app/mypage/sign_up.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../screen/const/storage_box.dart';
import '../screen/home_screen.dart';
import 'dart:convert';
import '../screen/const/ip_address.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(loginID: "", grade: 0),
      appBar: MyAppBar(grade: 0),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  '로그인',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: '아이디를 입력해주세요',
                      hintStyle: TextStyle(fontSize: 18.0),
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    controller: _pwController,
                    obscureText: isPasswordVisible ? false : true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      hintText: '비밀번호를 입력해주세요',
                      hintStyle: TextStyle(fontSize: 18.0),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
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
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    login();
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 18.0,
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
                        builder: (BuildContext context) => SignUp(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 18.0,
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

  Future login() async {
    var url = Uri.parse("http://${IP_ADDRESS}/test_login.php");
    /*
    var url = Uri.http(IP_ADDRESS, '/test_login.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{
      'username': _idController.text.toString(),
      'password': _pwController.text.toString(),
    });
    var data = json.decode(json.encode(response.body));

    if (data.toString() == "Success") {
      MyToast('로그인 성공', Colors.white, Colors.black);

      LOGIN_BOX.write('id', _idController.text.toString());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    } else {
      print(data.toString());
      MyToast('아이디 또는 비밀번호가 잘못되었습니다.', Colors.grey, Colors.black);
    }
  }
}
