
import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';


class Light extends PositionComponent {


  Light({
    this.gradient,
    this.radius,
    int? priority
  }): super(priority: priority);


  RadialGradient? gradient;
  double? radius;


  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    gradient ??= RadialGradient(
      colors: [
        Colors.orange.withOpacity(0.5),
        Colors.black.withOpacity(0.2),
      ],
      stops: const [0.0, 2.0],
    );

    add(CircleComponent(
      anchor: Anchor.center,
      radius: radius,
      paint: Paint()..color = Colors.transparent,
      children: [CircleHitbox()]
    ));

  }




}