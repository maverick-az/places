import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Перечисление размера ripple эффекта
enum IconPaddingSize {
  big,
  normal,
  small,
  none,
}

/// Расширение для размера
extension IconPaddingSizeExtension on IconPaddingSize {
  double get size {
    switch (this) {
      case IconPaddingSize.big:
        return AppSizes.paddingIconBig;
      case IconPaddingSize.normal:
        return AppSizes.paddingIconNormal;
      case IconPaddingSize.small:
        return AppSizes.paddingIconSmall;
      default:
        return 0.0;
    }
  }
}

/// Кнопка с svg иконкой
class ButtonIconSvg extends StatelessWidget {
  final String icon;
  final Size? size;
  final Color? color;
  final VoidCallback? action;
  final IconPaddingSize paddingSize;
  final bool _fromIconButton;

  const ButtonIconSvg({
    required this.icon,
    this.size,
    this.color,
    this.action,
    this.paddingSize = IconPaddingSize.small,
    Key? key,
  })  : _fromIconButton = false,
        super(key: key);

  const ButtonIconSvg.fromIconButton({
    required this.icon,
    this.size,
    this.color,
    this.action,
    this.paddingSize = IconPaddingSize.small,
    Key? key,
  })  : _fromIconButton = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_fromIconButton) {
      return _FromIconButton(
        icon: icon,
        action: action,
        iconSize: size,
        color: color,
        paddingSize: paddingSize,
      );
    }

    return _ButtonIcon(
      icon: icon,
      action: action,
      size: size,
      color: color,
      paddingSize: paddingSize,
    );
  }
}

class _FromIconButton extends StatelessWidget {
  final String icon;
  final Size? iconSize;
  final IconPaddingSize paddingSize;
  final Color? color;
  final VoidCallback? action;

  const _FromIconButton({
    Key? key,
    required this.icon,
    required this.paddingSize,
    required this.color,
    required this.action,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: action,
      padding: EdgeInsets.all(paddingSize.size),
      constraints: const BoxConstraints(),
      icon: IconSvg(
        icon: icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}

class _ButtonIcon extends StatelessWidget {
  final IconPaddingSize paddingSize;
  final String icon;
  final Size? size;
  final Color? color;
  final VoidCallback? action;

  const _ButtonIcon({
    Key? key,
    required this.paddingSize,
    required this.icon,
    required this.size,
    required this.color,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: action,
        customBorder: const CircleBorder(),
        child: Ink(
          padding: EdgeInsets.all(paddingSize.size),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconSvg(
            icon: icon,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
