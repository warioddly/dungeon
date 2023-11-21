
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/utils/configs/light.dart';


class RadialLight extends Light {

  RadialLight({
    required CollisionDetection collisionDetection,
    LightConfig? config,
    PositionComponent? component,
  }) : super() {

    this.config = config ??= LightConfig();
    target = component ?? PositionComponent();
    this.collisionDetection = collisionDetection;

    if (config.gradient == null) {
      this.config = config.copyWith(
        gradient: RadialGradient(
          colors: [config.color,  Colors.transparent],
          stops: const [0.0, .8],
        )
      );

    }

  }




  @override
  void update(double dt) {

    final origin = super.target.absolutePosition;
    isOriginCasted = this.origin == origin;
    this.origin = origin;

    if (config.gradient != null) {

      config.pulseSpeed += dt;

      double pulsatingRadius = config.radius + (config.maxPulseRadius - config.radius) * (0.5 * (1 + sin(config.pulseSpeed * 5)));

      paint.shader = config.gradient!.createShader(Rect.fromCircle(
          center: origin.toOffset(),
          radius: pulsatingRadius,
        ));

    }
    else {
      paint
        ..color = config.color
        ..shader = config.gradient!.createShader(Rect.fromCircle(center: origin.toOffset(), radius: config.radius));
    }

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


