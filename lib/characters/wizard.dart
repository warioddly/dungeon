

import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';


class Wizard extends Character<AdventureGame> {


  Wizard({ int? priority}) : super(priority: priority);


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
    super.onKeyEvent(event, keysPressed);
    return run(event, keysPressed);
  }


}