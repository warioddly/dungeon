

import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/decorations/items/light/torch.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/constants/universe.dart';
import 'package:warioddly/worlds/my_world.dart';


class DragDino extends Character<AdventureGame> with HasGameRef<AdventureGame>, CollisionPassthrough, DragCallbacks {


  DragDino({ int? priority}) : super(priority: priority);


  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await game.loadSprite('player/dino.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.add(event.delta);
    event.continuePropagation = false;
  }



}