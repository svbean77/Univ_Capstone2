import 'package:final_app/mypage/sign_in.dart';
import 'package:flutter/material.dart';

class AfterLogin extends StatelessWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로그인 후 사용 가능합니다.', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignIn(),
                  ),
                );
              },
              child: Text('로그인 하러 가기', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
