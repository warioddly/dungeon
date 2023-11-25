import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warioddly/shared/decorations/crystal/crystal.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/others/utils/utils.dart';

class CrystalDialog {

  static void show(BonfireGameInterface gameRef, Crystal crystal, ProjectModel project, [VoidCallback? onClose]) async {

    double lastZoom = gameRef.camera.viewfinder.zoom;

    gameRef.camera.moveToTargetAnimated(
      effectController: EffectController(duration: 1),
      target: crystal,
      zoom: 2,
      onComplete: () async {

        await showDialog(
          context: gameRef.context,
          builder: (context) {
            return SimpleDialog(
              title: textWidget(
                project.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'VT323',
                ),
              ),
              contentPadding: const EdgeInsets.all(24),
              backgroundColor: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              children: [

                textWidget(project.description),

                if (project.git != null) ...[
                  const SizedBox(height: 10),

                  TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(project.git!));
                      },
                      child: textWidget('View on github')
                  ),
                ],

                const SizedBox(height: 10),

                TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(project.url));
                    },
                    child: textWidget('View Project')
                )

              ],
            );
          }
        );

        gameRef.camera.moveToPlayerAnimated(
          effectController: EffectController(duration: 1),
          zoom: lastZoom,
          onComplete: () {
            onClose?.call();
          }
        );

        // TalkDialog.show(
        //   gameRef.context,
        //   [
        //     Say (
        //       text: [
        //         const TextSpan(
        //           text: 'Look at this! It seems that',
        //         ),
        //         const TextSpan(
        //           text: ' I\'m not alone ',
        //           style: TextStyle(color: Colors.red),
        //         ),
        //         const TextSpan(
        //           text: 'here...',
        //         ),
        //       ],
        //     ),
        //   ],
        //   onClose: () {
        //
        //     gameRef.camera.moveToPlayerAnimated(
        //       effectController: EffectController(duration: 1),
        //       zoom: lastZoom,
        //     );
        //
        //     onClose?.call();
        //
        //   },
        //   onFinish: () {
        //     // ignore: avoid_print
        //     print('finish talk');
        //   },
        //   logicalKeyboardKeysToNext: [
        //     LogicalKeyboardKey.space,
        //     LogicalKeyboardKey.enter
        //   ],
        // );
      },
    );
  }


}
