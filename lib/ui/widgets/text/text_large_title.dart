import 'package:flutter/material.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Text для большого заголовка
class TextLargeTitle extends StatelessWidget {
  final String data;

  const TextLargeTitle(this.data, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: AppTextStyles.largeTitle.copyWith(
        color: AppColors.secondary,
      ),
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
