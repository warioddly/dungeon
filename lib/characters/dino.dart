

import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/constants/universe.dart';


class Dino extends Character<AdventureGame> {


  Dino({ int? priority}) : super(priority: priority);


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


    character = SpriteAnimationGroupComponent<CharacterState>(
      animations: {
        CharacterState.running: running,
        CharacterState.idle: idle,
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
    final deltaPosition = velocity * (Universe.playerSpeed * dt);
    position.add(deltaPosition);
    position.clamp(minPosition, maxPosition);
  }


  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    final isKeyDown = event is RawKeyDownEvent;
    character.current = CharacterState.running;

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
      if (velocity.x != 0 || velocity.y != 0) {
        character.current = CharacterState.running;
      } else {
        character.current = CharacterState.idle;
      }

      return false;
    }


    return super.onKeyEvent(event, keysPressed);
  }


}