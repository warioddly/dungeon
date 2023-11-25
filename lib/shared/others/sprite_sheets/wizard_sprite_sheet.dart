import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

class WizardSpriteSheet {

  static const String path = "npc/wizard";
  static final Vector2 size = Vector2(250, 250);


  static Widget get spriteSheetAsWidget => SizedBox(
    width: 100,
    height: 100,
    child: Transform.scale(
      scale: 6,
      child: WizardSpriteSheet.idleRight.asWidget(),
    ),
  );


  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
    "$path/idle_left.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: size
    ),
  );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "$path/idle_right.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: size
    ),
  );


  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "$path/run_right.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: size
    ),
  );


  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
    "$path/run_right.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: size
    ),
  );



  static Future<SpriteAnimation> get attack => SpriteAnimation.load(
    "$path/Attack1.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: size
    ),
  );


  static SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
    idleRight: idleRight,
    runRight: runRight,
  );
}
