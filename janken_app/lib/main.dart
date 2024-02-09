import 'package:flutter/material.dart';

import 'janken_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'じゃんけんアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JankenScreen(title: 'じゃんけんアプリ'),
    );
  }
}
