import 'package:bonfire/bonfire.dart';

class WizardSpriteSheet {

  static const String path = "npc/wizard";

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
    "$path/idle_left.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(250)
    ),
  );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "$path/idle_right.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(250)
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "$path/run_right.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(250)
    ),
  );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
    "$path/run_right.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(250),
    ),
  );



  static Future<SpriteAnimation> get attack => SpriteAnimation.load(
    "$path/Attack1.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(250),
    ),
  );


  static SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
    idleRight: idleRight,
    runRight: runRight,
  );
}
