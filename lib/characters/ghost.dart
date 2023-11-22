

import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';


class Ghost extends Character<AdventureGame> {


  Ghost({ int? priority}) : super(priority: priority);


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
      '/characters/ghost/Idle.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2.all(100),
      ),
    );

    print((await game.loadSprite('/characters/ghost/Idle.png')).image);

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
        CharacterState.running: idle,
        CharacterState.idle: idle,
        CharacterState.attack1: idle,
        CharacterState.attack2: idle,
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
    super.onKeyEvent(event, keysPressed);
    return run(event, keysPressed);
  }


}