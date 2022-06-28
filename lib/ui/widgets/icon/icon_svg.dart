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
    final iconSize = size ?? Size.square(iconTheme.size ?? 24);

    return ConstrainedBox(
      constraints: BoxConstraints.tight(iconSize),
      child: Align(
        child: SvgPicture.asset(
          icon,
          width: iconSize.width,
          height: iconSize.height,
          color: color ?? iconTheme.color,
        ),
      ),
    );
  }
}
