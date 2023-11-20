import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/decorates/items/flashlight.dart';
import 'package:warioddly/decorates/items/light.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';
import 'package:warioddly/utils/constants/universe.dart';
import 'package:warioddly/worlds/my_world.dart';


class Dino extends Character<AdventureGame> with HasGameRef<AdventureGame> {


  Dino({ int? priority}) : super(priority: priority);


  late final Flashlight flashlight;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await game.loadSprite('dino.png');

    add(
        CircleHitbox(
          anchor: Anchor.center,
          radius: 300,
        )
    );
    // add(flashlight = Flashlight());

  }


}