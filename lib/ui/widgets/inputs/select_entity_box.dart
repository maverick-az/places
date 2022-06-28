import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';

/// Выбор сущности
class SelectEntityBox extends StatelessWidget {
  final String? label;

  const SelectEntityBox({
    this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Text(
            label!.toUpperCase(),
            style: theme.textTheme.overline,
          ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            AppStrings.hintNotSelected,
            style: theme.textTheme.bodyText1?.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
          trailing: ButtonIconSvg(
            icon: AppIcons.iconView,
            color: theme.colorScheme.primary,
            action: () {},
          ),
        ),
      ],
    );
  }
}
