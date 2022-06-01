import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';

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
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.all(
            AppSizes.radiusBtnSwitch,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: TabBar(
            tabs: tabsTitles
                .map(
                  (title) => Tab(
                    text: title,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
