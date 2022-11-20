//https://devocean.sk.com/blog/techBoardDetail.do?ID=164062
import 'package:flutter/material.dart';
import 'package:splash_screen/screen/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await Future.delayed(Duration(seconds: 2));
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

/*
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

// whenever your initialization is completed, remove the splash screen:
    FlutterNativeSplash.remove();

 */
