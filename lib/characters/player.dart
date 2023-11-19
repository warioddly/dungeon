import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/decorates/items/flashlight.dart';
import 'package:warioddly/decorates/items/light.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/constants/universe.dart';


class Player extends Character<AdventureGame> with KeyboardHandler, HasGameRef<AdventureGame> {


  Player() : super(priority: 2);


  final Vector2 velocity = Vector2.zero();
  late final TextComponent positionText;
  late final Vector2 textPosition;
  late final maxPosition = Vector2.all(Universe.size - size.x / 2);
  late final minPosition = -maxPosition;

  final Light flashlight = FlashLight();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(flashlight
      ..radius = 500
      ..anchor = Anchor.center
      ..center = size / 2
    );
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