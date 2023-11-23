import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/blackhole.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/enemy_sprite_sheet.dart';
import 'package:flutter/material.dart';

class Goblin extends SimpleEnemy
    with
        BlockMovementCollision,
        JoystickListener,
        MovementByJoystick,
        AutomaticRandomMovement,
        UseLifeBar {
  double attack = 20;
  bool enableBehaviors = true;
  Goblin(Vector2 position)
      : super(
          animation: GoblinSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(BlackHole.tileSize * 0.8),
          speed: BlackHole.tileSize,
          life: 100,
        ) {
    setupLifeBar(
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!enableBehaviors) return;

    if (!gameRef.sceneBuilderStatus.isRunning) {
      seeAndMoveToPlayer(
        radiusVision: BlackHole.tileSize,
        closePlayer: (p) {
          execAttack(attack);
        },
        notObserved: () {
          seeAndMoveToAttackRange(
            minDistanceFromPlayer: BlackHole.tileSize * 2,
            useDiagonal: false,
            positioned: (p) {
              execAttackRange(attack);
            },
            radiusVision: BlackHole.tileSize * 3,
            notObserved: () {
              runRandomMovement(
                dt,
                speed: speed / 2,
                maxDistance: (BlackHole.tileSize * 3).toInt(),
              );
              return false;
            },
          );
          return false;
        },
      );
    }
  }

  @override
  void die() {
    super.die();
    gameRef.add(
      AnimatedGameObject(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
        size: Vector2.all(BlackHole.tileSize),
        loop: false,
      ),
    );
    removeFromParent();
  }

  void execAttackRange(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackRange(
      animationRight: CommonSpriteSheet.fireBallRight,
      animationDestroy: CommonSpriteSheet.explosionAnimation,
      id: 35,
      size: Vector2.all(width * 0.9),
      damage: damage,
      speed: BlackHole.tileSize * 3,
      collision: RectangleHitbox(
        size: Vector2.all(width / 2),
        position: Vector2(width * 0.25, width * 0.25),
      ),
      lightingConfig: LightingConfig(
        radius: width / 2,
        blurBorder: width,
        color: Colors.orange.withOpacity(0.3),
      ),
    );
  }

  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackMelee(
      size: Vector2.all(width),
      damage: damage / 2,
      interval: 400,
      sizePush: BlackHole.tileSize / 2,
      animationRight: CommonSpriteSheet.blackAttackEffectRight,
    );
  }

  @override
  void removeLife(double life) {
    showDamage(
      life,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    super.removeLife(life);
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(
          BlackHole.tileSize * 0.4,
          BlackHole.tileSize * 0.4,
        ),
        position: Vector2(
          BlackHole.tileSize * 0.2,
          BlackHole.tileSize * 0.2,
        ),
      ),
    );
    return super.onLoad();
  }
}
