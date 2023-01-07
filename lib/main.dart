import 'package:flutter/material.dart';
import 'package:urban_match_rohit/view/home_page.dart';
import 'package:urban_match_rohit/view/task1.dart';

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
      home: FirstTask(),
    );
  }
}
