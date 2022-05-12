import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Стандартный TabBar
class TabBarStandard extends StatelessWidget {
  final List<String> tabsTitles;

  const TabBarStandard({
    required this.tabsTitles,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingCommon,
        vertical: AppSizes.paddingTabVertical,
      ),
      child: Container(
        height: AppSizes.heightTabStandard,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.all(
            AppSizes.radiusBtnSwitch,
          ),
        ),
        child: TabBar(
          labelStyle: AppTextStyles.smallBold,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.inactiveBlack,
          indicator: const BoxDecoration(
            color: AppColors.whiteMain,
            borderRadius: BorderRadius.all(
              AppSizes.radiusBtnSwitch,
            ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabsTitles
              .map(
                (title) => Tab(
                  text: title,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
