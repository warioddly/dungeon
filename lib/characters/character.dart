
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/utils/constants/universe.dart';


enum CharacterState {

  idle,
  running,
  jump,
  fall,
  attack1,
  attack2,

}

class Character<T extends FlameGame> extends SpriteAnimationComponent with HasGameReference<T>, KeyboardHandler, CollisionCallbacks {

  Character({
    super.position,
    Vector2? size,
    super.priority,
    super.key
  }) : super(
    size: size ?? Vector2.all(50),
    anchor: Anchor.center,
  );

  SpriteAnimationGroupComponent<CharacterState> character = SpriteAnimationGroupComponent<CharacterState>(
    animations: { },
    current: CharacterState.idle,
    size: Vector2.all(200),
    position: Vector2.zero(),

  );

  final Vector2 velocity = Vector2.zero();
  late final TextComponent positionText;
  late final Vector2 textPosition;
  late final maxPosition = Vector2.all(Universe.size - size.x / 2);
  late final minPosition = -maxPosition;


  void attack() {
    if (Random().nextInt(2) == 0) {
      character.current = CharacterState.attack1;
    } else {
      character.current = CharacterState.attack2;
    }
  }


  void onUpdate(double dt) {
    final deltaPosition = velocity * (Universe.playerSpeed * dt);
    position.add(deltaPosition);
    position.clamp(minPosition, maxPosition);
  }


  bool run(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    final isKeyDown = event is RawKeyDownEvent;

    character.current = CharacterState.running;

    final bool handled;

    if (event.logicalKey == LogicalKeyboardKey.space) {
      attack();
      handled = true;
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyA) {
      velocity.x = isKeyDown ? -1 : 0;
      handled = true;
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      velocity.x = isKeyDown ? 1 : 0;
      handled = true;
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      velocity.y = isKeyDown ? -1 : 0;
      handled = true;
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      velocity.y = isKeyDown ? 1 : 0;
      handled = true;
    }
    else {
      handled = false;
    }

    if (handled) {

      if (character.current == CharacterState.attack1 || character.current == CharacterState.attack2) {
        return false;
      }

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


