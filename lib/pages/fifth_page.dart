import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 150, 143),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Decorative birthday icon
              Icon(Icons.cake_rounded, size: 60, color: Colors.white),
              const SizedBox(height: 20),

              // Birthday title
              Text(
                "Happy Birthday!",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Main message in a decorative container
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  "Happy Birthday, my sweet Panda! 🎉💖\n\n"
                  "You are the most amazing part of my life, and today is all about celebrating YOU. "
                  "I hope your day is as bright, beautiful, and full of love as you make my every day. "
                  "Thank you for being you — my happiness, my joy, and my everything. "
                  "I love you more than words can ever express. 💕\n\n"
                  "Always yours,\n"
                  "Dakat 🐼",
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 100, 60, 50),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              // Bottom text
              Text(
                "It’s your day, Panda! 💕 You mean the world to me.",
                style: GoogleFonts.lora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
