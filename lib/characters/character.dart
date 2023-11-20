
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/utils/constants/universe.dart';
import 'package:warioddly/worlds/my_world.dart';


class Character<T extends FlameGame> extends SpriteComponent with HasGameReference<T>, KeyboardHandler, CollisionCallbacks {

  Character({
    super.position,
    Vector2? size,
    super.priority,
    super.key
  }) : super(
    size: size ?? Vector2.all(50),
    anchor: Anchor.center,
  );



  final Vector2 velocity = Vector2.zero();
  late final TextComponent positionText;
  late final Vector2 textPosition;
  late final maxPosition = Vector2.all(Universe.size - size.x / 2);
  late final minPosition = -maxPosition;

  Light? light;


  void addLight(Light light) {
    this.light = light
      ..character = this;
  }


}


