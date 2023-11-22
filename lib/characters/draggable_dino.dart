

import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/game.dart';


class DragDino extends Character<AdventureGame> with HasGameRef<AdventureGame>, CollisionPassthrough, DragCallbacks {


  DragDino({ int? priority}) : super(priority: priority);


  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // animation = SpriteAnimation.fromFrameData(
    //   game.images.fromCache('characters/wizard/Idle.png'),
    //   SpriteAnimationData.sequenced(
    //     amount: 8,
    //     stepTime: 0.1,
    //     textureSize: Vector2.all(32),
    //   ),
    // );

  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.add(event.delta);
    event.continuePropagation = false;
  }



}