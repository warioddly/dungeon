import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/shared/others/sprite_sheets/wizard_sprite_sheet.dart';

class PlayerDialog {

  static void execShowTalkWithNpc(
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
              person: WizardSpriteSheet.spriteSheetAsWidget
            ),

          ],
          onClose: onClose,
          onFinish: () {
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


  static void execShowTalk(
      BonfireGameInterface gameRef,
      VoidCallback? onClose,
      [List<Say> sayList = const []]
  ) {
    TalkDialog.show(
      gameRef.context,
      sayList,
      speed: 35,
      logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
        LogicalKeyboardKey.enter
      ],
    );
  }


  static void greetPlayer(
      BonfireGameInterface gameRef,
      VoidCallback? onClose
  ) {
    execShowTalk(
      gameRef,
      onClose,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Hi there '
            ),
            const TextSpan(
              text: 'Adventurer!',
              style: TextStyle(
                color: Colors.red
              )
            ),
            const TextSpan(
                text: ' My name is '
            ),
            const TextSpan(
              text: 'IMØ',
              style: TextStyle(
                color: Colors.red
              )
            ),
            const TextSpan(
              text: ' and I am passionate about web/mobile magic spells.'
            )
          ],
          person: WizardSpriteSheet.spriteSheetAsWidget
        ),

        Say(
          text: [
            const TextSpan(
              text: "I lost my ",
            ),
            const TextSpan(
              text: "magic crystals",
              style: TextStyle(
                  color: Colors.red
              )
            ),
            const TextSpan(
              text: " in this dungeon, can you help me find them?",
            ),
          ],
          person: WizardSpriteSheet.spriteSheetAsWidget
        ),

      ],
    );
  }


}
