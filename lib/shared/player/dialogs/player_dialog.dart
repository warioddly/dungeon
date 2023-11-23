import 'package:bonfire/bonfire.dart';
import 'package:warioddly/shared/others/sprite_sheets/enemy_sprite_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/shared/others/sprite_sheets/ghost_sprite_sheet.dart';
import 'package:warioddly/shared/others/sprite_sheets/player_sprite_sheet.dart';

class PlayerDialog {
  static void execShowTalk(
    BonfireGameInterface gameRef,
    GameComponent first,
    VoidCallback onClose,
  ) {
    gameRef.camera.moveToTargetAnimated(
      effectController: EffectController(duration: 1),
      target: first,
      zoom: 2,
      onComplete: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text: 'Look at this! It seems that',
                ),
                const TextSpan(
                  text: ' I\'m not alone ',
                  style: TextStyle(color: Colors.red),
                ),
                const TextSpan(
                  text: 'here...',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: 'Lok Tar Ogr!',
                ),
                const TextSpan(
                  text: ' Lok Tar Ogr! ',
                  style: TextStyle(color: Colors.green),
                ),
                const TextSpan(
                  text: ' Lok Tar Ogr! ',
                ),
                const TextSpan(
                  text: 'Lok Tar Ogr!',
                  style: TextStyle(color: Colors.green),
                ),
              ],
              person: SizedBox(
                width: 250,
                height: 250,
                child: GhostSpriteSheet.idle.asWidget(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
          ],
          onClose: onClose,
          onFinish: () {
            // ignore: avoid_print
            print('finish talk');
          },
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }
}
