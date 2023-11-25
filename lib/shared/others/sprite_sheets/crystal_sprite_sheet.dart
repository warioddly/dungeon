import 'package:bonfire/bonfire.dart';

class CrystalSpriteSheet {

  static const String path = 'decorations/crystals';
  static final Vector2 size = Vector2(32, 32);

  static Future<Sprite> get darkRed => Sprite.load("$path/Dark_red_ crystal2.png");

  static Future<Sprite> get green => Sprite.load("$path/Green_crystal1.png");

  static Future<Sprite> get pink => Sprite.load("$path/Pink_crystal1.png");

  static Future<Sprite> get violet => Sprite.load("$path/Violet_crystal1.png");

  static Future<Sprite> get white => Sprite.load("$path/White_crystal1.png");

  static Future<Sprite> get yellowGreen => Sprite.load("$path/Yellow-green_crystal1.png");

  static Future<Sprite> get yellow => Sprite.load("$path/Yellow_crystal1.png");

  static Future<Sprite> get blue => Sprite.load("$path/Blue_crystal1.png");

  static Future<Sprite> get red => Sprite.load("$path/Red_crystal1.png");

}
