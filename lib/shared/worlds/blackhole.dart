import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/decorations/barrel_dragable.dart';
import 'package:warioddly/shared/decorations/chest.dart';
import 'package:warioddly/shared/decorations/spikes.dart';
import 'package:warioddly/shared/npc/ghost.dart';
import 'package:warioddly/shared/npc/goblin.dart';

class BlackHole {

  static double tileSize = 45;

  static const String floor_1 = 'tile/floor_1.png';
  static const String floor_2 = 'tile/floor_2.png';
  static const String floor_3 = 'tile/floor_3.png';
  static const String floor_4 = 'tile/floor_4.png';

  static void generateMap(
    List<TileModel> tileList,
    int indexRow,
    int indexColumn,
    String pngImage,
  ) {
    tileList.add(
      TileModel(
        sprite: TileModelSprite(path: pngImage),
        x: indexColumn.toDouble(),
        y: indexRow.toDouble(),
        collisions: [RectangleHitbox(size: Vector2(tileSize, tileSize))],
        width: tileSize,
        height: tileSize,
      ),
    );
  }

  static WorldMap map() {
    List<TileModel> tileList = [];
    return WorldMap(tileList);
  }

  static List<GameDecoration> decorations() {
    return [
      Spikes(
        getRelativeTilePosition(7, 7),
      ),
      BarrelDraggable(getRelativeTilePosition(8, 6)),
      // GameDecorationWithCollision.withSprite(
      //   sprite: Sprite.load('itens/barrel.png'),
      //   position: getRelativeTilePosition(10, 6),
      //   size: Vector2(tileSize, tileSize),
      //   collisions: [
      //     RectangleHitbox(size: Vector2(tileSize / 1.5, tileSize / 1.5))
      //   ],
      // ),
      Chest(getRelativeTilePosition(18, 7)),
      GameDecorationWithCollision.withSprite(
        sprite: Sprite.load('itens/table.png'),
        position: getRelativeTilePosition(15, 7),
        size: Vector2(tileSize, tileSize),
        collisions: [
          RectangleHitbox(size: Vector2(tileSize, tileSize * 0.8)),
        ],
      ),
      GameDecorationWithCollision.withSprite(
        sprite: Sprite.load('itens/table.png'),
        position: getRelativeTilePosition(27, 6),
        size: Vector2(tileSize, tileSize),
        collisions: [
          RectangleHitbox(size: Vector2(tileSize, tileSize * 0.8)),
        ],
      ),
      // Torch(getRelativeTilePosition(4, 4)),
      // Torch(getRelativeTilePosition(12, 4)),
      // Torch(getRelativeTilePosition(20, 4)),
      // Torch(getRelativeTilePosition(28, 4)),
      // GameDecoration.withSprite(
      //   sprite: Sprite.load('itens/flag_red.png'),
      //   position: getRelativeTilePosition(24, 4),
      //   size: Vector2(tileSize, tileSize),
      // ),
      // GameDecoration.withSprite(
      //   sprite: Sprite.load('itens/flag_red.png'),
      //   position: getRelativeTilePosition(6, 4),
      //   size: Vector2(tileSize, tileSize),
      // ),
      // GameDecoration.withSprite(
      //   sprite: Sprite.load('itens/prisoner.png'),
      //   position: getRelativeTilePosition(10, 4),
      //   size: Vector2(tileSize, tileSize),
      // ),
      // GameDecoration.withSprite(
      //   sprite: Sprite.load('itens/flag_red.png'),
      //   position: getRelativeTilePosition(14, 4),
      //   size: Vector2(tileSize, tileSize),
      // )
    ];
  }

  static List<Enemy> enemies() {
    return [
      Ghost(getRelativeTilePosition(14, 6)),
      // Goblin(getRelativeTilePosition(14, 6)),
      Goblin(getRelativeTilePosition(25, 6)),
    ];
  }

  static String randomFloor() {
    int p = Random().nextInt(6);
    switch (p) {
      case 0:
        return floor_1;
      case 1:
        return floor_2;
      case 2:
        return floor_3;
      case 3:
        return floor_4;
      case 4:
        return floor_3;
      case 5:
        return floor_4;
      default:
        return floor_1;
    }
  }

  static Vector2 getRelativeTilePosition(int x, int y) {
    return Vector2(
      (x * tileSize).toDouble(),
      (y * tileSize).toDouble(),
    );
  }
}
