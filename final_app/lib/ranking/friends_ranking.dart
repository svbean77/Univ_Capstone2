import 'package:flutter/material.dart';

class FriendsRanking extends StatelessWidget {
  const FriendsRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '친구의 랭킹',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
