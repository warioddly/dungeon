import 'dart:math';
import 'package:bonfire/mixins/direction_animation.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/characters/player.dart';
import 'package:warioddly/constants/universe.dart';
import 'package:warioddly/decorates/texts/animated_text_box.dart';
import 'package:warioddly/game.dart';


class MyWorld extends World with HasCollisionDetection, HasGameRef<AdventureGame> {

  MyWorld();

  Player get player => gameRef.player;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    debugMode = false;

    final paint = BasicPalette.gray.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    origin = player.absoluteCenter;

    addAll([

      // SimpleEnemy(
      //   position: Vector2(100, 100),
      //   size: Vector2.all(50),
      //   animation: SimpleDirectionAnimation(
      //     idleLeft:  gameRef.loadSpriteAnimation(path, data)
      //     idleRight: await gameRef.loadSprite('dino.png'),
      //     runLeft: await gameRef.loadSprite('dino.png'),
      //     runRight: await gameRef.loadSprite('dino.png'),
      //   ),
      // ),

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
  double _timePassed = 0.0;
  final List<Ray2> rays = [];
  final List<RaycastResult<ShapeHitbox>> results = [];


  @override
  void update(double dt) {
    super.update(dt);

    final origin = player.absoluteCenter;
    isOriginCasted = origin == this.origin;
    this.origin = origin;

    _timePassed += dt;

    paint.shader = gradient.createShader(Rect.fromCircle(
      center: origin.toOffset(),
      radius: 300 + sin(_timePassed * 15) * 30,
    ));

    if (!isOriginCasted) {

      // double angle = player.angle;
      // double angleDelta = 3.14159 / 3;

      collisionDetection.raycastAll(
        origin,
        numberOfRays: Universe.numberOfRays,
        // maxDistance: Universe.rayMaxDistance,
        rays: rays,
        out: results,
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

//
//
// class Enemy extends Npc with Attackable {
//   Enemy({
//     required Vector2 position,
//     required Vector2 size,
//     double life = 10,
//     double speed = 100,
//     ReceivesAttackFromEnum receivesAttackFrom =
//         ReceivesAttackFromEnum.PLAYER_AND_ALLY,
//   }) : super(position: position, size: size, speed: speed) {
//     this.speed = speed;
//     this.receivesAttackFrom = receivesAttackFrom;
//     initialLife(life);
//     this.position = position;
//     this.size = size;
//   }
// }
//
// class SimpleEnemy extends Enemy with DirectionAnimation {
//   SimpleEnemy({
//     required Vector2 position,
//     required Vector2 size,
//     required SimpleDirectionAnimation animation,
//     double life = 100,
//     double speed = 100,
//     Direction initDirection = Direction.right,
//     ReceivesAttackFromEnum receivesAttackFrom =
//         ReceivesAttackFromEnum.PLAYER_AND_ALLY,
//   }) : super(
//     position: position,
//     size: size,
//     life: life,
//     speed: speed,
//     receivesAttackFrom: receivesAttackFrom,
//   ) {
//     this.animation = animation;
//     lastDirection = initDirection;
//     lastDirectionHorizontal =
//     initDirection == Direction.left ? Direction.left : Direction.right;
//   }
// }