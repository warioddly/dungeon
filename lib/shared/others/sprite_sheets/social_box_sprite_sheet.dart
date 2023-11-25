import 'package:bonfire/bonfire.dart';

class SocialBoxSpriteSheet {

  static const String path = 'decorations/brands';
  static final Vector2 size = Vector2(32, 32);

  static Future<Sprite> get github => Sprite.load("$path/github.png");

  static Future<Sprite> get instagram => Sprite.load("$path/instagram.png");

  static Future<Sprite> get linkedin => Sprite.load("$path/linkedin.png");

  static Future<Sprite> get io => Sprite.load("$path/io.png");

  static Future<Sprite> get leetcode => Sprite.load("$path/leetcode.png");

  static Future<Sprite> get hackerrank => Sprite.load("$path/hackerrank.png");

}
