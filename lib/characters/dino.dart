

import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/constants/universe.dart';


class Dino extends Character<AdventureGame> with HasGameRef<AdventureGame>, CollisionPassthrough {


  Dino({ int? priority}) : super(priority: priority);


  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await game.loadSprite('characters/dino.png');
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
      angle = -velocity.angleToSigned(Vector2(1, -1));
      return false;
    }

    return super.onKeyEvent(event, keysPressed);
  }



}