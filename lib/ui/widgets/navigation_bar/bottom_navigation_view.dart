import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/routers/routes.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Нижняя панель навигации
class BottomNavigationView extends StatelessWidget {
  final int currentIndex;

  const BottomNavigationView({
    this.currentIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navBarTheme = theme.bottomNavigationBarTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.dividerColor.withOpacity(0.56),
            blurRadius: 0.8,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          _onTap(context, index);
        },
        items: [
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon:
                  currentIndex == 0 ? AppIcons.menuListFull : AppIcons.menuList,
              color: _iconColor(currentIndex == 0, navBarTheme),
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon: currentIndex == 1 ? AppIcons.menuMapFull : AppIcons.menuMap,
              color: _iconColor(currentIndex == 1, navBarTheme),
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon: currentIndex == 2
                  ? AppIcons.menuHeartFull
                  : AppIcons.menuHeart,
              color: _iconColor(currentIndex == 2, navBarTheme),
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon: currentIndex == 3
                  ? AppIcons.menuSettingsFull
                  : AppIcons.menuSettings,
              color: _iconColor(currentIndex == 3, navBarTheme),
            ),
          ),
        ],
      ),
    );
  }

  Color _iconColor(bool getMainColor, BottomNavigationBarThemeData theme) {
    return getMainColor ? theme.selectedItemColor! : theme.unselectedItemColor!;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed(AppRoutes.main);
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed(AppRoutes.map);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(AppRoutes.visiting);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(AppRoutes.settings);
        break;
      default:
        throw UnimplementedError();
    }
  }
}
