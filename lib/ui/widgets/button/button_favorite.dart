import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Кнопка в избранное
class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.sizeBtnFavorite.width,
      height: AppSizes.sizeBtnFavorite.height,
      color: AppColors.background,
    );
  }
}
