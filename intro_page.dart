import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ConfettiController _confettiController = ConfettiController(duration: const Duration(seconds: 2));

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 180,
                height: 180,
              ).animate()
                .scaleXY(begin: 0.8, end: 1.0, duration: 800.ms, curve: Curves.easeOutBack)
                .fade(begin: 0, end: 1, duration: 600.ms),
              const SizedBox(height: 30),
              Text(
                "Conquering Tasks One At A Time",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE94560),
                  letterSpacing: 0.5,
                ),
              ).animate()
                .fade(begin: 0, end: 1, duration: 800.ms, delay: 400.ms)
                .moveY(begin: 20, end: 0, duration: 800.ms, delay: 400.ms, curve: Curves.easeOutQuad),
              const SizedBox(height: 20),
              Text(
                "The planner that works with your brain, not against it",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ).animate()
                .fade(begin: 0, end: 1, duration: 800.ms, delay: 600.ms),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  _confettiController.play();
                  Future.delayed(const Duration(milliseconds: 1500), () {
                    Navigator.pushNamed(context, '/motivation');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94560),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Let's Start Planning!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded, size: 20),
                  ],
                ),
              ).animate()
                .fade(begin: 0, end: 1, duration: 800.ms, delay: 800.ms)
                .scaleXY(begin: 0, end: 1, duration: 600.ms, delay: 800.ms),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 20,
              minBlastForce: 10,
              gravity: 0.1,
              colors: const [
                Color(0xFFE94560),
                Color(0xFF0F3460),
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
