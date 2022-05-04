import 'package:flutter/material.dart';

/// Иконка для заглушки
class IconBlueprint extends StatelessWidget {
  final Color? color;
  const IconBlueprint({this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 18,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
      ),
    );
  }
}
