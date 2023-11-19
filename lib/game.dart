
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:warioddly/characters/player.dart';
import 'package:warioddly/constants/universe.dart';
import 'package:warioddly/worlds/my_world.dart';


class AdventureGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection {


  AdventureGame({ required this.viewportResolution }) : super(
    world: MyWorld(),
  );


  final Vector2 viewportResolution;
  late Player player;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(FpsTextComponent(position: Vector2(10, 10)));

    await images.load('dino.png');

    world.add(player = Player());

    camera.follow(player, maxSpeed: Universe.cameraSpeed);

  }


}
