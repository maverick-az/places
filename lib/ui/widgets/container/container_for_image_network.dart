import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';

/// Контайнер для просмотра изображения по url
class ContainerForImageNetwork extends StatelessWidget {
  final String url;
  final double height;

  const ContainerForImageNetwork({
    required this.url,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return CircularProgressIndicator(
            color: AppColors.inactiveBlack.withOpacity(1),
            backgroundColor: AppColors.background,
            strokeWidth: 6,
          );
        },
      ),
    );
  }
}
