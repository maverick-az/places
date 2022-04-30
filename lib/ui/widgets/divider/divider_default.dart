import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';

class DividerDefault extends StatelessWidget {
  const DividerDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: AppSizes.paddingCommon,
      color: AppColors.inactiveBlack.withOpacity(0.24),
    );
  }
}
