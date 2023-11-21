
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/utils/configs/light.dart';


enum LightType {

  radial,
  torch,
  angle,

}



abstract class Light {

  LightConfig config = LightConfig();
  PositionComponent target = PositionComponent();
  CollisionDetection collisionDetection = StandardCollisionDetection();

  Vector2 origin = Vector2.zero();
  Paint paint = Paint();
  bool isOriginCasted = false;
  final List<Ray2> rays = [];
  final List<RaycastResult<ShapeHitbox>> results = [];



  update(double dt);

  render(Canvas canvas);

}

