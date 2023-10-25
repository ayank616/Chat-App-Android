// ignore_for_file: camel_case_types, use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'package:flash_chat/compotants/buttons.dart';
import 'package:flash_chat/compotants/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register_Screen extends StatefulWidget {
  static String id = "Register_screen";
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final _auth = FirebaseAuth.instance;
  String? email, password;
  bool _spinner = false;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
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
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email!, password: password!);
                      if (newUser != null) {
                        Navigator.pushReplacementNamed(context, Chat_Screen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      _spinner = false;
                    });
                  },
                  label: "Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}
