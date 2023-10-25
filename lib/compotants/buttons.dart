// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.onClicked, required this.label});
  final VoidCallback onClicked;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 35),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 10, 57, 14),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
