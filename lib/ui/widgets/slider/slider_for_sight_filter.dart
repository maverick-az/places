import 'package:flutter/material.dart';
import 'package:places/presets/settings/local_settings.dart';
import 'package:places/presets/strings/app_strings.dart';

/// Класс для слайдера
class SliderForSightFilter extends StatefulWidget {
  const SliderForSightFilter({Key? key}) : super(key: key);

  @override
  State<SliderForSightFilter> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<SliderForSightFilter> {
  var _sliderValue = AppLocalSettings.minSightDistance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Text(AppStrings.distance),
          ],
        ),
        Slider(
          value: _sliderValue,
          onChanged: _onChange,
          min: AppLocalSettings.minSightDistance,
          max: AppLocalSettings.maxSightDistance,
        ),
      ],
    );
  }

  void _onChange(double newValue) {
    setState(() {
      _sliderValue = newValue;
    });
  }
}
