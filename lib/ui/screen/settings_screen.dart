import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/providers/theme_provider.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
import 'package:places/ui/widgets/divider/divider_default.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';
import 'package:places/ui/widgets/navigation_bar/bottom_navigation_view.dart';
import 'package:provider/provider.dart';

/// Экран настройки приложения
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconPaddingSize = IconPaddingSize.small;

    return Scaffold(
      appBar: const AppBarStandard(
        title: AppStrings.srcTitleSettingsScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.paddingCommon,
          right: AppSizes.paddingCommon,
          bottom: AppSizes.paddingCommon,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.paddingDetailContentDivider / 2,
              ),
              child: _SettingThemeMode(),
            ),
            const DividerDefault(height: 1),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical:
                    AppSizes.paddingListTileVertical - iconPaddingSize.size,
              ),
              child: const _SettingWatchTutorial(
                iconPaddingSize: iconPaddingSize,
              ),
            ),
            const DividerDefault(height: 1),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationView(
        currentIndex: 3,
      ),
    );
  }
}

class _SettingWatchTutorial extends StatelessWidget {
  final IconPaddingSize iconPaddingSize;

  const _SettingWatchTutorial({
    required this.iconPaddingSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.watchTutorial,
          style: theme.textTheme.bodyText1?.copyWith(
            color: theme.primaryColorDark,
          ),
        ),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.all(iconPaddingSize.size),
          constraints: const BoxConstraints(),
          icon: IconSvg(
            icon: AppIcons.iconInfo,
            color: theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}

class _SettingThemeMode extends StatelessWidget {
  const _SettingThemeMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = context.read<ThemeProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.darkTheme,
          style: theme.textTheme.bodyText1?.copyWith(
            color: theme.primaryColorDark,
          ),
        ),
        CupertinoSwitch(
          value: themeProvider.isDarkTheme,
          onChanged: (newValue) {
            themeProvider.changeThemeMode(isDarkTheme: newValue);
          },
          activeColor: theme.colorScheme.tertiary,
          trackColor: theme.colorScheme.background,
        ),
      ],
    );
  }
}
