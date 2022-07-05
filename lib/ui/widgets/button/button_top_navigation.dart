import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Кнопка навигатора из AppBar
class ButtonTopNavigation extends StatelessWidget {
  const ButtonTopNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () => Navigator.pop(context),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tight(AppSizes.sizeBtnTopNavigation),
      icon: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: const BorderRadius.all(
            AppSizes.radiusBtnTopNavigation,
          ),
        ),
        child: IconSvg(
          icon: AppIcons.iconArrow,
          color: theme.primaryColorDark,
        ),
      ),
    );
  }
}
