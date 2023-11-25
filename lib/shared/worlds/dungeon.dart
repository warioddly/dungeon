import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/decorations/crystal/blue_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/crystal.dart';
import 'package:warioddly/shared/decorations/crystal/dark_red_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/green_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/pink_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/red_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/violet_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/yellow_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/yellow_green_crystal.dart';
import 'package:warioddly/shared/npc/ghost.dart';
import 'package:warioddly/shared/npc/goblin.dart';
import 'package:warioddly/shared/others/constants/portfolio.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';

class Dungeon {

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
      ..._generateRandomCrystalWithProject()

      // Spikes(
      //   getRelativeTilePosition(7, 7),
      // ),
      // BarrelDraggable(getRelativeTilePosition(8, 6)),
      // GameDecorationWithCollision.withSprite(
      //   sprite: Sprite.load('itens/barrel.png'),
      //   position: getRelativeTilePosition(10, 6),
      //   size: Vector2(tileSize, tileSize),
      //   collisions: [
      //     RectangleHitbox(size: Vector2(tileSize / 1.5, tileSize / 1.5))
      //   ],
      // ),
      // Chest(getRelativeTilePosition(18, 7)),
      // GameDecorationWithCollision.withSprite(
      //   sprite: Sprite.load('itens/table.png'),
      //   position: getRelativeTilePosition(15, 7),
      //   size: Vector2(tileSize, tileSize),
      //   collisions: [
      //     RectangleHitbox(size: Vector2(tileSize, tileSize * 0.8)),
      //   ],
      // ),
      // GameDecorationWithCollision.withSprite(
      //   sprite: Sprite.load('itens/table.png'),
      //   position: getRelativeTilePosition(27, 6),
      //   size: Vector2(tileSize, tileSize),
      //   collisions: [
      //     RectangleHitbox(size: Vector2(tileSize, tileSize * 0.8)),
      //   ],
      // ),
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

      Ghost(getRelativeTilePosition(2, 6)),
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


  static List<Crystal> _generateRandomCrystalWithProject() {

    List<Crystal> crystals = [];

    for (ProjectModel project in PortfolioConstants.projects) {
      crystals.add(
        generateRandomCrystal(
          getRelativeTilePosition(Random().nextInt(30), Random().nextInt(10)),
          project
        )
      );
    }

    return crystals;
  }


  static generateRandomCrystal(Vector2 position, ProjectModel projectModel) {
    return switch (Random().nextInt(10)) {
      0 => BlueCrystal(position: position, project: projectModel),
      1 => DarkRedCrystal(position: position, project: projectModel),
      2 => GreenCrystal(position: position, project: projectModel),
      3 => PinkCrystal(position: position, project: projectModel),
      4 => RedCrystal(position: position, project: projectModel),
      5 => VioletCrystal(position: position, project: projectModel),
      6 => YellowCrystal(position: position, project: projectModel),
      7 => YellowGreenCrystal(position: position, project: projectModel),
      _ => BlueCrystal(position: position, project: projectModel)
    };
  }

}