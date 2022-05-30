import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';

class DividerDefault extends StatelessWidget {
  final double height;
  const DividerDefault({
    this.height = AppSizes.paddingCommon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: Theme.of(context).dividerColor.withOpacity(0.24),
      thickness: 0.8,
    );
  }
}
