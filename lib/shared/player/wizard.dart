import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/others/actions/player_dialog.dart';
import 'package:warioddly/shared/others/sprite_sheets/wizard_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PlayerAttackType {
  attackMelee,
}

class Wizard extends SimplePlayer with BlockMovementCollision, Lighting {


  Wizard(Vector2 position) : super(
    animation: WizardSpriteSheet.simpleDirectionAnimation,
    size: WizardSpriteSheet.size,
    position: position,
    speed: 120
  ) {
    setupMovementByJoystick(intencityEnabled: true);
    setupLighting(LightingConfig(
      radius: width / 2,
      color: Colors.transparent,
      withPulse: true,
    ));
  }


  double attack = 20;
  bool canShowEmote = true;
  bool showedDialog = false;
  bool _greetShowed = false;


  @override
  Future<void> onLoad() async {

    // PlayerDialog.greetPlayer(gameRef, () => _greetShowed = true);

    add(RectangleHitbox(
        size: WizardSpriteSheet.size * 0.2,
        position: Vector2(WizardSpriteSheet.size.x / 2.5, WizardSpriteSheet.size.y / 2.15)
      ));

    size = WizardSpriteSheet.size / 1;
    scale = Vector2.all(1);
    width =  WizardSpriteSheet.size.x;
    height = WizardSpriteSheet.size.y;

    return super.onLoad();
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
          // execMeleeAttack(attack);
      }
    }

    super.onJoystickAction(event);
  }


  @override
  void update(double dt) {
    super.update(dt);
    _checkViewEnemy(dt);
  }


  void execShowEmote() {
    add(AnimatedGameObject(
        position: Vector2(WizardSpriteSheet.size.x / 2, WizardSpriteSheet.size.y / 2.55),
        size: Vector2.all(width / 9),
        animation: CommonSpriteSheet.emote,
        anchor: Anchor.center,
        loop: false,
      ));
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
    if (!showedDialog && _greetShowed) {
      double lastZoom = gameRef.camera.zoom;
      stopMove();
      PlayerDialog.execShowTalkWithNpc(
        gameRef,
        enemy,
        () {
          showedDialog = true;
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
    stopMove();
    simpleAttackMelee(
      damage: attack,
      animationRight: WizardSpriteSheet.attack,
      size: Vector2.all(250),
    );
  }


}
