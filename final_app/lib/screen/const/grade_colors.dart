import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const List<Color> PRIMARY_COLOR = [
  Color(0xFFFFFFFF),
  Color(0xFFCCCCCC),
  Color(0xFFFFFF05),
  Color(0xFFFF6600),
  Color(0xFF33FF33),
  Color(0xFF3333FF),
  Color(0xFF9966CC),
  Color(0xFF000000),
  Color(0xFFE0FF00),
];

class MyText extends StatelessWidget {
  final text;
  final size;
  final grade;
  const MyText({
    required this.text,
    required this.grade,
    this.size = "18",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: double.parse(size),
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white));
  }
}

class MyContainer extends StatelessWidget {
  final height;
  final width;
  final grade;
  final child;
  const MyContainer({
    required this.height,
    required this.width,
    required this.grade,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: height,
      width: width,
      child: child,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: PRIMARY_COLOR[grade],
        ),
      ),
    );
  }
}

void MyToast(String text, Color bkColor, Color txtColor) {
  Fluttertoast.showToast(
    backgroundColor: bkColor,
    textColor: txtColor,
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
  );
}
