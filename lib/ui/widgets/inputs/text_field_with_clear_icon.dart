import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';

/// Поле ввода с иконкай
class TextFieldWithClearIcon extends StatefulWidget {
  final String? label;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? minLines;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final FocusNode? nextFocusNode;
  final TextInputFormatter? textInputFormatter;
  final TextInputAction? textInputAction;
  final Function(String)? onChange;
  final Function()? onTap;
  final String? Function()? validator;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String? hintText;
  final Color? fillColor;
  final bool noneBorderStyle;
  final Color? errorTextColor;

  const TextFieldWithClearIcon({
    this.maxLength,
    this.keyboardType,
    this.label,
    this.minLines,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.nextFocusNode,
    this.textInputFormatter,
    this.textInputAction,
    this.onChange,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.sufixIcon,
    this.hintText,
    this.fillColor,
    this.noneBorderStyle = false,
    this.errorTextColor,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldWithClearIcon> createState() => _TextFieldWithClearIconState();
}

class _TextFieldWithClearIconState extends State<TextFieldWithClearIcon> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(() => setState(() {}));
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputDecorationTheme = theme.inputDecorationTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null)
          Text(
            widget.label!.toUpperCase(),
            style: theme.textTheme.overline,
          ),
        if (widget.label != null)
          const SizedBox(height: AppSizes.paddingTextFieldLabel),
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          autofocus: widget.autofocus,
          textInputAction: widget.textInputAction,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
            if (widget.textInputFormatter != null) widget.textInputFormatter!,
          ],
          style: theme.textTheme.bodyText1?.copyWith(
            color: theme.primaryColorDark,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          cursorColor: theme.primaryColorDark,
          cursorWidth: 1,
          cursorHeight: AppSizes.heightCursor,
          minLines: widget.minLines,
          maxLines: widget.minLines == null ? 1 : null,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              left: widget.prefixIcon == null
                  ? AppSizes.paddingTextFieldHorizontal
                  : 0,
              top: AppSizes.paddingTextFieldVertical,
              bottom: AppSizes.paddingTextFieldVertical,
            ),
            prefixIconConstraints: widget.prefixIcon != null
                ? BoxConstraints.tight(
                    AppSizes.constraintIconTextField,
                  )
                : null,
            prefixIcon: widget.prefixIcon,
            suffixIconConstraints: BoxConstraints.tight(
              AppSizes.constraintIconTextField,
            ),
            suffixIcon: widget.sufixIcon ??
                (_controller.text.isNotEmpty && _focusNode.hasFocus
                    ? ButtonIconSvg(
                        icon: AppIcons.iconClear,
                        color: theme.primaryColorDark,
                        action: _clear,
                      )
                    : null),
            hintText: widget.hintText ?? AppStrings.hintEnterText.toLowerCase(),
            errorText: errorText,
            errorStyle: widget.errorTextColor != null
                ? theme.inputDecorationTheme.errorStyle?.copyWith(
                    color: widget.errorTextColor,
                  )
                : null,
            errorMaxLines: 2,
            fillColor: widget.fillColor,
            filled: widget.fillColor != null,
            border: _inputBorder(inputDecorationTheme.border),
            enabledBorder: _inputBorder(inputDecorationTheme.enabledBorder),
            focusedBorder: _inputBorder(inputDecorationTheme.focusedBorder),
            disabledBorder: _inputBorder(inputDecorationTheme.disabledBorder),
            errorBorder: _inputBorder(inputDecorationTheme.errorBorder),
            focusedErrorBorder:
                _inputBorder(inputDecorationTheme.focusedBorder),
          ),
          onChanged: _onChange,
          onSubmitted: (_) => _onFieldSubmitted(context),
          onTap: widget.onTap,
          readOnly: widget.onTap != null,
        ),
      ],
    );
  }

  void _clear() {
    _controller.text = '';
    _onChange(_controller.text);
  }

  void _onChange(String value) {
    if (widget.onChange != null) {
      widget.onChange!(value);
    }
    if (widget.validator != null) {
      errorText = widget.validator!();
    }
  }

  void _onFieldSubmitted(BuildContext context) {
    if (widget.nextFocusNode != null && widget.nextFocusNode!.canRequestFocus) {
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    } else if (widget.textInputAction == null ||
        widget.textInputAction == TextInputAction.done) {
      FocusScope.of(context).unfocus();
    } else if (widget.textInputAction == TextInputAction.next &&
        _controller.text.isNotEmpty) {
      FocusScope.of(context).nextFocus();
    }
  }

  InputBorder? _inputBorder(InputBorder? inputBorder) {
    return widget.noneBorderStyle && inputBorder != null
        ? inputBorder.copyWith(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          )
        : null;
  }
}
