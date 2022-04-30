import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Стандартая кнопка приложения
class ButtonNormal extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Widget? icon;

  const ButtonNormal({
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppSizes.paddingBtnNormal,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteGreen,
        borderRadius: const BorderRadius.all(
          AppSizes.radiusBtnNormal,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            const SizedBox(
              width: AppSizes.paddingSpaceBetweenIconAndText,
            ),
          Text(
            text,
            style: AppTextStyles.button.copyWith(
              color: textColor ?? AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
