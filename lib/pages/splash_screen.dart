import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:surprised/pages/first_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        width: double.infinity, // Full width
        height: double.infinity, // Full height
        child: Image.asset(
          "assets/splash_animation.gif",
          fit: BoxFit.cover, // Changed from BoxFit.contain to BoxFit.cover
        ),
      ),
      nextScreen: const FirstPage(),
      duration: 4000, // 3 seconds
      backgroundColor: Colors.white,
      splashIconSize: double.infinity, // Make splash area full screen
    );
  }
}
