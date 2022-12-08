import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void MyShortToast(context,text) {
  final fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('asset/images/etc/teamIcon.png', width: 30.0),
        SizedBox(width: 8.0),
        Text(text,style: TextStyle(color:Colors.black)),
      ],
    ),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      positionedToastBuilder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: child,
              bottom: 70,
            ),
          ],
        );
      }
  );
}
