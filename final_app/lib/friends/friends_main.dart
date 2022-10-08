import 'package:flutter/material.dart';

class FriendsMain extends StatefulWidget {
  const FriendsMain({Key? key}) : super(key: key);

  @override
  State<FriendsMain> createState() => _FriendsMainState();
}

class _FriendsMainState extends State<FriendsMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '친구 페이지',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
