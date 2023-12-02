import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:flutter/material.dart';

class Torch extends GameDecoration {
  Torch(Vector2 position)
      : super.withAnimation(
          animation: CommonSpriteSheet.torchAnimated,
          size: Vector2.all(Dungeon.tileSize),
          position: position,
          lightingConfig: LightingConfig(
            radius: Dungeon.tileSize * 2,
            blurBorder: Dungeon.tileSize,
            color: Colors.deepOrangeAccent.withOpacity(0.3),
            withPulse: true,
            align: Vector2(-Dungeon.tileSize * 0.25, -Dungeon.tileSize * 0.3),
          ),
        );
}
