import 'package:flutter/material.dart';

class QnABoard extends StatefulWidget {
  const QnABoard({Key? key}) : super(key: key);

  @override
  State<QnABoard> createState() => _QnABoardState();
}

class _QnABoardState extends State<QnABoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '질의응답 게시판',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
