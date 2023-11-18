import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/dino_game.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warioddly Portfolio',
      home: GameWidget.controlled(
        gameFactory: () => DinoGame(
          viewportResolution: Vector2(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
            // context.numberProperty('viewport width', 500),
            // context.numberProperty('viewport height', 500),
          ),
        ),
      )
    );
  }
}
