import 'package:flutter/material.dart';
import 'package:myappdemo/MyHomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '基本组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '基本组件'),
    );
  }
}
