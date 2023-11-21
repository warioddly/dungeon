
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/utils/constants/text.dart';



class AnimatedTextBox extends TextBoxComponent {

  AnimatedTextBox(
    String text, {
      super.align,
      super.size,
      double? timePerChar,
      double? margins,
  }) : super(
    text: text,
    textRenderer: TextConstants.regular.copyWith((style) => style.copyWith(
      color: Colors.lightGreenAccent,
      fontFamily: 'monospace',
      letterSpacing: 2.0,
    )),
    boxConfig: TextBoxConfig(
      maxWidth: 550,
      timePerChar: timePerChar ?? 0.03,
      growingBox: true,
      margins: EdgeInsets.all(margins ?? 25),
    ),
    children: [ RectangleHitbox() ],
  );

  @override
  void render(Canvas canvas) {
    final rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(rect, Paint()..color = Colors.white10);
    super.render(canvas);
  }

}