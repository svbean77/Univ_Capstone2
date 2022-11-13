import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final nickname;
  final rating;
  final isActive;

  const FriendCard({
    required this.nickname,
    required this.rating,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(
            color: PRIMARY_COLOR[grade],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('asset/images/ranking/$rating.png'),
                SizedBox(width: 8.0),
                Icon(Icons.circle, color: isActive ? Colors.green : Colors.red, size: 15.0),
                Text(' $nickname', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.person_search),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserInfo(
                            nickname: nickname,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    child: Icon(Icons.cancel_outlined),
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 100.0,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('삭제하시겠습니까?'),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('취소'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          //db에서 글 삭제하는 코드
                                          //정보를 build에서 가져오면 새로고침이 되나?
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('확인'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
