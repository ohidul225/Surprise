import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 103, 182),
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
                      "Every little thing reminds me of you. Just like your smile, it stays with me everywhere I go💕",
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
                Navigator.pushNamed(context, '/thirdpage');
              },
              child: Container(
                margin: EdgeInsets.only(top: 40),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 189, 159, 195),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next page....",
                      style: TextStyle(
                        color: Colors.black,
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
                "Almost there… something beautiful is waiting 🌸",
                style: GoogleFonts.lora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
