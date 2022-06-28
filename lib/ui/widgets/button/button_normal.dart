import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Стандартая кнопка приложения
class ButtonNormal extends StatelessWidget {
  final String text;
  final Color? foregroundColor;
  final Function()? action;

  final String? icon;

  const ButtonNormal({
    required this.text,
    this.foregroundColor,
    this.icon,
    this.action,
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

    return ElevatedButton(
      style: buttonStyle?.copyWith(
        padding: _paddingButton(buttonStyle),
      ),
      onPressed: action,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  MaterialStateProperty<EdgeInsetsGeometry?>? _paddingButton(
    ButtonStyle? buttonStyle,
  ) {
    if (icon != null) {
      return MaterialStateProperty.all(
        const EdgeInsets.all(
          AppSizes.paddingBtnNormalWithIcon,
        ),
      );
    }

    return buttonStyle?.padding;
  }
}
