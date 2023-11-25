


import 'package:flutter/material.dart';

Widget textWidget(String text, { TextStyle? style }) {

  return Text(
    text,
    style: style ?? const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'VT323',
    ),
  );
}