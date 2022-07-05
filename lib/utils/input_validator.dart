import 'package:places/presets/strings/app_strings.dart';

/// Валидация даннх
class InputValidator {
  InputValidator._();

  static String? isValidNumber(
    String? value, {
    bool nonZero = false,
    double? minValue,
    double? maxValue,
  }) {
    final parsedValue = double.tryParse(value ?? '');

    if (parsedValue == null || nonZero && parsedValue == 0) {
      return AppStrings.errorEmptyField;
    }
    if (minValue != null && minValue > parsedValue ||
        maxValue != null && maxValue < parsedValue) {
      return AppStrings.errorMinMaxNumberField
          .replaceAll('{minValue}', '$minValue')
          .replaceAll('{maxValue}', '$maxValue');
    }

    return null;
  }

  static String? isValidString(
    String? value, {
    bool allowEmpty = false,
    int? minLenght,
    int? maxLenght,
  }) {
    if (value == null || value.isEmpty) {
      return !allowEmpty ? AppStrings.errorRequiredEmptyField : null;
    }
    if (minLenght != null && minLenght > value.length) {
      return AppStrings.errorMinLenghtField
          .replaceAll('{minLenght}', '$minLenght');
    }
    if (maxLenght != null && maxLenght < value.length) {
      return AppStrings.errorMaxLenghtField
          .replaceAll('{maxLenght}', '$maxLenght');
    }

    return null;
  }
}
