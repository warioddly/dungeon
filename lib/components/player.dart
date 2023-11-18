import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/components/universe.dart';
import 'package:warioddly/dino_game.dart';


class Player<T extends FlameGame> extends SpriteComponent with HasGameReference<T> {

  Player({
    super.position,
    Vector2? size,
    super.priority,
    super.key
  }) : super(
    size: size ?? Vector2.all(50),
    anchor: Anchor.center,
  );

  @mustCallSuper
  @override
  Future<void> onLoad() async {
    // animation = await game.loadSpriteAnimation(
    //   'dino.png',
    //   SpriteAnimationData.sequenced(
    //     amount: 1,
    //     textureSize: Vector2.all(16),
    //     stepTime: 0.15,
    //   ),
    // );
    sprite = await game.loadSprite('dino.png');

  }
}


class MovablePlayer extends Player<DinoGame> with CollisionCallbacks, KeyboardHandler {

  MovablePlayer() : super(priority: 2);

  static const double speed = 200;
  static final TextPaint textRenderer = TextPaint(style: const TextStyle(color: Colors.white, fontSize: 12));

  final Vector2 velocity = Vector2.zero();
  late final TextComponent positionText;
  late final Vector2 textPosition;
  late final maxPosition = Vector2.all(Universe.size - size.x / 2);
  late final minPosition = -maxPosition;



  @override
  Future<void> onLoad() async {
    await super.onLoad();
    positionText = TextComponent(
      textRenderer: textRenderer,
      position: (size / 2)..y = size.y / 2 + 30,
      anchor: Anchor.center,
    );
    add(positionText);
  }


  @override
  void update(double dt) {
    super.update(dt);
    final deltaPosition = velocity * (speed * dt);
    position.add(deltaPosition);
    position.clamp(minPosition, maxPosition);
    positionText.text = '(${x.toInt()}, ${y.toInt()})';
  }


  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    final isKeyDown = event is RawKeyDownEvent;

    final bool handled;
    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      velocity.x = isKeyDown ? -1 : 0;
      handled = true;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      velocity.x = isKeyDown ? 1 : 0;
      handled = true;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      velocity.y = isKeyDown ? -1 : 0;
      handled = true;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      velocity.y = isKeyDown ? 1 : 0;
      handled = true;
    } else {
      handled = false;
    }

    if (handled) {
      angle = -velocity.angleToSigned(Vector2(1, 0));
      return false;
    }

    return super.onKeyEvent(event, keysPressed);
  }


}


