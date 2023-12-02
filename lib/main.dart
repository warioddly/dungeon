
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
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
        player: Wizard(Vector2(2000, 1350)),
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
        map: WorldMapByTiled(
          'dungeon.tmj',
          forceTileSize: Vector2.all(16),
          objectsBuilder: {
            'object': (TiledObjectProperties properties) {
              return RecHItbox(
                position: properties.position,
                size: properties.size,
              );
            },
            'laaa': (TiledObjectProperties properties) {
              return RecHItbox(
                position: properties.position,
                size: properties.size,
              );
            }
          },
        ),
        backgroundColor: Colors.blueGrey[900]!,
        lightingColorGame: Colors.black.withOpacity(0.75),
      )
    );
  }

}


class RecHItbox extends GameDecoration {

  RecHItbox({required super.position, required super.size});


  @override
  Future<void> onLoad() {
    add(RectangleHitbox(
      position: super.position,
      size: super.size,
    ));
    return super.onLoad();
  }


}
