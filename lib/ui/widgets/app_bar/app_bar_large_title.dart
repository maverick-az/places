import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/text/text_large_title.dart';

/// AppBar для экрана списка
class AppBarLargeTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? bottomWidget;
  final double bottomWidgetHeight;
  final EdgeInsets? titlePadding;

  @override
  Size get preferredSize =>
      Size.fromHeight(AppSizes.heightAppBarLargeTitle + bottomWidgetHeight);

  const AppBarLargeTitle({
    required this.title,
    this.bottomWidget,
    this.bottomWidgetHeight = 0,
    this.titlePadding = const EdgeInsets.fromLTRB(
      AppSizes.paddingCommon,
      AppSizes.paddingAppBarLargeTitle,
      AppSizes.paddingCommon,
      AppSizes.paddingCommon,
    ),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSizes.heightAppBarLargeTitle,
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Container(
        width: double.infinity,
        padding: titlePadding,
        child: TextLargeTitle(_formatedTitle()),
      ),
      bottom: bottomWidget != null
          ? PreferredSize(
              child: bottomWidget!,
              preferredSize: Size.fromHeight(bottomWidgetHeight),
            )
          : null,
    );
  }

  String _formatedTitle() {
    final splitedTitle = title.split(' ');
    var formatedTitle = title;

    if (splitedTitle.length > 1) {
      formatedTitle =
          '${splitedTitle.first}\n${splitedTitle.sublist(1).join(' ')}';
    }

    return formatedTitle;
  }
}
