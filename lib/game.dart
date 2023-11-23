import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/blackhole.dart';
import 'package:warioddly/game_manual_controller.dart';
import 'package:warioddly/shared/player/knight_interface.dart';
import 'package:warioddly/shared/player/knight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameManualMap extends StatelessWidget {

  const GameManualMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BonfireWidget(
        joystick: Joystick(
          keyboardConfig: KeyboardConfig(
            acceptedKeys: [ LogicalKeyboardKey.space ],
          ),
          directional: JoystickDirectional(
            spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
            spriteKnobDirectional: Sprite.load('joystick_knob.png'),
            size: 100,
            isFixed: false,
          ),
          actions: [
            JoystickAction(
              actionId: PlayerAttackType.attackMelee,
              sprite: Sprite.load('joystick_attack.png'),
              align: JoystickActionAlign.BOTTOM_RIGHT,
              size: 80,
              margin: const EdgeInsets.only(bottom: 50, right: 50),
            ),
          ],
        ),
        player: Knight(Vector2((4 * BlackHole.tileSize), (6 * BlackHole.tileSize))),
        components: [
          ...BlackHole.enemies(),
          ...BlackHole.decorations(),
          GameManualController(),
        ],
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, BlackHole.tileSize, 20),
          speed: 1.5,
        ),
        interface: KnightInterface(),
        map: BlackHole.map(),
        backgroundColor: Colors.blueGrey[900]!,
        lightingColorGame: Colors.black.withOpacity(0.75),
      );
    });
  }
}
