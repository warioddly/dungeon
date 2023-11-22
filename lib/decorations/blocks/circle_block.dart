import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:warioddly/game.dart';


class CircleBlock extends CircleComponent with CollisionCallbacks, HasGameRef<AdventureGame> {

  CircleBlock(
    Vector2 position,
    double radius
  ) : super(
    position: position,
    radius: radius,
  );


  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox());
  }


}
