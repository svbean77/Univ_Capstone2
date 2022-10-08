import 'package:flutter/material.dart';

class FreeBoard extends StatefulWidget {
  const FreeBoard({Key? key}) : super(key: key);

  @override
  State<FreeBoard> createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '자유게시판',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
