import 'package:appbar/screen/color.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int color;
  const MyAppBar({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('득근득근'),
//backgroundColor: Colors.green,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.home),
        ),
        SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: PRIMARY_COLOR[color],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
