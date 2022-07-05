import 'package:flutter/material.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/inputs/text_field_with_clear_icon.dart';
import 'package:places/utils/input_formatters.dart';

/// Ввод географических координат
class InputFieldsGeoCoordinate extends StatelessWidget {
  final TextEditingController? controllerLat;
  final TextEditingController? controllerLong;
  final ValueChanged<String>? onChangeLat;
  final ValueChanged<String>? onChangeLong;
  final String? Function()? validatorLat;
  final String? Function()? validatorLong;
  final FocusNode? focusNodeLat;
  final FocusNode? focusNodeLong;
  final TextInputAction? textInputAction;

  const InputFieldsGeoCoordinate({
    this.controllerLat,
    this.controllerLong,
    this.onChangeLat,
    this.onChangeLong,
    this.validatorLat,
    this.validatorLong,
    this.focusNodeLat,
    this.focusNodeLong,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFieldWithClearIcon(
                label: AppStrings.labelLatitude,
                keyboardType: TextInputType.number,
                maxLength: 20,
                textInputFormatter: DecimalFormatter(),
                controller: controllerLat,
                onChange: onChangeLat,
                validator: validatorLat,
                textInputAction: TextInputAction.next,
                focusNode: focusNodeLat,
                nextFocusNode: focusNodeLong,
              ),
            ),
            const SizedBox(width: AppSizes.paddingCommon),
            Expanded(
              child: TextFieldWithClearIcon(
                label: AppStrings.labelLongitude,
                keyboardType: TextInputType.number,
                maxLength: 20,
                textInputFormatter: DecimalFormatter(),
                controller: controllerLong,
                onChange: onChangeLong,
                validator: validatorLong,
                textInputAction: textInputAction,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // TODO(me): select coordinates from map
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 13),
              child: Text(
                AppStrings.linkShowOnMap,
                style: theme.textTheme.headline6?.copyWith(
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
