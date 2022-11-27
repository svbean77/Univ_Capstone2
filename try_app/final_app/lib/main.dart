import 'package:final_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await Future.delayed(Duration(seconds: 2));
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
