// ignore_for_file: camel_case_types, unnecessary_null_comparison, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/compotants/buttons.dart';
import 'package:flash_chat/compotants/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login_Screen extends StatefulWidget {
  static String id = "Login_screen";
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool _spinner = false;
  String? email, password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background1.png'),
          fit: BoxFit.cover,
          opacity: 1,
        )),
        child: ModalProgressHUD(
          inAsyncCall: _spinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Hero(
                    tag: "flash",
                    child: Image.asset(
                      'images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 300,
                    child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: kTextFieldDecoration.copyWith(
                            label: const Text("Password"))),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Button(
                  onClicked: () async {
                    setState(() {
                      _spinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);

                      if (user != null) {
                        Navigator.pushReplacementNamed(context, Chat_Screen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      _spinner = false;
                    });
                  },
                  label: "Log In"),
            ],
          ),
        ),
      ),
    );
  }
}
