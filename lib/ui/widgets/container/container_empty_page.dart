import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Контайнер для пустых страниц
class ContainerEmptyPage extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const ContainerEmptyPage({
    required this.icon,
    required this.title,
    required this.description,
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
            color: AppColors.inactiveBlack,
            height: AppSizes.sizeIconEmptyPage.height,
            width: AppSizes.sizeIconEmptyPage.width,
          ),
          const SizedBox(
            height: AppSizes.paddingCommon * 2,
          ),
          Text(
            title,
            style: AppTextStyles.subtitle.copyWith(
              color: AppColors.inactiveBlack,
            ),
          ),
          const SizedBox(
            height: AppSizes.paddingCommon / 2,
          ),
          Text(
            description,
            style: AppTextStyles.small.copyWith(
              color: AppColors.inactiveBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
