import 'package:flutter/material.dart';
import 'package:http_test/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Users(),
    );
  }
}