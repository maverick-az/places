import 'package:flutter/material.dart';

/// Стандартный элемент списка
class ListTileStandard extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Widget? trailing;
  final Function()? onTap;

  const ListTileStandard({
    required this.title,
    this.titleColor,
    this.trailing,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      title: Text(
        title,
        style: theme.textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w400,
          color: titleColor ?? theme.primaryColorDark,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
