import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
