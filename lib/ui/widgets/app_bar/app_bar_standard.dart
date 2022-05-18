import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/tab_bar/tab_bar_standard.dart';

/// AppBar для экранов списка
class AppBarStandard extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> tabsTitles;

  @override
  Size get preferredSize => Size.fromHeight(_appBarHeight);

  double get _appBarHeight {
    return AppSizes.heightAppBar + _bottomPreferredSize;
  }

  double get _bottomPreferredSize {
    final finalPreferredSize = tabsTitles.isNotEmpty
        ? AppSizes.heightTabBarStandard + _bottomDividerSize
        : _bottomDividerSize;

    return finalPreferredSize;
  }

  double get _bottomDividerSize {
    final bottomDividerSize = tabsTitles.isNotEmpty
        ? AppSizes.paddingCommon
        : AppSizes.paddingCommon + AppSizes.paddingCommon / 2;

    return bottomDividerSize;
  }

  const AppBarStandard({
    required this.title,
    this.tabsTitles = const [],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSizes.heightAppBar,
      titleSpacing: AppSizes.paddingCommon,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      bottom: PreferredSize(
        child: Column(
          children: [
            if (tabsTitles.isNotEmpty)
              TabBarStandard(
                tabsTitles: tabsTitles,
              ),
            SizedBox(
              height: _bottomDividerSize,
            ),
          ],
        ),
        preferredSize: Size.fromHeight(_bottomPreferredSize),
      ),
    );
  }
}
