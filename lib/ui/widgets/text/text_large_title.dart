import 'package:flutter/material.dart';

/// Text для большого заголовка
class TextLargeTitle extends StatelessWidget {
  final String data;

  const TextLargeTitle(this.data, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline3,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
