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
  final FocusNode? nextFocusNode;
  final TextInputFormatter? textInputFormatter;
  final TextInputAction? textInputAction;
  final Function(String)? onChange;
  final String? Function()? validator;

  const TextFieldWithClearIcon({
    this.maxLength,
    this.keyboardType,
    this.label,
    this.minLines,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.textInputFormatter,
    this.textInputAction,
    this.onChange,
    this.validator,
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
            contentPadding: const EdgeInsets.only(
              left: AppSizes.paddingTextFieldHorizontal,
              top: AppSizes.paddingTextFieldVertical,
              bottom: AppSizes.paddingTextFieldVertical,
            ),
            suffixIconConstraints: BoxConstraints.tight(
              Size(
                AppSizes.constraintIconTextField.width + 4,
                AppSizes.constraintIconTextField.height,
              ),
            ),
            suffixIcon: _controller.text.isNotEmpty && _focusNode.hasFocus
                ? Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ButtonIconSvg(
                      icon: AppIcons.iconClear,
                      color: theme.primaryColorDark,
                      action: _clear,
                    ),
                  )
                : null,
            hintText: AppStrings.hintEnterText.toLowerCase(),
            errorText: errorText,
            errorMaxLines: 2,
          ),
          onChanged: _onChange,
          onSubmitted: (_) => _onFieldSubmitted(context),
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
}
