
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:warioddly/utils/constants/universe.dart';
import 'package:warioddly/worlds/my_world.dart';


class AdventureGame extends FlameGame with HasKeyboardHandlerComponents {


  AdventureGame({ required this.viewportResolution }) : super(
    world: MyWorld(),
  );


  final Vector2 viewportResolution;


  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.loadAll([

      '/characters/wizard/Idle.png',
      '/characters/wizard/Run.png',
      '/characters/wizard/Attack1.png',
      '/characters/wizard/Attack2.png',

      '/characters/ghost/idle.png',
      '/characters/ghost/attacking.png',
    ]);

    add(FpsTextComponent(position: Vector2(10, 10)));

    camera
      ..viewfinder.zoom = 1.5
      ..follow((world as MyWorld).player, maxSpeed: Universe.cameraSpeed);

  }


}
