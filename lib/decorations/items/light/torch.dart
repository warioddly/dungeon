
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/utils/constants/universe.dart';


class TorchLight extends Light {


  TorchLight(this.collisionDetection);


  final RadialGradient gradient = const RadialGradient(
    colors: [Colors.yellow, Colors.orange, Colors.red, Colors.transparent],
    stops: [0.0, 0.5, 0.8, 1.0],
  );

  final CollisionDetection collisionDetection;


  @override
  void update(double dt) {

    final origin = character.absolutePosition;
    isOriginCasted = this.origin == origin;
    this.origin = origin;

    timePassed += dt;

    paint.shader = gradient.createShader(Rect.fromCircle(
        center: origin.toOffset(),
        radius: 430 + 10 * (timePassed % 1),
      ));

    paint.color = Colors.white;

    if (!isOriginCasted) {
      collisionDetection.raycastAll(
        origin,
        numberOfRays: config.numberOfRays,
        rays: rays,
        out: results,
        // maxDistance: Universe.rayMaxDistance,
        // sweepAngle: 5 * pi,
      );

      isOriginCasted = true;
    }

  }


  @override
  void render(Canvas canvas) {

    final originOffset = origin.toOffset();

    for (final result in results) {
      if (!result.isActive) continue;

      canvas.drawLine(originOffset, result.intersectionPoint!.toOffset(), paint);

    }
  }


}

