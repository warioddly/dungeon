import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/decorations/crystal/crystal.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/others/sprite_sheets/crystal_sprite_sheet.dart';
import 'package:flutter/material.dart';

class VioletCrystal extends Crystal {

  VioletCrystal({
    required Vector2 position,
    ProjectModel? project,
  }) : super(
    project: project,
    position: position,
    sprite: CrystalSpriteSheet.violet,
    color: Colors.pinkAccent.withOpacity(0.4),
  );

}
