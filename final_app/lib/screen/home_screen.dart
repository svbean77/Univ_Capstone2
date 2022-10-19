//https://github.com/pedromassango/bottom_navy_bar

import 'package:final_app/community/community_main.dart';
import 'package:final_app/exercise/exercise_main.dart';
import 'package:final_app/friends/friends_main.dart';
import 'package:final_app/ranking/ranking_main.dart';
import 'package:final_app/screen/app_bar.dart';
import 'package:final_app/screen/drawer.dart';
import 'package:flutter/material.dart';
import '../report/exercise_report.dart';
import 'bottom_navy_bar.dart';


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
    final int grade = 0;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: grade),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            ExerciseMain(),
            ExerciseReport(),
            RankingMain(),
            FriendsMain(),
            CommunityMain(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.sports),
            title: Text('운동하기'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.analytics_outlined),
            title: Text('운동기록'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            title: Text('랭킹'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('친구'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.assignment_outlined),
            title: Text('커뮤니티'),
          ),
        ],
      ),
    );
  }
}
