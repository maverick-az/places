import 'package:flutter/material.dart';
import 'package:places/ui/widgets/button/text_button_app_bar_leading.dart';

/// Текстовая кнопка в AppBar actions для возвращение на предыдущий route
class TextButtonAppBarLeadingPop extends StatelessWidget {
  final String text;

  const TextButtonAppBarLeadingPop({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButtonAppBarLeading(
      text: text,
      action: () => Navigator.pop(context),
    );
  }
}
