
import 'dart:math';
import 'dart:async';
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
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
  skill,


}

class Character<T extends FlameGame> extends SpriteAnimationComponent with HasGameReference<T>, KeyboardHandler, CollisionCallbacks {

  Character({
    super.position,
    Vector2? size,
    this.handleKeyboardEvents = false,
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
  final bool handleKeyboardEvents;

  bool isAttacking = false;

  Completer<void>? _currentAttackCompleter;

  void attack() {

    if (_currentAttackCompleter != null) {

      if (!_currentAttackCompleter!.isCompleted) {
        _currentAttackCompleter?.complete();
      }

    }
    else {
      _currentAttackCompleter = Completer<void>();
    }


    if (Random().nextInt(2) == 0) {
      character.current = CharacterState.attack1;
    } else {
      character.current = CharacterState.attack2;
    }

    isAttacking = true;

    Future.delayed(const Duration(milliseconds: 1250), () {
      character.current = CharacterState.idle;
      isAttacking = false;
    });

  }


  void onUpdate(double dt) {
    final deltaPosition = velocity * (Universe.playerSpeed * dt);
    position.add(deltaPosition);
    position.clamp(minPosition, maxPosition);
  }


  bool onKeyboardEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    if (!handleKeyboardEvents) return false;

    if (event.logicalKey == LogicalKeyboardKey.space) {
      attack();
      return false;
    }

    _move(event);

    return super.onKeyEvent(event, keysPressed);
  }


  void _move(RawKeyEvent event) {

    if (isAttacking) return;

    final isKeyDown = event is RawKeyDownEvent;


    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      velocity.x = isKeyDown ? -1 : 0;
      if (velocity.x != -1) flipHorizontally();
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      velocity.x = isKeyDown ? 1 : 0;

      if (velocity.x != 1) flipHorizontally();
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      velocity.y = isKeyDown ? -1 : 0;
    }
    else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      velocity.y = isKeyDown ? 1 : 0;
    }

    if (velocity.x != 0 || velocity.y != 0) {
      character.current = CharacterState.running;
    }
    else {
      character.current = CharacterState.idle;
    }

  }


  void infinityRandomMovement() {

    Future.delayed(const Duration(milliseconds: 100), () {
      character.current = CharacterState.running;
    });

    add(
      MoveAlongPathEffect(
        Path()
          ..moveTo(100, 0)
          ..lineTo(200, 100)
          ..lineTo(400, 100)
          ..lineTo(550, 550),
        EffectController(
          duration: 15,
          reverseDuration: 15,
          infinite: true,
        ),
      ),
    );


  }


}


