import 'package:flutter/material.dart';
import 'package:test_insert_db/screen/test_delete.dart';
import 'package:test_insert_db/screen/test_insert.dart';
import 'package:test_insert_db/screen/test_update.dart';

void main() {
  runApp(
    MaterialApp(
      home: TestUpdate(col1: 'aaa', col2: 77),
    ),
  );
}
