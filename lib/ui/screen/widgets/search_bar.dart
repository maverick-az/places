import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';
import 'package:places/ui/widgets/inputs/text_field_with_clear_icon.dart';

/// Поле поиска
class SearchBar extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? sufixIcon;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Function()? onTap;
  final String? Function()? validator;

  const SearchBar({
    this.padding,
    this.sufixIcon,
    this.controller,
    this.onChange,
    this.onTap,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingCommon,
            vertical: AppSizes.paddingCommon / 2,
          ),
      child: TextFieldWithClearIcon(
        textInputAction: TextInputAction.search,
        hintText: AppStrings.hintSearch,
        prefixIcon: IconSvg(
          icon: AppIcons.iconSearch,
          color: theme.colorScheme.background,
        ),
        sufixIcon: sufixIcon,
        fillColor: theme.backgroundColor,
        noneBorderStyle: true,
        controller: controller,
        onChange: onChange,
        onTap: onTap,
        autofocus: true,
      ),
    );
  }
}
