
import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/utils/configs/light.dart';
import 'package:warioddly/utils/constants/universe.dart';


class Light<T extends FlameGame> extends PositionComponent with HasGameRef<T> {


  Light({
    int? priority,
    LightConfig? config,
  }): config = config ?? LightConfig(),
      super(priority: priority);


  final LightConfig config;


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
  FutureOr<void> onLoad() {
    super.onLoad();
    //
    // gradient ??= RadialGradient(
    //   colors: [
    //     Colors.orange.withOpacity(0.5),
    //     Colors.black.withOpacity(0.2),
    //   ],
    //   stops: const [0.0, 2.0],
    // );

    // add(CircleHitbox(
    //   anchor: Anchor.center,
    //   radius: config.radius,
    // ));

  }


}