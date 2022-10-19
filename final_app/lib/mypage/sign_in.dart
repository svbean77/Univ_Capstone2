import 'package:final_app/mypage/sign_up.dart';
import 'package:final_app/mypage/three_challenge.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../screen/grade_colors.dart';
import '../screen/home_screen.dart';
import 'dart:convert';
import '../screen/ip_address.dart';
import 'my_page.dart';
import 'notice.dart';

class SignIn extends StatefulWidget {
  final int grade;

  const SignIn({
    this.grade = 0,
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
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignIn(),
                  ),
                );
              },
              child: DrawerHeader(
                child: Text('프로필사진 크게'),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('닉네임'),
                    Text('등급'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('수분섭취'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.coffee),
                        Text('nn컵 / mm컵'),
                        TextButton(
                          child: Text('+1컵'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3대 챌린지'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ThreeChallenge(),
                    ),
                  );
                },
              ),
              elevation: 0,
            ),
            Card(
              child: ListTile(
                title: Text('공지사항'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Notice(),
                    ),
                  );
                },
              ),
              elevation: 0,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('득근득근'),
//backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
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
                  style: TextStyle(
                    fontSize: 28,
                    color: PRIMARY_COLOR[widget.grade],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PRIMARY_COLOR[widget.grade],
                    ),
                  ),
                  child: TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: '아이디를 입력해주세요',
                      hintStyle: TextStyle(
                        color: PRIMARY_COLOR[widget.grade],
                      ),
                      icon: Icon(
                        Icons.person,
                        color: PRIMARY_COLOR[widget.grade],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PRIMARY_COLOR[widget.grade],
                    ),
                  ),
                  child: TextField(
                    controller: _pwController,
                    //이거 그냥 true로 하면 비밀번호 안 보이는 것!!!!
                    obscureText: isPasswordVisible ? false : true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        hintText: '비밀번호를 입력해주세요',
                        hintStyle: TextStyle(
                          color: PRIMARY_COLOR[widget.grade],
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: PRIMARY_COLOR[widget.grade],
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
                            color: PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        border: InputBorder.none),
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
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR[widget.grade],
                    ),
                    child: Center(
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
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
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PRIMARY_COLOR[widget.grade],
                      ),
                    ),
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: PRIMARY_COLOR[widget.grade],
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
    var url = Uri.http(IP_ADDRESS, '/login.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      'username': _idController.text.toString(),
      'password': _pwController.text.toString(),
    });
    var data = json.decode(json.encode(response.body));
    if (data.toString() == "Success") {
      Fluttertoast.showToast(
        msg: '로그인 성공',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      print(data.toString());
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: '비밀번호 또는 아이디가 잘못되었습니다.',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}

/*

 */
