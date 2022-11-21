import 'package:final_app/exercise/const/exercise_main.dart';
import 'package:final_app/friends/friends_main.dart';
import 'package:final_app/ranking/const/ranking_main.dart';
import 'package:final_app/record/const/record_main.dart';
import 'package:final_app/screen/const/after_login.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import 'const/bottom_navy_bar.dart';
import 'const/storage_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String loginID = '';
    int grade = 0;
    if (LOGIN_BOX.read('id') != null) {
      loginID = LOGIN_BOX.read('id');
      grade = 5;
    }

    return Scaffold(
      drawer: MyDrawer(loginID: loginID),
      appBar: MyAppBar(grade: grade),
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            ExerciseMain(grade: grade, loginID: loginID),
            if (loginID == '')
              AfterLogin()
            else
              RecordMain(grade: grade, loginID: loginID),
            if (loginID == '')
              AfterLogin()
            else
              RankingMain(grade: grade, loginID: loginID),
            if (loginID == '') AfterLogin() else FriendsMain(loginID: loginID),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        grade: grade,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.fitness_center, color: Colors.black.withOpacity(0.5)),
            title: Text('운동하기',
                style: TextStyle(color: Colors.black.withOpacity(0.5))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_month,
                color: Colors.black.withOpacity(0.5)),
            title: Text('운동기록',
                style: TextStyle(color: Colors.black.withOpacity(0.5))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.emoji_events,
                color: Colors.black.withOpacity(0.5)),
            title: Text('랭킹',
                style: TextStyle(color: Colors.black.withOpacity(0.5))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people, color: Colors.black.withOpacity(0.5)),
            title: Text('친구',
                style: TextStyle(color: Colors.black.withOpacity(0.5))),
          ),
        ],
      ),
    );
  }
}
