import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/game.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warioddly Portfolio',
      home: Container(),
    );
  }
}
