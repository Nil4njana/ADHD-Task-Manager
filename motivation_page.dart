import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({super.key});

  @override
  _MotivationScreenState createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  final List<String> _motivationalPhrases = [
    "You're already ahead by just opening the app! 🚀",
    "Small steps lead to big victories! 🏆",
    "ADHD superpower activated! ⚡",
    "Focus coming your way... loading... 🧠",
    "You've got this! Today is your day! 💪"
  ];
  
  late String _currentPhrase;
  int _progress = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Choose a random motivational phrase
    _currentPhrase = _motivationalPhrases[DateTime.now().millisecond % _motivationalPhrases.length];
    
    // Setup progress timer
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        if (_progress < 100) {
          _progress++;
        } else {
          _timer.cancel();
          Navigator.pushNamed(context, '/userinfo');
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F3FF), // Light, calming background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Motivational Text with animation
              Text(
                _currentPhrase,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E60CE), // Vibrant but not too bright
                  height: 1.3,
                ),
              ).animate()
                .fade(begin: 0, end: 1, duration: 800.ms)
                .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0), duration: 800.ms, curve: Curves.easeOutBack),
              
              const SizedBox(height: 40),
              
              // Lottie Animation
              Lottie.asset(
                'assets/animations/loading_ele.json', 
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              
              const SizedBox(height: 40),
              
              // Custom Progress Bar
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: MediaQuery.of(context).size.width * (_progress / 100) * 0.8, // 80% of screen width for the bar
                      height: 10,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF5E60CE), Color(0xFF6930C3)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Progress Text
              Text(
                "Setting up your perfect planner...",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
