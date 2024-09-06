import 'package:flutter/material.dart';
import 'package:todoapp/completedTask.dart';
import 'package:todoapp/editTask.dart';
import 'package:todoapp/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage(),debugShowCheckedModeBanner: false,

    );
  }
}
