import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
import 'package:warioddly/shared/others/sprite_sheets/common_sprite_sheet.dart';

class Spikes extends GameDecoration with Sensor<Attackable> {
  Spikes(Vector2 position, {Vector2? size})
      : super.withSprite(
          sprite: CommonSpriteSheet.spikesSprite,
          position: position,
          size: size ?? Vector2.all(Dungeon.tileSize / 1.5),
        ) {
    setSensorInterval(500);
  }

  @override
  void onContact(Attackable component) {
    if (component is Player) {
      component.receiveDamage(AttackFromEnum.ENEMY, 10, 1);
    } else {
      component.receiveDamage(AttackFromEnum.PLAYER_OR_ALLY, 10, 1);
    }
  }
}
