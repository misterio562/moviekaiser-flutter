import 'package:flutter/material.dart';

BoxDecoration backgroundColorWidget() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.cyan.shade50,
        Colors.cyan.shade300,
      ],
    ),
  );
}
