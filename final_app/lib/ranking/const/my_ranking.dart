import 'package:flutter/material.dart';

class MyRanking extends StatelessWidget {
  final nickname;
  final weight;
  const MyRanking({
    required this.weight,
    required this.nickname,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('asset/images/ranking/ranking1.png', height: 120.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(nickname, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0),
                Text('3대 총합: ${weight[0] + weight[1] + weight[2]}kg',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Text('데드리프트: ${weight[0]}kg', style: TextStyle(fontSize: 15.0)),
                Text('벤치프레스: ${weight[1]}kg', style: TextStyle(fontSize: 15.0)),
                Text('스쿼트: ${weight[2]}kg', style: TextStyle(fontSize: 15.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
