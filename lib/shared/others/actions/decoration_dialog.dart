import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warioddly/shared/decorations/crystal/crystal.dart';
import 'package:warioddly/shared/decorations/social_web_box/social_web_box.dart';
import 'package:warioddly/shared/others/models/portfolio_model.dart';
import 'package:warioddly/shared/others/utils/utils.dart';

class DecorationDialog {


  static void showCrystal(BonfireGameInterface gameRef, Crystal decoration, ProjectModel project, [VoidCallback? onClose]) async {
    _show(
      gameRef,
      decoration,
      [

        textWidget(
          project.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'VT323',
          ),
        ),
        
          Row(
            children: [
              Flexible(
                child: textWidget(project.description),
              ),
            ],
          ),

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
      onClose
    );
  }


  static void showSocialBox(BonfireGameInterface gameRef, SocialWebBox decoration, ProjectModel project, [VoidCallback? onClose]) async {
    _show(
        gameRef,
        decoration,
        [

          textWidget(
            project.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'VT323',
            ),
          ),

          Row(
            children: [
              Flexible(
                child: textWidget(project.description),
              ),
            ],
          ),

          const SizedBox(height: 10),

          TextButton(
              onPressed: () {
                launchUrl(Uri.parse(project.url));
              },
              child: textWidget('Open link')
          )

        ],
        onClose
    );
  }


  static void _show(BonfireGameInterface gameRef, GameDecoration decoration, List<Widget> children, [VoidCallback? onClose]) {
    double lastZoom = gameRef.camera.viewfinder.zoom;

    gameRef.camera.moveToTargetAnimated(
      effectController: EffectController(duration: 1),
      target: decoration,
      zoom: 2,
      onComplete: () async {

        await showDialog(
            context: gameRef.context,
            builder: (context) {
              return SimpleDialog(
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
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: Column(
                      children: children,
                    ),
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

      },
    );
  }

}
