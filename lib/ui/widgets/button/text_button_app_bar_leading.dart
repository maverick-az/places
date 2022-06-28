import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Текстовая кнопка в AppBar actions
class TextButtonAppBarLeading extends StatelessWidget {
  final String text;
  final Function()? action;
  final double? width;

  const TextButtonAppBarLeading({
    required this.text,
    this.action,
    this.width = 200,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OverflowBox(
      maxWidth: width,
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: action,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingCommon,
          ),
        ),
        child: Text(
          text,
          style: theme.textTheme.headline6?.copyWith(
            color: theme.colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }
}
