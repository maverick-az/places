import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/button_styles.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Темы для приложения
class AppThemes {
  /// светлая тема
  // ignore: long-method
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      backgroundColor: AppColors.background,
      primaryColor: AppColors.white,
      primaryColorLight: AppColors.background,
      primaryColorDark: AppColors.whiteMain,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.inactiveBlack,
        primary: AppColors.whiteMain,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondary2,
        tertiary: AppColors.whiteGreen,
        tertiaryContainer: AppColors.whiteYellow,
        error: AppColors.whiteRed,
      ),
      errorColor: AppColors.whiteRed,
      scaffoldBackgroundColor: AppColors.white,
      dividerColor: AppColors.inactiveBlack,
      disabledColor: AppColors.inactiveBlack,
      cardColor: AppColors.background,
      indicatorColor: AppColors.whiteMain,
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 24,
      ),
      textTheme: base.textTheme.copyWith(
        headline6: AppTextStyles.text.copyWith(color: AppColors.secondary),
        headline5: AppTextStyles.subtitle.copyWith(color: AppColors.whiteMain),
        headline4: AppTextStyles.title.copyWith(color: AppColors.secondary),
        headline3:
            AppTextStyles.largeTitle.copyWith(color: AppColors.secondary),
        subtitle1: AppTextStyles.smallBold.copyWith(color: AppColors.secondary),
        subtitle2: AppTextStyles.small.copyWith(color: AppColors.secondary2),
        bodyText1: AppTextStyles.text.copyWith(color: AppColors.secondary),
        bodyText2: AppTextStyles.small.copyWith(color: AppColors.secondary),
        caption: AppTextStyles.superSmall.copyWith(color: AppColors.secondary),
        button: AppTextStyles.button,
        overline:
            AppTextStyles.overline.copyWith(color: AppColors.inactiveBlack),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelStyle: AppTextStyles.smallBold,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.inactiveBlack,
        indicator: const BoxDecoration(
          color: AppColors.whiteMain,
          borderRadius: BorderRadius.all(
            AppSizes.radiusBtnSwitch,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingTextFieldHorizontal,
          vertical: AppSizes.paddingTextFieldVertical,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.whiteGreen.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.whiteGreen.withOpacity(0.4),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.whiteRed.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.whiteRed.withOpacity(0.4),
            width: 2,
          ),
        ),
        hintStyle: AppTextStyles.text.copyWith(
          color: AppColors.inactiveBlack,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        elevation: 0,
        backgroundColor: AppColors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.whiteMain,
        unselectedItemColor: AppColors.secondary,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppButtonStyle.elevatedButton.copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.background;
              }

              return AppColors.whiteGreen;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.inactiveBlack;
              }

              return AppColors.white;
            },
          ),
        ),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        activeTrackColor: AppColors.whiteGreen,
        inactiveTrackColor: AppColors.inactiveBlack,
        thumbColor: AppColors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
        ),
        trackShape: const RectangularSliderTrackShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
          elevation: 4,
        ),
        rangeTrackShape: const RectangularRangeSliderTrackShape(),
      ),
    );
  }

  /// темная тема
  // ignore: long-method
  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      backgroundColor: AppColors.blackDark,
      primaryColor: AppColors.blackMain,
      primaryColorLight: AppColors.background,
      primaryColorDark: AppColors.white,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.inactiveBlack,
        primary: AppColors.blackMain,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondary2,
        tertiary: AppColors.blackGreen,
        tertiaryContainer: AppColors.blackYellow,
        error: AppColors.blackRed,
      ),
      errorColor: AppColors.blackRed,
      scaffoldBackgroundColor: AppColors.blackMain,
      dividerColor: AppColors.secondary2,
      disabledColor: AppColors.inactiveBlack,
      cardColor: AppColors.blackDark,
      indicatorColor: AppColors.white,
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 24,
      ),
      textTheme: base.textTheme.copyWith(
        headline6: AppTextStyles.text.copyWith(color: AppColors.white),
        headline5: AppTextStyles.subtitle.copyWith(color: AppColors.white),
        headline4: AppTextStyles.title.copyWith(color: AppColors.white),
        headline3: AppTextStyles.largeTitle.copyWith(color: AppColors.white),
        subtitle1:
            AppTextStyles.smallBold.copyWith(color: AppColors.secondary2),
        subtitle2: AppTextStyles.small.copyWith(color: AppColors.secondary2),
        bodyText1: AppTextStyles.text.copyWith(color: AppColors.white),
        bodyText2: AppTextStyles.small.copyWith(color: AppColors.white),
        caption: AppTextStyles.superSmall,
        button: AppTextStyles.button,
        overline:
            AppTextStyles.overline.copyWith(color: AppColors.inactiveBlack),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelStyle: AppTextStyles.smallBold,
        labelColor: AppColors.secondary,
        unselectedLabelColor: AppColors.secondary2,
        indicator: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            AppSizes.radiusBtnSwitch,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingTextFieldHorizontal,
          vertical: AppSizes.paddingTextFieldVertical,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.blackGreen.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.blackGreen.withOpacity(0.4),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.blackRed.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(AppSizes.radiusTextField),
          borderSide: BorderSide(
            color: AppColors.blackRed.withOpacity(0.4),
            width: 2,
          ),
        ),
        hintStyle: AppTextStyles.text.copyWith(
          color: AppColors.inactiveBlack,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        elevation: 0,
        backgroundColor: AppColors.blackMain,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppButtonStyle.elevatedButton.copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.blackDark;
              }

              return AppColors.blackGreen;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.inactiveBlack;
              }

              return AppColors.white;
            },
          ),
        ),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        activeTrackColor: AppColors.blackGreen,
        inactiveTrackColor: AppColors.inactiveBlack,
        thumbColor: AppColors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
        ),
        trackShape: const RectangularSliderTrackShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
          elevation: 4,
        ),
        rangeTrackShape: const RectangularRangeSliderTrackShape(),
      ),
    );
  }

  AppThemes._();
}
