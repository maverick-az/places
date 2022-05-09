import 'package:flutter/material.dart';
import 'package:places/presets/colors/gradients.dart';
import 'package:places/presets/styles/app_sizes.dart';

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
        height: AppSizes.heightImageCard,
        decoration: const BoxDecoration(
          gradient: AppGradients.whiteImageGradient,
        ),
      ),
    );
  }
}
