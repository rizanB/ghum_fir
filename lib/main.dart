import 'package:flutter/material.dart';
import 'package:ghum_fir/screens/home.dart';
//import 'package:ghum_fir/screens/stackPractice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ghum fir',
      home: Home(),
    );
  }
}
