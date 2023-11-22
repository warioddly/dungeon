

import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';


class Ghost extends Character<AdventureGame> {


  Ghost({ int? priority, bool handleKeyboardEvents = false}) : super(priority: priority, handleKeyboardEvents: handleKeyboardEvents);


  final LightConfig _lightConfig = LightConfig(
    radius: 500,
    maxPulseRadius: 530,
    numberOfRays: 300,
    color: Colors.white,
  );


  LightConfig get lightConfig => _lightConfig;


  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final idle = await game.loadSpriteAnimation(
      '/characters/ghost/idle.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2.all(100),
      ),
    );

    final attack = await game.loadSpriteAnimation(
      '/characters/ghost/attacking.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        // amountPerRow: 3,
        stepTime: 0.1,
        textureSize: Vector2(100, 100)
      ),
    );

    character = SpriteAnimationGroupComponent<CharacterState>(
      animations: {
        CharacterState.running: idle,
        CharacterState.idle: idle,
        CharacterState.attack1: attack,
        CharacterState.attack2: attack,
      },
      current: CharacterState.idle,
      size: Vector2.all(100),
      position: size / 2 - Vector2.all(100) / 2,
    );

    add(character);

  }


  @override
  void update(double dt) {
    super.update(dt);
    onUpdate(dt);
  }


  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    onKeyboardEvent(event, keysPressed);
    return super.onKeyEvent(event, keysPressed);
  }


}