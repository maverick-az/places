import 'package:flutter/material.dart';
import 'package:places/domain/entity.dart';
import 'package:places/domain/typedefs/typedef.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/screen/select_items_screen.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';

/// Выбор сущности
class TextFieldSelectEntity extends StatefulWidget {
  final String? label;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final ListItems<Entity> getListCallback;
  final Entity? Function(String)? getItemById;
  final Function(String)? onChange;
  final String? Function()? validator;

  const TextFieldSelectEntity({
    required this.getListCallback,
    this.getItemById,
    this.label,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onChange,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldSelectEntity> createState() => _TextFieldSelectEntityState();
}

class _TextFieldSelectEntityState extends State<TextFieldSelectEntity> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String? errorText;
  String? selectedId;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    // заполнить текст по идентификатору
    _changeTextById(widget.initialValue.toString());

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
    final commonInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: _controller.text.isNotEmpty
            ? theme.colorScheme.tertiary.withOpacity(0.4)
            : theme.colorScheme.background.withOpacity(0.2),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null)
          Text(
            widget.label!.toUpperCase(),
            style: theme.textTheme.overline,
          ),
        TextField(
          readOnly: true,
          controller: _controller,
          focusNode: _focusNode,
          style: theme.textTheme.bodyText1?.copyWith(
            color: theme.primaryColorDark,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            isDense: true,
            hintText: AppStrings.hintNotSelected,
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSizes.paddingTextFieldVertical + 4,
            ),
            hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
            errorText: errorText,
            errorMaxLines: 2,
            border: commonInputBorder,
            enabledBorder: commonInputBorder,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _controller.text.isNotEmpty
                    ? theme.colorScheme.tertiary.withOpacity(0.4)
                    : theme.colorScheme.background.withOpacity(0.2),
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.errorColor.withOpacity(0.4),
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.errorColor.withOpacity(0.4),
                width: 2,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.background.withOpacity(0.1),
                width: 2,
              ),
            ),
            suffixIconConstraints: BoxConstraints.tight(
              AppSizes.constraintIconTextField,
            ),
            suffixIcon: ButtonIconSvg(
              action: () => _selectItems(context),
              icon: AppIcons.iconView,
              color: theme.colorScheme.primary,
            ),
          ),
          onTap: () => _selectItems(context),
        ),
      ],
    );
  }

  Future<void> _selectItems(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute<String?>(
        builder: (context) => SelectItemsScreen(
          getList: widget.getListCallback,
          selectedItems: selectedId.toString().isEmpty
              ? _controller.text.isNotEmpty
                  ? [_controller.text]
                  : []
              : [selectedId!],
        ),
      ),
    );
    if (result != null) {
      _onChange(result);
    }
    _validate(result != null);
  }

  void _onChange(String value) {
    if (widget.onChange != null) {
      widget.onChange!(value);
    }
    _changeTextById(value);
  }

  void _changeTextById(String id) {
    var textValue = id;
    if (widget.getItemById != null) {
      selectedId = id;
      final item = widget.getItemById!(id);
      textValue = item != null ? item.name : '';
    }
    _controller.text = textValue;
  }

  void _validate(bool onSubmit) {
    if (widget.validator != null) {
      errorText = widget.validator!();
    }
    // установка фокуса в поле
    if (onSubmit && errorText == null && widget.nextFocusNode != null) {
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    }
  }
}
