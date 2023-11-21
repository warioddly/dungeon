
import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/characters/draggable_dino.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/decorations/texts/animated_text_box.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';
import '../characters/dino.dart';
import '../utils/mixins/component_light_mixin.dart';


class MyWorld extends World with HasGameRef<AdventureGame>, HasCollisionDetection, HasCharacterLighting<AdventureGame> {

  MyWorld();


  DragDino pla = DragDino();
  Dino player = Dino();


  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugMode = false;

    final paint = BasicPalette.gray.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    addAll([
      player,
      pla,
    ]);

    addAll([
      ScreenHitbox(),
      AnimatedTextBox(
          '''"Hi there! Welcome to my Portfolio.

I'm IMØ, and I'm passionate about web/mobile development. Here, you'll find a collection of my work and projects that showcase my skills and creativity.

Feel free to explore and get to know more about my journey. If you have any questions or if there's something specific you're looking for, don't hesitate to reach out.
          
Thanks for stopping by, and I hope you enjoy your visit!"'''
      )
        ..anchor = Anchor.center
        ..y = -220,

      CircleComponent(
          position: Vector2(150, 500),
          radius: 50,
          paint: paint,
          children: [
            CircleHitbox()
              ..isSolid = true
              ..collisionType = CollisionType.active
          ]
      ),
      RectangleComponent(
        priority: 2,
        position: Vector2.all(300),
        size: Vector2.all(100),
        paint: paint,
        children: [RectangleHitbox()],
      ),
      RectangleComponent(
        position: Vector2.all(500),
        size: Vector2(100, 200),
        paint: paint,
        children: [RectangleHitbox()],
      ),
      RectangleComponent(
        position: Vector2(550, 200),
        size: Vector2(200, 150),
        paint: paint,
        children: [RectangleHitbox()],
      ),

    ]);

    addLight(player, LightConfig(
      radius: 320,
      color: Colors.red,
      type: LightType.torch,
    ));

    addLight(pla, LightConfig(
      radius: 250,
      color: Colors.red,
    ));

  }



}



