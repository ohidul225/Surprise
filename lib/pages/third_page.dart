import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _showMusicPlayer = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  // Sample romantic song URL
  final String _songUrl =
      "https://firebasestorage.googleapis.com/v0/b/july2024-5bf72.appspot.com/o/song.mp3?alt=media&token=97c3f738-edc2-4fc7-af26-92e05acb50e6";

  @override
  void initState() {
    super.initState();

    // Setup audio player listeners
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    // Auto-play the song after a short delay when page loads
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showMusicPlayer = true;
      });
      _playMusic();
    });
  }

  Future<void> _playMusic() async {
    try {
      await _audioPlayer.play(UrlSource(_songUrl));
    } catch (e) {
      print("Error playing music: $e");
    }
  }

  Future<void> _pauseMusic() async {
    await _audioPlayer.pause();
  }

  Future<void> _resumeMusic() async {
    await _audioPlayer.resume();
  }

  Future<void> _stopMusic() async {
    await _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 180, 109, 161),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "These words only mean something because of you🌺",
                          textStyle: GoogleFonts.dancingScript(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                ),

                // Music player that fades in
                AnimatedOpacity(
                  opacity: _showMusicPlayer ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        // Song title and artist
                        Text(
                          "Something Dedicated To You",
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),

                        const SizedBox(height: 15),

                        // Progress bar
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 10,
                            ),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white.withOpacity(0.3),
                            thumbColor: Colors.pinkAccent,
                          ),
                          child: Slider(
                            min: 0,
                            max: _duration.inSeconds.toDouble(),
                            value: _position.inSeconds.toDouble(),
                            onChanged: (value) async {
                              await _audioPlayer.seek(
                                Duration(seconds: value.toInt()),
                              );
                            },
                          ),
                        ),

                        // Time indicators and play button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatTime(_position),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),

                            IconButton(
                              icon: Icon(
                                _isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                if (_isPlaying) {
                                  _pauseMusic();
                                } else {
                                  _resumeMusic();
                                }
                              },
                            ),

                            Text(
                              _formatTime(_duration),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    _stopMusic();
                    Navigator.pushNamed(context, '/fourthpage');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
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
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Almost there… something beautiful is waiting 🎶",
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

          // Music note animation in the background
          if (_showMusicPlayer)
            Positioned(
              top: 50,
              right: 20,
              child: Icon(
                Icons.music_note,
                color: Colors.white.withOpacity(0.5),
                size: 30,
              ),
            ),
        ],
      ),
    );
  }

  // Helper function to format time
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
