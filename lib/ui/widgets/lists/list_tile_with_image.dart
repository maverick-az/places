import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';

/// Элемент списка с изображением
class ListTileLeadingImage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final String image;
  final Widget? titleWidget;
  final Widget? trailing;
  final Function()? onTap;

  const ListTileLeadingImage({
    required this.title,
    required this.image,
    this.subtitle,
    this.titleWidget,
    this.titleColor,
    this.subtitleColor,
    this.trailing,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      horizontalTitleGap: AppSizes.paddingCommon,
      leading: Material(
        borderRadius: const BorderRadius.all(AppSizes.radiusNormal),
        color: theme.dividerColor.withOpacity(0.1),
        clipBehavior: Clip.antiAlias,
        child: SizedBox.fromSize(
          size: AppSizes.sizeImageListTile,
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: titleWidget ??
          Text(
            title,
            style: _textStyle(
              theme.textTheme.bodyText1,
              titleColor,
              theme.primaryColorDark,
            ),
          ),
      subtitle: subtitle != null
          ? Padding(
              padding: const EdgeInsets.only(top: AppSizes.paddingCommon / 2),
              child: Text(
                subtitle!,
                style: _textStyle(
                  theme.textTheme.subtitle2,
                  subtitleColor,
                  theme.colorScheme.secondaryContainer,
                ),
              ),
            )
          : null,
      contentPadding: EdgeInsets.zero,
      trailing: trailing,
      onTap: onTap,
    );
  }

  TextStyle? _textStyle(
    TextStyle? textStyle,
    Color? color,
    Color colorByDefault,
  ) {
    return textStyle?.copyWith(
      fontWeight: FontWeight.w400,
      color: color ?? colorByDefault,
    );
  }
}
