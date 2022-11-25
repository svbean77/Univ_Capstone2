import 'package:flutter/material.dart';
import 'package:test_insert_db/screen/test_delete.dart';
import 'package:test_insert_db/screen/test_insert.dart';

void main() {
  runApp(
    MaterialApp(
      home: TestDelete(col1: 'test', col2: 77),
    ),
  );
}
