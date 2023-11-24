import 'package:bonfire/bonfire.dart';

class GhostSpriteSheet {

  static const String path = "npc/ghost";

  static Future<SpriteAnimation> get idle => SpriteAnimation.load(
    "$path/idle.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1,
      textureSize: Vector2.all(100),
    ),
  );

  static Future<SpriteAnimation> get death => SpriteAnimation.load(
    "$path/death.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2(100, 120),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation {
    return SimpleDirectionAnimation(
      idleRight: idle,
      runRight: idle,
    );
  }

}
