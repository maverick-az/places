import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';

/// Кнопка в избранное
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 18,
      color: AppColors.background,
    );
  }
}
