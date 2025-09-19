import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 182, 226),
      body: Center(
        // Wrap Column with Center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "In the book of life, you are my favorite chapter💌",
                      textStyle: GoogleFonts.dancingScript(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 60),
                    ),
                  ],
                  totalRepeatCount: 1, // Play only once
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/secondpage');
              },
              child: Container(
                margin: EdgeInsets.only(top: 40),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 128, 70, 138),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next page....",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.favorite, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 40.0), // Margin around the container
              child: Text(
                "Go on… your surprise is a few step away 🌸",
                style: GoogleFonts.lora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
