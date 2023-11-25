import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/decorations/crystal/crystal.dart';
import 'package:warioddly/shared/decorations/social_web_box/social_web_box.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/others/sprite_sheets/crystal_sprite_sheet.dart';
import 'package:flutter/material.dart';
import 'package:warioddly/shared/others/sprite_sheets/social_box_sprite_sheet.dart';

class GithubBox extends SocialWebBox {

  GithubBox({
    required Vector2 position,
    ProjectModel? project,
  }) : super(
    project: project,
    position: position,
    sprite: SocialBoxSpriteSheet.github,
    color: Colors.black.withOpacity(0.4),
  );

}
