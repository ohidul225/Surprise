import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  late CameraController _controller;
  // ignore: unused_field
  late Future<void> _initializeControllerFuture;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    _controller = CameraController(frontCamera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    });
  }

  void _openFrontCamera() {
    if (_isCameraInitialized) {
      // Show a dialog or full-screen camera preview
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: CameraPreview(_controller),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 176, 145),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main text content
              Container(
                padding: const EdgeInsets.all(18),
                child: Text(
                  '"When I first met you, I didn\'t realize how much they would come to mean to me. '
                  'At first, my heart felt something different, but my mind was unsure. '
                  'Deep down, I knew I couldn\'t keep it hidden forever — I had to express what I truly feel.\n\n'
                  'Since then, my love has only grown. And still, the words "I love you" never feel enough. '
                  'They\'re too small for something so deep. With this person, I\'ve found happiness, peace, '
                  'and a reason to smile every day.\n\n',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              const SizedBox(height: 20),

              // Camera button
              GestureDetector(
                onTap: _openFrontCamera,
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 180, 171, 151),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Click to See....",
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

              const SizedBox(height: 20),

              const Icon(Icons.arrow_upward, size: 30),

              // Bottom text
              Text(
                "Do you want to know who this person is? 💖",
                style: GoogleFonts.lora(
                  fontSize: 14,
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
