import 'package:flutter/material.dart';
import 'package:places/presets/colors/gradients.dart';

/// Контейнер для наложение поверх изображения с градиентом и прозрачностию
class ContainerWithOpacityForImages extends StatelessWidget {
  final double opacity;

  const ContainerWithOpacityForImages({this.opacity = 0.4, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.whiteImageGradient,
        ),
      ),
    );
  }
}
