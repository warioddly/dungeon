
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/decorations/crystal/blue_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/dark_red_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/green_crystal.dart';
import 'package:warioddly/shared/decorations/crystal/pink_crystal.dart';
import 'package:warioddly/shared/decorations/social_web_box/github_box.dart';
import 'package:warioddly/shared/decorations/social_web_box/instagram_box.dart';
import 'package:warioddly/shared/decorations/social_web_box/io_box.dart';
import 'package:warioddly/shared/decorations/social_web_box/leetcode_box.dart';
import 'package:warioddly/shared/decorations/social_web_box/linkedin_box.dart';
import 'package:warioddly/shared/npc/ghost.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/worlds/dungeon.dart';
import 'package:warioddly/shared/player/wizard_interface.dart';
import 'package:warioddly/shared/player/wizard.dart';
import 'package:flutter/services.dart';

import 'shared/decorations/social_web_box/hackerrank_box.dart';


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
        debugMode: true,
        player: Wizard(Vector2(2000, 1350)),
        interface: KnightInterface(),
        // components: [
        //   // ...Dungeon.enemies(),
        //   // ...Dungeon.decorations(),
        //   // GameManualController(),
        // ],
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, Dungeon.tileSize, 20),
          speed: 1.5,
        ),
        map: WorldMapByTiled(
          'dungeon.tmj',
          forceTileSize: Vector2.all(16),
          objectsBuilder: objectBuilder(),
        ),
        backgroundColor: Colors.blueGrey[900]!,
        lightingColorGame: Colors.black.withOpacity(0.75),
      )
    );
  }



  Map<String, GameComponent Function(TiledObjectProperties)> objectBuilder() {
    return {
      'ghost': (TiledObjectProperties properties) {
        return Ghost(properties.position);
      },

      'blue_crystal': (TiledObjectProperties properties) {
        return BlueCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'dark_red_crystal': (TiledObjectProperties properties) {
        return DarkRedCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'green_crystal': (TiledObjectProperties properties) {
        return GreenCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'pink_crystal': (TiledObjectProperties properties) {
        return PinkCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'red_crystal': (TiledObjectProperties properties) {
        return PinkCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'violet_crystal': (TiledObjectProperties properties) {
        return PinkCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'yellow_crystal': (TiledObjectProperties properties) {
        return PinkCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'yellow_green_crystal': (TiledObjectProperties properties) {
        return PinkCrystal(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },

      'leetcode': (TiledObjectProperties properties) {
        return LeetCodeBox(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'instagram': (TiledObjectProperties properties) {
        return InstagramBox(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'linkedin': (TiledObjectProperties properties) {
        return LinkedInBox(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'hackerrank': (TiledObjectProperties properties) {
        return HackerRankBox(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'github': (TiledObjectProperties properties) {
        return GithubBox(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
      'io': (TiledObjectProperties properties) {
        return IoBox(
          position: properties.position,
          project: ProjectModel.fromJson(properties.others),
        );
      },
    };
  }


}

