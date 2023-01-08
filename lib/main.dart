import 'package:flutter/material.dart';
import 'package:urban_match_rohit/screen/home_page.dart';
import 'package:urban_match_rohit/screen/task1_screen.dart';
import 'package:urban_match_rohit/screen/task2_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
