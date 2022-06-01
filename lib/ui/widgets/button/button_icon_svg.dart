import 'package:flutter/material.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Кнопка с svg иконкой
class ButtonIconSvg extends StatelessWidget {
  final String icon;
  final Size? size;
  final Color? color;

  const ButtonIconSvg({
    required this.icon,
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO(me): onTap
      },
      child: IconSvg(
        icon: icon,
        size: size,
        color: color,
      ),
    );
  }
}
