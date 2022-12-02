import 'package:final_app/screen/const/grade_colors.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int grade;
  const MyAppBar({
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(
          text: '득근득근', grade: grade, size: "20.0"),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
                    (route) => false);
          },
          child: Icon(Icons.home),
        ),
        SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: PRIMARY_COLOR[grade],
      elevation: 0,
      iconTheme: IconThemeData(
          color: (grade == 0 ||
              grade == 1 ||
              grade == 2 ||
              grade == 4 ||
              grade == 8)
              ? Colors.black
              : Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
