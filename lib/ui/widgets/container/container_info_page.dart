import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Контайнер для пустых страниц
class ContainerInfoPage extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Color iconColor;
  final double? iconSize;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const ContainerInfoPage({
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor = AppColors.inactiveBlack,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: iconColor,
            height: iconSize ?? AppSizes.sizeIconEmptyPage.height,
            width: iconSize ?? AppSizes.sizeIconEmptyPage.width,
          ),
          const SizedBox(
            height: AppSizes.paddingCommon * 2,
          ),
          Text(
            title,
            style: titleStyle ??
                AppTextStyles.subtitle.copyWith(
                  color: AppColors.inactiveBlack,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSizes.paddingCommon / 2,
          ),
          Text(
            description,
            style: descriptionStyle ??
                AppTextStyles.small.copyWith(
                  color: AppColors.inactiveBlack,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
