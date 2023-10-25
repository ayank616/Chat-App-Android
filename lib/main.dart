import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flash_chat/screens/splash_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialRoute: Splash_Screen.id,
      // initialRoute: Welcome_Screen.id,
      routes: {
        Splash_Screen.id: (context) => const Splash_Screen(),
        Welcome_Screen.id: (context) => const Welcome_Screen(),
        Login_Screen.id: (context) => const Login_Screen(),
        Register_Screen.id: (context) => const Register_Screen(),
        Chat_Screen.id: (context) => const Chat_Screen()
      },
    );
  }
}
