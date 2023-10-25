// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MessageBubbles extends StatelessWidget {
  MessageBubbles(this.text, this.sender, this.isMe);
  final String text, sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              sender,
              style: const TextStyle(fontSize: 9, color: Colors.white70),
            ),
          ),
          Material(
            shadowColor: Colors.white70,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
            color: isMe ? const Color.fromARGB(255, 96, 165, 98) : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                text,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
