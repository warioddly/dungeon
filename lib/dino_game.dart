import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:warioddly/components/player.dart';

import 'components/universe.dart';


class DinoGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {


  DinoGame({ required this.viewportResolution }) : super(
    camera: CameraComponent.withFixedResolution(
      width: viewportResolution.x,
      height: viewportResolution.y,
    ),
  );


  final Vector2 viewportResolution;
  MovablePlayer player = MovablePlayer();


  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.load('dino.png');

    add(Universe());
    add(player = MovablePlayer());
    camera.setBounds(Universe.bounds);
    camera.follow(player, maxSpeed: 250);

  }


}
