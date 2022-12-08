import 'package:flutter/material.dart';
import 'package:technews_f/pages/home.dart';
import 'package:technews_f/utils/colors.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TechNews",
      theme: ThemeData(
        primaryColor: AppColors.primary,
        brightness: Brightness.dark
      ),
      home: Home(),
    );
  }
}
