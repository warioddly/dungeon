
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:warioddly/game.dart';
import 'package:warioddly/utils/configs/light.dart';
import 'package:warioddly/utils/constants/universe.dart';


import 'light.dart';

class Flashlight extends Light<AdventureGame> with HasCollisionDetection {

  Flashlight({ int? priority }) : super(
    priority: priority,
  );


  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    add(CircleHitbox(
      anchor: Anchor.center,
      radius: LightConfig().radius,
    ));
  }


}