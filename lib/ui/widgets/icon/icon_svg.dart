import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Svg иконка
class IconSvg extends StatelessWidget {
  final String icon;
  final Size? size;
  final Color? color;

  const IconSvg({
    required this.icon,
    this.size = AppSizes.sizeIcon,
    this.color = AppColors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: size?.width,
      height: size?.height,
      color: color,
    );
  }
}
