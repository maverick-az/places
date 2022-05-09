import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/ui/widgets/container/container_with_opacity_for_images.dart';

/// Контайнер для просмотра изображения по url
///
/// [withGradient] - наложение поверх изображения контайнер с градиентом и прозрачностью
class ContainerForImageNetwork extends StatelessWidget {
  final String url;
  final double height;
  final bool withGradient;

  const ContainerForImageNetwork({
    required this.url,
    required this.height,
    this.withGradient = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return SizedBox.square(
                  dimension: 40,
                  child: Align(
                    child: CircularProgressIndicator(
                      color: AppColors.inactiveBlack.withOpacity(1),
                      backgroundColor: AppColors.background,
                      strokeWidth: 6,
                    ),
                  ),
                );
              },
            ),
          ),
          if (withGradient) const ContainerWithOpacityForImages(),
        ],
      ),
    );
  }
}
