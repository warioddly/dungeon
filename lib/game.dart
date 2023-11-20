
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:warioddly/characters/character.dart';
import 'package:warioddly/characters/dino.dart';
import 'package:warioddly/utils/constants/universe.dart';
import 'package:warioddly/worlds/my_world.dart';


class AdventureGame extends FlameGame with HasKeyboardHandlerComponents {


  AdventureGame({ required this.viewportResolution }) : super(
    world: MyWorld(),
  );


  late final Character<AdventureGame> player;
  final Vector2 viewportResolution;


  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.load('player/dino.png');
    add(FpsTextComponent(position: Vector2(10, 10)));

    world.add(player = Dino());
    camera.follow(player, maxSpeed: Universe.cameraSpeed);

  }


}
