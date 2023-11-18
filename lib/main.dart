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
      home: SafeArea(
        child: GameWidget.controlled(
          gameFactory: () => DinoGame(
            viewportResolution: Vector2(
              500, 500
              // context.numberProperty('viewport width', 500),
              // context.numberProperty('viewport height', 500),
            ),
          ),
        ),
      )
    );
  }
}
