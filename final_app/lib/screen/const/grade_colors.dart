import 'package:flutter/material.dart';

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
  final grade ;
  const MyText({
    required this.text,
    required this.grade,
    this.size = "15",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
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
