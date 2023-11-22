import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/utils/configs/text.dart';


class TouchableComponent extends PositionComponent with HoverCallbacks {

  TouchableComponent() : super(
  );


  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(
        TextComponent(
          text: 'Hello',
          textRenderer: TextConfig.renderer,
      )
    );
  }



 @override
  void onHoverEnter() {
    print('122');
    super.onHoverEnter();
  }

}

class MyShapeComponent extends PositionComponent
    with TapCallbacks, HoverCallbacks, GestureHitboxes {
  final ShapeHitbox hitbox;
  late final Color baseColor;
  late final Color hoverColor;

  MyShapeComponent({
    required this.hitbox,
    super.position,
    super.size,
    super.angle,
  }) : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    baseColor = Colors.white;
    hitbox.paint.color = baseColor;
    hitbox.renderShape = true;
    add(hitbox);
  }

  @override
  void onTapDown(TapDownEvent _) {
    removeFromParent();
  }

  @override
  void onHoverEnter() {
    print('hover');
    hitbox.paint.color = hitbox.paint.color;
  }

  @override
  void onHoverExit() {
    hitbox.paint.color = baseColor;
  }
}