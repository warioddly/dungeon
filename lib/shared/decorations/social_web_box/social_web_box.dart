
import 'package:bonfire/bonfire.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/shared/others/actions/decoration_dialog.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/crystal_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/social_box_sprite_sheet.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';

class SocialWebBox extends GameDecoration with TapGesture, Vision {

  SocialWebBox({
    required Vector2 position,
    required Future<Sprite> sprite,
    Vector2? size,
    this.project,
    this.color,
  }) : super.withSprite(
    sprite: sprite,
    size: size ?? SocialBoxSpriteSheet.size,
    position: position,
  );


  Color? color;
  ProjectModel? project;
  bool _observedPlayer = false;
  late final TextPaint _textConfig = TextPaint(
    style: TextStyle(
      color: const Color(0xFFFFFFFF),
      fontFamily: 'VT323',
      fontSize: width / 2,
    ),
  );


  @override
  Future<void> onLoad() {
    // add(RectangleHitbox());
    priority = 20;

    return super.onLoad();
  }


  @override
  void update(double dt) {
    if (gameRef.player != null && checkInterval('SeepLayr', 500, dt)) {
      seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!_observedPlayer) {
            _observedPlayer = true;
            _showEmote();
            _addOrRemoveLight();
          }
        },
        notObserved: () {
          _observedPlayer = false;
          _addOrRemoveLight();
        },
        radiusVision: Dungeon.tileSize,
      );
    }
    super.update(dt);
  }


  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_observedPlayer) {
      _textConfig.render(
        canvas,
        project?.title ?? "Touch me",
        Vector2(
          width / 2,
          height * 1.2,
        ),
        anchor: Anchor.center
      );
    }
  }


  @override
  void onTap() {
    if (_observedPlayer && project != null) {
      DecorationDialog.showSocialBox(gameRef, this, project!);
    }
  }


  void _showEmote() {

    add(
      AnimatedGameObject(
        animation: CommonSpriteSheet.emote,
        size: size,
        position: Vector2(width / -12, -height),
        loop: false,
      ),
    );

  }


  void _addOrRemoveLight() {
    setupLighting(
        _observedPlayer
          ? LightingConfig(
              radius: SocialBoxSpriteSheet.size.x,
              color: (color ?? Colors.blueAccent.withOpacity(0.2)),
              withPulse: true,
            )
          : null
    );
  }

}
