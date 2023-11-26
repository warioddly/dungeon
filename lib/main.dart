
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/others/constants/portfolio.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
import 'package:warioddly/game_manual_controller.dart';
import 'package:warioddly/shared/player/wizard_interface.dart';
import 'package:warioddly/shared/player/wizard.dart';
import 'package:flutter/services.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb) {
  //   await Flame.device.setLandscape();
  //   await Flame.device.fullScreen();
  // }

  runApp(const HomePage());
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warioddly',
      home: BonfireWidget(
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
        debugMode: false,
        player: Wizard(Vector2((4 * Dungeon.tileSize), (6 * Dungeon.tileSize))),
        interface: KnightInterface(),
        components: [
          ...Dungeon.enemies(),
          ...Dungeon.decorations(),
          // GameManualController(),
        ],
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, Dungeon.tileSize, 20),
          speed: 1.5,
        ),
        // map: WorldMapByTiled(
        //   'images/tiled/mapa$map.json',
        //   forceTileSize: Vector2(DungeonMap.tileSize, DungeonMap.tileSize),
        //   objectsBuilder: {
        //     'goblin': (properties) => Goblin(properties.position),
        //     'torch': (properties) => Torch(properties.position),
        //     'barrel': (properties) => BarrelDraggable(properties.position),
        //     'spike': (properties) => Spikes(properties.position),
        //     'column': (properties) => ColumnDecoration(properties.position),
        //     'chest': (properties) => Chest(properties.position),
        //     'critter': (properties) => Critter(properties.position),
        //     'wizard': (properties) => Wizard(properties.position),
        //   },
        // ),
        backgroundColor: Colors.blueGrey[900]!,
        lightingColorGame: Colors.black.withOpacity(0.75),
      )
    );
  }

}
