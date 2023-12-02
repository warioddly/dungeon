import 'package:bonfire/bonfire.dart';

class StatueSpriteSheet {

  static const String path = 'decorations/statues';
  static final Vector2 size = Vector2(130, 130);

  static Future<Sprite> get foxGrass => Sprite.load("$path/Rock_statue_fox_grass_shadow.png");

  static Future<Sprite> get headGrass => Sprite.load("$path/Rock_statue_head_grass_shadow.png");

  static Future<Sprite> get motherGrass => Sprite.load("$path/Rock_statue_mother_grass_shadow.png");

  static Future<Sprite> get oldManGrass => Sprite.load("$path/Rock_statue_old_man_grass_shadow.png");

  static Future<Sprite> get pyramidGrass => Sprite.load("$path/Stone_pyramid1_grass_shadow.png");

}
