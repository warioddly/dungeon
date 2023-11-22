
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/decorations/items/light/radial_light.dart';
import 'package:warioddly/utils/configs/light.dart';


class Torchlight extends RadialLight {


  Torchlight({
    required CollisionDetection collisionDetection,
    LightConfig? config,
    PositionComponent? component,
  }) : super(
    collisionDetection: collisionDetection,
    config: config,
    component: component,
  ) {

    if (config?.gradient == null) {
      this.config = config?.copyWith(
        gradient: RadialGradient(
          colors: [Colors.yellow, Colors.orange, Colors.red.withOpacity(0.6), Colors.transparent],
          stops: const [0.0, 0.5, 0.8, 1.0],
        )
      );
    }

  }

}
