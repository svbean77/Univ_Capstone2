import 'package:final_app/community/const/community_main.dart';
import 'package:final_app/exercise/const/exercise_main.dart';
import 'package:final_app/friends/friends_main.dart';
import 'package:final_app/ranking/const/ranking_main.dart';
import 'package:final_app/record/const/record_main.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import 'const/bottom_navy_bar.dart';

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

  int grade = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: grade),
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            ExerciseMain(grade: grade),
            RecordMain(grade: grade),
            RankingMain(grade: grade),
            FriendsMain(),
            CommunityMain(grade: grade),
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
            icon: Icon(Icons.sports, color: Colors.black.withOpacity(0.3)),
            title: Text('운동하기', style: TextStyle(color: Colors.black.withOpacity(0.3))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.analytics_outlined, color: Colors.black.withOpacity(0.3)),
            title: Text('운동기록', style: TextStyle(color: Colors.black.withOpacity(0.3))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.bar_chart_rounded, color: Colors.black.withOpacity(0.3)),
            title: Text('랭킹', style: TextStyle(color: Colors.black.withOpacity(0.3))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people, color: Colors.black.withOpacity(0.3)),
            title: Text('친구', style: TextStyle(color: Colors.black.withOpacity(0.3))),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.assignment_outlined, color: Colors.black.withOpacity(0.3)),
            title: Text('커뮤니티', style: TextStyle(color: Colors.black.withOpacity(0.3))),
          ),
        ],
      ),
    );
  }
}
