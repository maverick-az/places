import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/text/text_large_title.dart';

/// AppBar для экранов списка
class AppBarLargeTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppSizes.heightAppBarLargeTitle);

  const AppBarLargeTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: AppSizes.heightAppBarLargeTitle,
      elevation: 0,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.fromLTRB(
          AppSizes.paddingCommon,
          AppSizes.paddingAppBarLargeTitle,
          AppSizes.paddingCommon,
          AppSizes.paddingCommon,
        ),
        alignment: Alignment.bottomLeft,
        child: TextLargeTitle(_formatedTitle()),
      ),
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
