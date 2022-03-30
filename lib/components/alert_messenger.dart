import 'package:flutter/material.dart';

class AlertMessenger {
  static final alertMessenger = AlertMessenger._();

  AlertMessenger._();

  messenger(context, message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: Colors.greenAccent,
    ));
  }
}