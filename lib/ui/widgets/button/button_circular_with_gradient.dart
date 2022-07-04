import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Стандартая кнопка приложения
class ButtonCircularWithGradient extends StatelessWidget {
  final String text;
  final Color? foregroundColor;
  final Gradient? backgroundGradient;
  final Function()? action;
  final MainAxisSize mainAxisSize;
  final String? icon;

  const ButtonCircularWithGradient({
    required this.text,
    this.foregroundColor,
    this.backgroundGradient,
    this.icon,
    this.action,
    this.mainAxisSize = MainAxisSize.min,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = theme.elevatedButtonTheme.style;
    final materialState =
        action == null ? MaterialState.disabled : MaterialState.selected;
    final textIconColor = foregroundColor ??
        buttonStyle?.foregroundColor?.resolve({materialState});

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: _gradient(context),
        borderRadius: const BorderRadius.all(AppSizes.radiusBtn),
      ),
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        style: buttonStyle?.copyWith(
          padding: _paddingButton(),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppSizes.radiusBtn),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
        ),
        onPressed: action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: [
            if (icon != null)
              IconSvg(
                icon: icon!,
                color: textIconColor,
              ),
            if (icon != null)
              const SizedBox(
                width: AppSizes.paddingSpaceBetweenIconAndText,
              ),
            Text(
              text,
              style: theme.textTheme.button?.copyWith(
                color: textIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  MaterialStateProperty<EdgeInsetsGeometry?>? _paddingButton() {
    final verticalPadding = icon != null
        ? AppSizes.paddingBtnNormalWithIcon
        : AppSizes.paddingBtnNormal;

    return MaterialStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: AppSizes.paddingBtnNormalHorizontal,
        vertical: verticalPadding,
      ),
    );
  }

  Gradient _gradient(BuildContext context) {
    if (backgroundGradient != null) {
      return backgroundGradient!;
    }
    final colorScheme = Theme.of(context).colorScheme;

    return LinearGradient(
      colors: [colorScheme.tertiaryContainer, colorScheme.tertiary],
      begin: const Alignment(-1.255, 0),
      end: const Alignment(1.13294, 0),
      transform: const GradientRotation(272.82 - 90),
    );
  }
}
