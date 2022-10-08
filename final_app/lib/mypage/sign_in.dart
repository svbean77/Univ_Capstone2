import 'package:final_app/mypage/three_challenge.dart';
import 'package:flutter/material.dart';

import '../screen/grade_colors.dart';
import '../screen/home_screen.dart';
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
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode?.dispose();
    super.dispose();
  }

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
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
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
                height: 50.0,
              ),
              _LoginBar(
                grade: widget.grade,
                controller: _idController,
                myFocusNode: myFocusNode,
              ),
              SizedBox(
                height: 20.0,
              ),
              _PasswordBar(
                controller: _pwController,
                grade: widget.grade,
                myFocusNode: myFocusNode,
              ),
              SizedBox(
                height: 50.0,
              ),
              SignInBtn(
                grade: widget.grade,
              ),
              SizedBox(
                height: 20.0,
              ),
              _SignUpBtn(
                grade: widget.grade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginBar extends StatelessWidget {
  final int grade;
  final TextEditingController controller;
  final FocusNode? myFocusNode;

  const _LoginBar({
    required this.grade,
    required this.controller,
    required this.myFocusNode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: PRIMARY_COLOR[grade],
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          labelText: '아이디',
          labelStyle: TextStyle(
            color: PRIMARY_COLOR[grade],
          ),
          icon: Icon(
            Icons.person,
            color: PRIMARY_COLOR[grade],
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => myFocusNode?.requestFocus(),
      ),
    );
  }
}

class _PasswordBar extends StatelessWidget {
  final int grade;
  final TextEditingController controller;
  final FocusNode? myFocusNode;

  const _PasswordBar({
    required this.controller,
    required this.grade,
    required this.myFocusNode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PRIMARY_COLOR[grade],
        ),
      ),
      child: TextFormField(
        focusNode: myFocusNode,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          labelText: '비밀번호',
          labelStyle: TextStyle(color: PRIMARY_COLOR[grade]),
          icon: Icon(
            Icons.lock,
            color: PRIMARY_COLOR[grade],
          ),
          border: InputBorder.none,
        ),
        obscureText: true,
      ),
    );
  }
}

class SignInBtn extends StatelessWidget {
  final int grade;

  const SignInBtn({
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.maxFinite,
      height: 50.0,
      onPressed: () {},
      color: PRIMARY_COLOR[grade],
      child: Text(
        '로그인',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SignUpBtn extends StatelessWidget {
  final int grade;

  const _SignUpBtn({
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              '회원가입',
              style: TextStyle(
                color: PRIMARY_COLOR[grade],
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
