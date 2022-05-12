import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/colors/colors.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.inactiveBlack.withOpacity(0.56),
            blurRadius: 0.8,
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon:
                  currentIndex == 0 ? AppIcons.menuListFull : AppIcons.menuList,
              color: _iconColor(currentIndex == 0),
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon: currentIndex == 1 ? AppIcons.menuMapFull : AppIcons.menuMap,
              color: _iconColor(currentIndex == 1),
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon: currentIndex == 2
                  ? AppIcons.menuHeartFull
                  : AppIcons.menuHeart,
              color: _iconColor(currentIndex == 2),
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.appEmptyString,
            icon: IconSvg(
              icon: currentIndex == 3
                  ? AppIcons.menuSettingsFull
                  : AppIcons.menuSettings,
              color: _iconColor(currentIndex == 3),
            ),
          ),
        ],
      ),
    );
  }

  Color _iconColor(bool getMainColor) {
    return getMainColor ? AppColors.whiteMain : AppColors.secondary;
  }
}
