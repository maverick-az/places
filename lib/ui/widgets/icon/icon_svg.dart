import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Svg иконка
class IconSvg extends StatelessWidget {
  final String icon;
  final Size? size;
  final Color? color;

  const IconSvg({
    required this.icon,
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconTheme = Theme.of(context).iconTheme;

    return SvgPicture.asset(
      icon,
      width: size != null ? size!.width : iconTheme.size,
      height: size != null ? size!.height : iconTheme.size,
      color: color ?? iconTheme.color,
    );
  }
}
