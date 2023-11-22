

import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';


class Wizard extends Character<AdventureGame> {


  Wizard({ int? priority, bool handleKeyboardEvents = false}) : super(priority: priority, handleKeyboardEvents: handleKeyboardEvents);


  final LightConfig _lightConfig = LightConfig(
    radius: 320,
    numberOfRays: 300,
    type: LightType.torch,
    gradient: const RadialGradient(
      colors: [
        Color.fromRGBO(77, 6, 79, 0.1),
        Color.fromRGBO(77, 6, 79, 0.8),
        Color.fromRGBO(77, 11, 79, 0.7),
        Color.fromRGBO(77, 11, 79, 0.5),
        Colors.transparent
      ],
      stops: [0.0, 0.1, 0.5, 0.7, 1.0],
    )
  );


  LightConfig get lightConfig => _lightConfig;


  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final running = await game.loadSpriteAnimation(
      '/characters/wizard/Run.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.1,
        textureSize: Vector2.all(250)
      ),
    );

    final idle = await game.loadSpriteAnimation(
      '/characters/wizard/Idle.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.1,
        textureSize: Vector2.all(250),
      ),
    );

    final attack1 = await game.loadSpriteAnimation(
      '/characters/wizard/Attack1.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.1,
        textureSize: Vector2.all(250),
      ),
    );

    final attack2 = await game.loadSpriteAnimation(
      '/characters/wizard/Attack2.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.1,
        textureSize: Vector2.all(250),
      ),
    );

    character = SpriteAnimationGroupComponent<CharacterState>(
      animations: {
        CharacterState.running: running,
        CharacterState.idle: idle,
        CharacterState.attack1: attack1,
        CharacterState.attack2: attack2,
      },
      current: CharacterState.idle,
      size: Vector2.all(200),
      position: size / 2 - Vector2.all(200) / 2,
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