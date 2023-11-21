

import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:warioddly/decorations/items/light/light.dart';
import 'package:warioddly/decorations/items/light/radial_light.dart';
import 'package:warioddly/decorations/items/light/torch_light.dart';
import 'package:warioddly/utils/configs/light.dart';

mixin HasCharacterLighting<T extends FlameGame> on HasCollisionDetection {

  final Map<PositionComponent, Light> _components = { };


  void addLight(PositionComponent component, [LightConfig? config]) {

    LightType type = config?.type ?? LightType.radial;

    Light light = switch (type) {
      // LightType.angle => null,
      LightType.torch => Torchlight(collisionDetection: collisionDetection, config: config, component: component),
      _ => RadialLight(collisionDetection: collisionDetection, config: config, component: component),
    };

    _components[component] = light;

  }


  void removeLight(PositionComponent component) {
    _components.remove(component);
  }


  @override
  void update(double dt) {
    super.update(dt);
    _components.forEach((character, light) => light.update(dt));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _components.forEach((character, light) => light.render(canvas));
  }

}
