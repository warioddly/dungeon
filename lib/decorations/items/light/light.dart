
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';


abstract class Light {

  Vector2 origin = Vector2.zero();
  Paint paint = Paint();
  bool isOriginCasted = false;
  double timePassed = 0.0;
  final List<Ray2> rays = [];
  final List<RaycastResult<ShapeHitbox>> results = [];

  Character character = Character();

  LightConfig config = LightConfig();

  update(double dt);

  render(Canvas canvas);

}

