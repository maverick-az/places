import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';

/// Кнопка в избранное
class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ButtonIconSvg(
      icon: AppIcons.menuHeart,
    );
  }
}
