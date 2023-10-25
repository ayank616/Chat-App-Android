import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  label: Text('Email'),
  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(color: Colors.green),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(color: Colors.green, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(color: Colors.green, width: 2),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Colors.white54),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.white12, width: 0.4),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
