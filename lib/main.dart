
import 'package:flutter/material.dart';
import 'package:warioddly/game.dart';


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
    return const MaterialApp(
      title: 'Warioddly',
      home: GameManualMap(),
    );
  }

}
