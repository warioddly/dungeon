import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/game.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(GameWidget(
    game: AdventureGame(
      viewportResolution: Vector2(
        1500,
        1500,
        // context.numberProperty('viewport width', 500),
        // context.numberProperty('viewport height', 500),
      ),
    ),
  ));
}

