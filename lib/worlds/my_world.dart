
import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/characters/ghost.dart';
import 'package:warioddly/characters/wizard.dart';
import 'package:warioddly/decorations/blocks/clickable_box.dart';
import 'package:warioddly/decorations/texts/animated_text_box.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/text.dart';
import '../utils/mixins/component_light_mixin.dart';


class MyWorld extends World with HasGameRef<AdventureGame>, HasCollisionDetection, HasCharacterLighting<AdventureGame>, TapCallbacks {

  MyWorld();


  Wizard wizard = Wizard(handleKeyboardEvents: false);
  Ghost player = Ghost(priority: 2, handleKeyboardEvents: true)..position = Vector2(0, 0.01);


  @override
  Future<void> onLoad() async {
    super.onLoad();

    debugMode = false;

    final paint = BasicPalette.gray.paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    addAll([
      wizard,
      player,

      ScreenHitbox(),
      AnimatedTextBox(
          '''"Hi there! Welcome to my Portfolio.

I'm IMØ, and I'm passionate about web/mobile development. Here, you'll find a collection of my work and projects that showcase my skills and creativity.

Feel free to explore and get to know more about my journey. If you have any questions or if there's something specific you're looking for, don't hesitate to reach out.
          
Thanks for stopping by, and I hope you enjoy your visit!"''',
        size: Vector2(450, 300)
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

    TouchableComponent(),
      MyShapeComponent(hitbox: CircleHitbox()),
    ]);



    addLight(player, player.lightConfig);
    addLight(wizard, wizard.lightConfig);

    wizard
      ..add(TextBoxComponent(
        priority: 1,
        text: 'Hi there! Adventurer',
        textRenderer: TextConfig.renderer,
        boxConfig: TextBoxConfig(
          maxWidth: 200,
          timePerChar: 0.05,
          dismissDelay: 15,
          growingBox: true,
          margins: const EdgeInsets.all(30),
        ),
        position: Vector2(25, -10),
        anchor: Anchor.center,
        align: Anchor.center,
      ))
      ..infinityRandomMovement();

  }

}



