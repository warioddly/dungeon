
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/characters/dino.dart';
import 'package:warioddly/decorates/items/flashlight.dart';
import 'package:warioddly/decorates/texts/animated_text_box.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';
import 'package:warioddly/utils/constants/universe.dart';


class MyWorld extends World with HasGameRef<AdventureGame>, HasCollisionDetection {

  MyWorld();

  Vector2 origin = Vector2.zero();
  Paint paint = Paint();
  bool isOriginCasted = false;
  Gradient gradient = RadialGradient(
    colors: [
      Colors.black,
      Colors.orange.withOpacity(0.4),
      Colors.orange.withOpacity(0.5),
      Colors.black,
    ],
    stops: const [0.0, 0.1, 0.3, 4.0],
  );
  double timePassed = 0.0;
  final List<Ray2> rays = [];
  final List<RaycastResult<ShapeHitbox>> results = [];


  @override
  Future<void> onLoad() async {
    super.onLoad();

    debugMode = false;

    final paint = BasicPalette.gray.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    addAll([

      AnimatedTextBox(
          '''"Hi there! Welcome to my Portfolio.

I'm IMØ, and I'm passionate about web/mobile development. Here, you'll find a collection of my work and projects that showcase my skills and creativity.

Feel free to explore and get to know more about my journey. If you have any questions or if there's something specific you're looking for, don't hesitate to reach out.
          
Thanks for stopping by, and I hope you enjoy your visit!"'''
      )
        ..anchor = Anchor.center
        ..y = -220,

      CircleComponent(
        position: Vector2(100, 100),
        radius: 50,
        paint: paint,
        children: [CircleHitbox()],
      ),
      CircleComponent(
          position: Vector2(150, 500),
          radius: 50,
          paint: paint,
          children: [
            CircleHitbox()
              ..isSolid = true
              ..collisionType = CollisionType.active
          ]
      ),
      RectangleComponent(
        priority: 2,
        position: Vector2.all(300),
        size: Vector2.all(100),
        paint: paint,
        children: [RectangleHitbox()],
      ),
      RectangleComponent(
        position: Vector2.all(500),
        size: Vector2(100, 200),
        paint: paint,
        children: [RectangleHitbox()],
      ),
      RectangleComponent(
        position: Vector2(550, 200),
        size: Vector2(200, 150),
        paint: paint,
        children: [RectangleHitbox()],
      ),

    ]);

  }



  @override
  void update(double dt) {
    super.update(dt);

    final origin = gameRef.player.absolutePosition;
    isOriginCasted = origin == this.origin;
    this.origin = origin;

    timePassed += dt;

    paint.shader = gradient.createShader(Rect.fromCircle(
      center: origin.toOffset(),
      radius: 300 + sin(timePassed * LightConfig().pulseSpeed) * 15,
    ));

    if (!isOriginCasted) {

      // double angle = player.angle;
      // double angleDelta = 3.14159 / 3;

      collisionDetection.raycastAll(
        origin,
        numberOfRays: Universe.numberOfRays,
        rays: rays,
        out: results,
        maxDistance: Universe.rayMaxDistance,
        // startAngle: angle + angleDelta,
        // sweepAngle: -angleDelta,
      );

      isOriginCasted = true;
    }

  }


  @override
  void render(Canvas canvas) {
    super.render(canvas);
    renderResult(canvas, origin, results, paint);
  }

  void renderResult(Canvas canvas, Vector2 origin, List<RaycastResult<ShapeHitbox>> results, Paint paint) {

    final originOffset = origin.toOffset();

    for (final result in results) {

      if (!result.isActive) continue;

      canvas.drawLine(originOffset, result.intersectionPoint!.toOffset(), paint);

    }

  }



}
