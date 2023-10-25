// ignore_for_file: camel_case_types, avoid_print, await_only_futures, depend_on_referenced_packages, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flash_chat/compotants/constants.dart';
import 'package:flash_chat/compotants/message_bubbles.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class Chat_Screen extends StatefulWidget {
  static String id = "Chat_screen";
  const Chat_Screen({super.key});

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  final textEditingController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messages;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 57, 14),
        automaticallyImplyLeading: false,
        title: const Center(child: Text("⚡ Chat")),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.popUntil(context, (route) {
                  return route.settings.name == Welcome_Screen.id;
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
              color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBilder(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (value) {
                          messages = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        textEditingController.clear();
                        _firestore.collection('messages').add({
                          "sender": loggedInUser?.email ?? 'Unknown',
                          "text": messages,
                          "timestamp": FieldValue.serverTimestamp(),
                        });
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamBilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green.shade900,
            ),
          );
        }

        final messages = snapshot.data?.docs;
        List<MessageBubbles> messageWidgets = [];

        for (var message in messages!) {
          final text = message.data()['text'];
          final sender = message.data()['sender'];
          final currentUser = loggedInUser?.email;
          if (text != null && sender != null) {
            final messageWidget =
                MessageBubbles(text!, sender!, currentUser == sender);
            messageWidgets.add(messageWidget);
          }
        }
        return Expanded(
          child: ListView(reverse: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: messageWidgets,
            ),
          ]),
        );
      },
    );
  }
}
