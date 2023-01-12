import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/divider/divider_default.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Widget для подборп файлов
class FilePicker extends StatelessWidget {
  const FilePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingCommon,
        vertical: AppSizes.paddingCommon / 2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusNormal),
            child: ListView(
              shrinkWrap: true,
              clipBehavior: Clip.antiAlias,
              children: [
                ListTile(
                  title: _ListTileTitle(theme: theme, title: AppStrings.camera),
                  leading: IconSvg(
                    icon: AppIcons.iconCamera,
                    color: theme.colorScheme.secondaryContainer,
                  ),
                  minLeadingWidth: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: AppSizes.radiusNormal,
                      topRight: AppSizes.radiusNormal,
                    ),
                  ),
                  onTap: () {
                    log('Камера');
                  },
                ),
                const DividerDefault(
                  height: 0,
                  indent: AppSizes.paddingCommon,
                  endIndent: AppSizes.paddingCommon,
                ),
                ListTile(
                  title: _ListTileTitle(theme: theme, title: AppStrings.photo),
                  leading: IconSvg(
                    icon: AppIcons.iconPhoto,
                    color: theme.colorScheme.secondaryContainer,
                  ),
                  minLeadingWidth: 0,
                  onTap: () {
                    log('Фотография');
                  },
                ),
                const DividerDefault(
                  height: 0,
                  indent: AppSizes.paddingCommon,
                  endIndent: AppSizes.paddingCommon,
                ),
                ListTile(
                  title: _ListTileTitle(theme: theme, title: AppStrings.file),
                  leading: IconSvg(
                    icon: AppIcons.iconFail,
                    color: theme.colorScheme.secondaryContainer,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: AppSizes.radiusNormal,
                      bottomRight: AppSizes.radiusNormal,
                    ),
                  ),
                  minLeadingWidth: 0,
                  onTap: () {
                    log('Файл');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSizes.paddingCommon / 2,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusNormal),
              child: ListTile(
                title: Text(
                  AppStrings.cancel.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.button?.copyWith(
                    color: theme.colorScheme.tertiary,
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(AppSizes.radiusNormal),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showDialogBox(BuildContext context) {
    showDialog<FilePicker>(
      context: context,
      builder: (context) => const FilePicker(),
    );
  }
}

class _ListTileTitle extends StatelessWidget {
  final ThemeData theme;
  final String title;

  const _ListTileTitle({
    Key? key,
    required this.theme,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: theme.textTheme.headline6?.copyWith(
        color: theme.colorScheme.secondaryContainer,
      ),
    );
  }
}
