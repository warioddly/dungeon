import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/others/actions/decoration_dialog.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/others/sprite_sheets/crystal_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:flutter/material.dart';

class Crystal extends GameDecoration with TapGesture, Vision {

  Crystal({
    required Vector2 position,
    required Future<Sprite> sprite,
    Vector2? size,
    Color? color,
    this.project,
  }) : super.withSprite(
    sprite: sprite,
    size: size ?? CrystalSpriteSheet.size,
    position: position,
    lightingConfig: LightingConfig(
      radius: CrystalSpriteSheet.size.x,
      blurBorder: CrystalSpriteSheet.size.x,
      color: color ?? Colors.white.withOpacity(0.4),
      withPulse: true,
    )
  );


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
    add(RectangleHitbox());
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
          }
        },
        notObserved: () {
          _observedPlayer = false;
        },
        radiusVision: CrystalSpriteSheet.size.x,
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
        'Touch me',
        Vector2(width / -4.5, height),
      );
    }
  }


  @override
  void onTap() {
    if (_observedPlayer && project != null) {
      CrystalDialog.show(gameRef, this, project!);
    }
  }


  @override
  void onTapCancel() {}


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


}
