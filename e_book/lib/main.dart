import 'package:e_book/pages/homePage/home_page.dart';
import 'package:e_book/pages/searchpage/searchpage.dart';
import 'package:e_book/pages/welcomePage/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'E-Book',
      home: HomePage(),
    );
  }
}



