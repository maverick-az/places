import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Текстовая кнопка в AppBar actions
class TextButtonAppBarAction extends StatelessWidget {
  final String text;
  final Function()? action;

  const TextButtonAppBarAction({
    required this.text,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingCommon,
        ),
      ),
      child: Text(
        text,
        style: theme.textTheme.headline6?.copyWith(
          color: theme.colorScheme.tertiary,
        ),
      ),
    );
  }
}
