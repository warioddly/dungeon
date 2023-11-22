

import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/utils/constants/text.dart';


class TextConfig {

  TextConfig._();

  static final TextRenderer renderer = TextConstants.regular.copyWith((style) => style.copyWith(
    color: Colors.lightGreenAccent,
    fontFamily: 'VT323',
    letterSpacing: 3.0,
    fontSize: 16,
  ));


}