import 'package:frontend/screens/challenges_page.dart';
import 'package:flutter/material.dart';
import 'screens/intro_page.dart';
import 'screens/motivation_page.dart';
//import 'screens/user_info_page.dart';

import 'screens/user_page.dart';
import 'screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/motivation': (context) => const MotivationScreen(),
        '/userinfo': (context) => const UserInfoScreen(),  // Keep this
        //'/challenges': (context) =>   InterestSelector(),  // Change this route
        '/home': (context) => const HomePage(),
      },
    );
  }
}
