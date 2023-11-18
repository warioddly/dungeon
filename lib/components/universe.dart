
import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';


class Universe extends Component {

  static const double size = 1000;
  static const Rect _bounds = Rect.fromLTRB(-size, -size, size, size);
  static final Rectangle bounds = Rectangle.fromLTRB(-size, -size, size, size);

  static final Paint _paintBorder = Paint()
    ..color = Colors.white12
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  static final Paint _paintBg = Paint()..color = const Color(0xFF333333);

  static final _rng = Random();

  late final List<Rect> _rectPool;

  Universe() : super(priority: 0) {
    // _paintPool = List<Paint>.generate(
    //   (size / 50).ceil(),
    //       (_) => PaintExtension.random(rng: _rng)
    //         ..style = PaintingStyle.stroke
    //         ..strokeWidth = 2,
    //   growable: false,
    // );
    _rectPool = List<Rect>.generate(
      (size / 50).ceil(),
          (i) => Rect.fromCircle(center: Offset.zero, radius: size - i * 50),
      growable: false,
    );
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(_bounds, _paintBg);
    canvas.drawRect(_bounds, _paintBorder);
    // for (var i = 0; i < (size / 50).ceil(); i++) {
    //   canvas.drawRect(_rectPool[i], _paintBorder);
    // }
  }

  static Vector2 generateCoordinates() {
    return Vector2.random()
      ..scale(2 * size)
      ..sub(Vector2.all(size));
  }
}
