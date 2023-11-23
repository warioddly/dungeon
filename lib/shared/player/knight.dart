import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/blackhole.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/player_sprite_sheet.dart';
import 'package:warioddly/shared/player/dialogs/player_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PlayerAttackType {
  attackMelee,
  attackRange,
}

class Knight extends SimplePlayer with Lighting, BlockMovementCollision {

  double attack = 20;
  bool canShowEmote = true;
  bool showedDialog = false;

  Knight(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          size: Vector2.all(BlackHole.tileSize),
          position: position,
          speed: BlackHole.tileSize * 1.5,
          life: 200,
        ) {
    setupMovementByJoystick(intencityEnabled: true);
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        color: Colors.cyan,
        withPulse: true,
      ),
    );
  }

  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning) {
      return;
    }
    super.onJoystickChangeDirectional(event);
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning || isDead) {
      return;
    }
    if (event.event == ActionEvent.DOWN) {
      if (event.id == LogicalKeyboardKey.space || event.id == PlayerAttackType.attackMelee) {
          execMeleeAttack(attack);
      }
    }

    super.onJoystickAction(event);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _checkViewEnemy(dt);

  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.red,
      ),
    );
    super.receiveDamage(attacker, damage, identify);
  }

  void execShowEmote() {
    add(
      AnimatedGameObject(
        position: Vector2(width / 4, 0),
        animation: CommonSpriteSheet.emote,
        size: Vector2.all(width / 2),
        loop: false,
      ),
    );
  }

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }


  void _checkViewEnemy(double dt) {
    if (checkInterval('seeEnemy', 250, dt)) {
      seeEnemy(
        radiusVision: width * 4,
        notObserved: () => canShowEmote = true,
        observed: (enemies) => _handleObserveEnemy(enemies.first),
      );
    }
  }

  void _handleObserveEnemy(Enemy enemy) {
    if (canShowEmote) {
      canShowEmote = false;
      execShowEmote();
    }
    if (!showedDialog) {
      showedDialog = true;
      double lastZoom = gameRef.camera.zoom;
      stopMove();
      PlayerDialog.execShowTalk(
        gameRef,
        enemy,
        () {
          if (!isDead) {
            gameRef.camera.moveToPlayerAnimated(
              effectController: EffectController(duration: 1),
              zoom: lastZoom,
            );
          }
        },
      );
    }
  }

  void execMeleeAttack(double attack) {
    simpleAttackMelee(
      damage: attack,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      size: Vector2.all(BlackHole.tileSize),
    );
  }
}
