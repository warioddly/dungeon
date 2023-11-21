

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:warioddly/decorations/items/light/light.dart';


class LightConfig {

  LightConfig({
    this.color = const Color(0xFFFFFFFF),
    this.gradient,
    this.type = LightType.radial,
    this.pulseSpeed = 1.0,
    this.maxPulseRadius = 350.0,
    this.radius = 320.0,
    this.numberOfRays = 100,
  });


  final Color color;

  final double maxPulseRadius;

  final double radius;

  final int numberOfRays;

  final Gradient? gradient;

  final LightType type;

  double pulseSpeed;


  copyWith({
    Color? color,
    Gradient? gradient,
    double? pulseSpeed,
    double? maxPulseRadius,
    double? minPulseRadius,
    double? radius,
    LightType? type,
    int? numberOfRays,
  }) {
    return LightConfig(
      color: color ?? this.color,
      gradient: gradient ?? this.gradient,
      pulseSpeed: pulseSpeed ?? this.pulseSpeed,
      type: type ?? this.type,
      maxPulseRadius: maxPulseRadius ?? this.maxPulseRadius,
      radius: radius ?? this.radius,
      numberOfRays: numberOfRays ?? this.numberOfRays,
    );
  }


}