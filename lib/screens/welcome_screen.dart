// ignore_for_file: camel_case_types, avoid_print, depend_on_referenced_packages

import 'package:flash_chat/compotants/buttons.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Welcome_Screen extends StatefulWidget {
  static String id = "welcome_screen";
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation coloranimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    controller.forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    coloranimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coloranimation.value,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background1.png'),
          fit: BoxFit.cover,
          opacity: 1,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: animation,
                  child: Hero(
                    tag: "flash",
                    child: Image.asset(
                      'images/logo.png',
                      height: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Flash Chat",
                        textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        speed: const Duration(
                          milliseconds: 100,
                        ),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Button(
                onClicked: () {
                  Navigator.pushNamed(context, Login_Screen.id);
                },
                label: "Log In"),
            Button(
                onClicked: () {
                  Navigator.pushNamed(context, Register_Screen.id);
                },
                label: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
