import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';


class Character<T extends FlameGame> extends SpriteComponent with HasGameReference<T> {

  Character({
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
    sprite = await game.loadSprite('dino.png');
    super.onLoad();
  }
}


