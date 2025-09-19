import 'package:flutter/material.dart';
import 'package:surprised/pages/fifth_page.dart';
import 'package:surprised/pages/first_page.dart';
import 'package:surprised/pages/fourth_page.dart';
import 'package:surprised/pages/second_page.dart';
import 'package:surprised/pages/splash_screen.dart';
import 'package:surprised/pages/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      routes: {
        '/firstpage': (context) => FirstPage(),
        '/secondpage': (context) => SecondPage(),
        '/thirdpage': (context) => ThirdPage(),
        '/fourthpage': (context) => FourthPage(),
        '/fifthpage': (context) => FifthPage(),
        '/splashscreen': (context) => SplashScreen(),
      },
    );
  }
}
