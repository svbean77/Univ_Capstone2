import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: DrawerHeader(
              child: Text('프로필사진 크게'),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('닉네임'),
                  Text('등급'),
                ],
              ),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('수분섭취'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.coffee),
                      Text('nn컵 / mm컵'),
                      TextButton(
                        child: Text('+1컵'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('3대 챌린지'),
              onTap: () {},
            ),
            elevation: 0,
          ),
          Card(
            child: ListTile(
              title: Text('공지사항'),
              onTap: () {},
            ),
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
