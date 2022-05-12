import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Стандартая кнопка приложения
class ButtonSmallWithStatus extends StatelessWidget {
  final String text;
  final String? icon;
  final bool disabled;

  const ButtonSmallWithStatus({
    required this.text,
    this.disabled = false,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // цвет в зависимости от статуса
    final colorByStatus =
        disabled ? AppColors.inactiveBlack : AppColors.secondary;

    // иконка кнопки
    IconSvg? iconSvg;
    if (icon != null) {
      iconSvg = IconSvg(
        icon: icon!,
        color: colorByStatus,
      );
    }

    return Container(
      padding: const EdgeInsets.all(
        AppSizes.paddingBtnSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconSvg != null) iconSvg,
          if (iconSvg != null)
            const SizedBox(
              width: AppSizes.paddingSpaceBetweenIconAndText,
            ),
          Text(
            text,
            style: AppTextStyles.small.copyWith(
              color: colorByStatus,
            ),
          ),
        ],
      ),
    );
  }
}
