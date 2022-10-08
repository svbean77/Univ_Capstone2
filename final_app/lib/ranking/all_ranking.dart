import 'package:flutter/material.dart';

class AllRanking extends StatelessWidget {
  const AllRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '모든 사용자의 랭킹',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
