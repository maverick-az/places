import 'package:flutter/material.dart';
import 'package:places/presets/settings/local_settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/providers/filters_sight_type_provider.dart';
import 'package:provider/provider.dart';

/// Класс для слайдера
class RangeSliderForSightFilter extends StatefulWidget {
  final EdgeInsets? contentPadding;

  const RangeSliderForSightFilter({
    this.contentPadding,
    Key? key,
  }) : super(key: key);

  @override
  State<RangeSliderForSightFilter> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<RangeSliderForSightFilter> {
  late RangeValues _values;
  late FiltersSightTypeProvider _provider;

  @override
  void didChangeDependencies() {
    _provider = Provider.of<FiltersSightTypeProvider>(context, listen: false);
    _values = RangeValues(
      _provider.startSightDistance,
      _provider.endSightDistance,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    context.select<FiltersSightTypeProvider, int>(
      (value) => value.filtersClearedTimes,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: widget.contentPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.distance,
                style: theme.textTheme.bodyText1?.copyWith(
                  color: theme.primaryColorDark,
                ),
              ),
              Text(
                _getDistanceText(),
                style: theme.textTheme.bodyText1?.copyWith(
                  color: theme.colorScheme.secondaryContainer,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.paddingDetailContentDivider / 2,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            rangeTrackShape: const RectangularRangeSliderTrackShape(),
          ),
          child: RangeSlider(
            min: AppLocalSettings.minSightDistance,
            max: AppLocalSettings.maxSightDistance,
            values: _values,
            onChanged: _onChangeValues,
            onChangeEnd: _onChangeEnd,
          ),
        ),
      ],
    );
  }

  void _onChangeValues(RangeValues newValues) {
    setState(() {
      _values = newValues;
    });
  }

  void _onChangeEnd(RangeValues newValues) {
    _provider.changeDistance(
      newValues.start,
      newValues.end,
    );
  }

  String _getDistanceText() {
    final startFormated = _getFormatedValueForDistance(_values.start);
    final endFormated = _getFormatedValueForDistance(_values.end);

    return '${AppStrings.fromDistance} $startFormated ${AppStrings.toDistance} $endFormated';
  }

  String _getFormatedValueForDistance(double value) {
    return value >= 1000
        ? '${(value / 1000).toStringAsFixed(2)} ${AppStrings.km}'
        : '${value.toStringAsFixed(0)} ${AppStrings.m}';
  }
}
