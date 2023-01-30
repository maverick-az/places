import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_top_navigation.dart';
import 'package:places/ui/widgets/tab_bar/tab_bar_standard.dart';

/// AppBar для экранов списка
class AppBarStandard extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> tabsTitles;
  final bool showNavigationButton;
  final Widget? leading;
  final List<Widget> actions;
  final Widget? bottomWidget;
  final double bottomWidgetHeight;
  final bool centerTitle;
  final double titleSpacing;

  @override
  Size get preferredSize => Size.fromHeight(_appBarHeight);

  double get _appBarHeight {
    return AppSizes.heightAppBar + _bottomPreferredSize;
  }

  double get _bottomPreferredSize {
    var finalPreferredSize = tabsTitles.isNotEmpty
        ? AppSizes.heightTabBarStandard + _bottomDividerSize
        : _bottomDividerSize;
    finalPreferredSize += bottomWidget != null ? bottomWidgetHeight : 0;

    return finalPreferredSize;
  }

  double get _bottomDividerSize {
    var bottomDividerSize = 0.0;
    if (bottomWidget == null) {
      bottomDividerSize += tabsTitles.isNotEmpty
          ? AppSizes.paddingCommon
          : AppSizes.paddingCommon + AppSizes.paddingCommon / 2;
    }

    return bottomDividerSize;
  }

  const AppBarStandard({
    required this.title,
    this.showNavigationButton = false,
    this.tabsTitles = const [],
    this.leading,
    this.actions = const [],
    this.bottomWidget,
    this.bottomWidgetHeight = 0,
    this.centerTitle = true,
    this.titleSpacing = AppSizes.paddingCommon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leadingWidget =
        showNavigationButton ? const ButtonTopNavigation() : leading;

    return AppBar(
      toolbarHeight: AppSizes.heightAppBar,
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: titleSpacing,
      centerTitle: centerTitle,
      leading: leadingWidget,
      leadingWidth: showNavigationButton
          ? AppSizes.sizeBtnTopNavigation.width + AppSizes.paddingCommon * 2
          : null,
      automaticallyImplyLeading: leadingWidget != null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: actions,
      bottom: PreferredSize(
        child: Wrap(
          children: [
            if (tabsTitles.isNotEmpty)
              TabBarStandard(
                tabsTitles: tabsTitles,
              ),
            if (bottomWidget != null) bottomWidget!,
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
