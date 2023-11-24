import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warioddly/shared/others/sprite_sheets/ghost_sprite_sheet.dart';
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
              person: SizedBox(
                width: 100,
                height: 100,
                child: WizardSpriteSheet.idleRight.asWidget(),
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


  static void execShowTalk(BonfireGameInterface gameRef, [List<Say> sayList = const []]) {
    TalkDialog.show(
      gameRef.context,
      sayList,
      logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
        LogicalKeyboardKey.enter
      ],
    );
  }


  static void greetPlayer(BonfireGameInterface gameRef) {
    execShowTalk(
      gameRef,
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
                text: ' Welcome to my Portfolio.'
            )
          ],
          person: SizedBox(
            width: 100,
            height: 100,
            child: WizardSpriteSheet.idleRight.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              text: "I'm ",
            ),
            const TextSpan(
              text: "IMØ",
              style: TextStyle(
                color: Colors.red,
              )
            ),
            const TextSpan(
              text: ", and I'm passionate about web/mobile development. Here, you'll find a collection of my work and projects that showcase my skills and creativity.",
            ),
          ],
          person: SizedBox(
            width: 100,
            height: 100,
            child: WizardSpriteSheet.idleRight.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              text: "Feel free to explore and get to know more about my journey. If you have any questions or if there's something specific you're looking for, don't hesitate to reach out.",
            ),
          ],
          person: SizedBox(
            width: 100,
            height: 100,
            child: WizardSpriteSheet.idleRight.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              text: "Thanks for stopping by, and",
            ),
            const TextSpan(
              text: " I hope you enjoy your visit!",
              style: TextStyle(
                color: Colors.red
              )
            ),
          ],
          person: SizedBox(
            width: 100,
            height: 100,
            child: WizardSpriteSheet.idleRight.asWidget(),
          ),
        ),
      ],
    );
  }


}
