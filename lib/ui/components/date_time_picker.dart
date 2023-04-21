import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Диалог для подбора даты и времени
Future<DateTime?> showDateTimePicker(
  BuildContext context,
  DateTime initialDate,
  DateTime firstDate,
  DateTime lastDate,
) async {
  final dateTime = Theme.of(context).platform != TargetPlatform.iOS
      ? await _showDateTimePickerForIOS(
          context,
          initialDate,
          firstDate,
          lastDate,
        )
      : await _showDateTimePickerForAndroid(
          context,
          initialDate,
          firstDate,
          lastDate,
        );

  return Future.value(dateTime);
}

/// Диалог для подбора даты и времени ос Android
Future<DateTime?> _showDateTimePickerForAndroid(
  BuildContext context,
  DateTime initialDate,
  DateTime firstDate,
  DateTime lastDate,
) async {
  final theme = Theme.of(context);
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    builder: (context, child) {
      return Theme(
        data: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: theme.colorScheme.tertiary,
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate == null) return Future.value(null);

  final pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initialDate),
    builder: (context, child) {
      return Theme(
        data: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: theme.colorScheme.tertiary,
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedTime == null) return Future.value(null);

  final dateTime = DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
  );

  return Future.value(dateTime);
}

/// Диалог для подбора даты и времени ос iOS
Future<DateTime?> _showDateTimePickerForIOS(
  BuildContext context,
  DateTime initialDate,
  DateTime firstDate,
  DateTime lastDate,
) async {
  DateTime? dateTime;

  await showCupertinoModalPopup<void>(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 240,
        child: CupertinoDatePicker(
          initialDateTime: initialDate,
          minimumDate: firstDate,
          maximumDate: lastDate,
          onDateTimeChanged: (value) {
            dateTime = value;
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    },
  );

  return Future.value(dateTime);
}
