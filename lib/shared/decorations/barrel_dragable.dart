import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:warioddly/shared/worlds/blackhole.dart';
import 'package:flutter/material.dart';

class BarrelDraggable extends GameDecoration
    with DragGesture, Movement, Pushable, BlockMovementCollision, HandleForces {
  late TextPaint _textConfig;
  String text = 'Drag here';
  double xCenter = 0;
  double yCenter = 0;

  BarrelDraggable(Vector2 position)
      : super.withSprite(
          sprite: CommonSpriteSheet.barrelSprite,
          position: position,
          size: Vector2.all(BlackHole.tileSize),
        ) {
    _textConfig = TextPaint(
      style: TextStyle(color: Colors.white, fontSize: width / 4),
    );
    addForce(ResistanceForce2D(id: 'attr', value: Vector2.all(5)));
  }

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size / 1.5, position: size / 8.5, isSolid: true));
    final textSize = _textConfig.getLineMetrics(text).size;
    xCenter = (width - textSize.x) / 2;
    yCenter = (height - textSize.y) / 2;
    add(
      TextComponent(
        text: text,
        position: Vector2(xCenter, 2.5 * yCenter),
        textRenderer: _textConfig,
      ),
    );
    return super.onLoad();
  }
}
