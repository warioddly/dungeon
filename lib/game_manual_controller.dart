import 'dart:async';
import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
import 'package:warioddly/shared/npc/goblin.dart';
import 'shared/others/sprite_sheets/common_sprite_sheet.dart';

class GameManualController extends GameComponent {

  @override
  void update(double dt) {
    // if (checkInterval('check_living_enemies', 500, dt)) {
    //   if (gameRef.livingEnemies().length < 2) {
    //     _addEnemyInWorld();
    //   }
    // }
    super.update(dt);
  }


  @override
  FutureOr<void> onLoad() async {

    // var mapComponent = await TiledComponent.load(
    //     'dungeon.tmx',
    //     Vector2.all(16),
    //     prefix: 'assets/images/'
    // );

    // gameRef.add(mapComponent);

    return super.onLoad();
  }


  void _addEnemyInWorld() async {
    double x = Dungeon.tileSize * (4 + Random().nextInt(25));
    double y = Dungeon.tileSize * (5 + Random().nextInt(3));

    final goblin = Goblin(Vector2(x, y));




    gameRef.add(
      AnimatedGameObject(
        animation: CommonSpriteSheet.smokeExplosion,
        size: Vector2.all(Dungeon.tileSize),
        position: goblin.position,
        loop: false,
      ),
    );

    gameRef.add(goblin);

  }
}
