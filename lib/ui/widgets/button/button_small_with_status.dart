import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';
import 'package:places/ui/widgets/icon/icon_blueprint.dart';

/// Стандартая кнопка приложения
class ButtonSmallWithStatus extends StatelessWidget {
  final String text;
  final Widget? icon;
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

    return Container(
      padding: const EdgeInsets.all(
        AppSizes.paddingBtnSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBlueprint(
            color: colorByStatus,
          ),
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
