import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';

class ColumnDecoration extends GameDecoration {
  ColumnDecoration(Vector2 position)
      : super.withSprite(
          sprite: CommonSpriteSheet.columnSprite,
          position: position,
          size: Vector2(Dungeon.tileSize, Dungeon.tileSize * 3),
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(
          Dungeon.tileSize * 0.8,
          Dungeon.tileSize / 2,
        ),
        position: Vector2(
          Dungeon.tileSize * 0.1,
          Dungeon.tileSize * 1.8,
        ),
      ),
    );
    return super.onLoad();
  }
}
