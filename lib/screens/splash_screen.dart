// ignore_for_file: camel_case_types

import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  static String id = "Splash_screen";
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Welcome_Screen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 57, 14),
      body: Center(
        child: Image.asset(
          'images/logo.png',
        ),
      ),
    );
  }
}
