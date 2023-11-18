import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warioddly/components/player.dart';

import 'components/universe.dart';


class DinoGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {


  DinoGame({ required this.viewportResolution }) : super(
    camera: CameraComponent.withFixedResolution(
      width: viewportResolution.x,
      height: viewportResolution.y,
    ),
  );


  final Vector2 viewportResolution;
  MovablePlayer player = MovablePlayer();


  Vector2? origin;
  bool isOriginCasted = false;
  Paint paint = Paint();
  final _colorTween = ColorTween(
    begin: Colors.blue.withOpacity(0.2),
    end: Colors.red.withOpacity(0.2),
  );

  static const numberOfRays = 300;
  final List<Ray2> rays = [];
  final List<RaycastResult<ShapeHitbox>> results = [];

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.load('dino.png');

    world.add(FpsTextComponent(position: Vector2(0, size.y - 24)));

    world.add(Universe());
    world.add(player = MovablePlayer());
    camera.setBounds(Universe.bounds);
    camera.follow(player, maxSpeed: 150);

    final paint = BasicPalette.gray.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    world.addAll([
      ScreenHitbox(),
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
        children: [CircleHitbox()],
      ),
      RectangleComponent(
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


  var _timePassed = 0.0;

  @override
  void update(double dt) {
    super.update(dt);


    final origin = player.absolutePosition;
    isOriginCasted = origin == this.origin;
    this.origin = origin;

    _timePassed += dt;
    paint.color = _colorTween.transform(0.5 + (sin(_timePassed) / 2))!;
    if (!isOriginCasted) {
      collisionDetection.raycastAll(origin, numberOfRays: numberOfRays, rays: rays, out: results);
      isOriginCasted = true;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (origin != null) {
      renderResult(canvas, origin!, results, paint);
    }
  }

  void renderResult(
      Canvas canvas,
      Vector2 origin,
      List<RaycastResult<ShapeHitbox>> results,
      Paint paint,
  ) {
    final originOffset = origin.toOffset();
    for (final result in results) {
      if (!result.isActive) {
        continue;
      }
      final intersectionPoint = result.intersectionPoint!.toOffset();
      canvas.drawLine(
        originOffset,
        intersectionPoint,
        paint,
      );
    }
  }
}
