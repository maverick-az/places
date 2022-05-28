import 'package:flutter/material.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/providers/filters_sight_type_provider.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_normal.dart';
import 'package:places/ui/widgets/button/text_button_app_bar_action.dart';
import 'package:places/ui/widgets/slider/range_slider_for_sight_filter.dart';
import 'package:places/ui/widgets/table/table_sight_type.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarActions = [
      TextButtonAppBarAction(
        text: AppStrings.clear,
        action: context.read<FiltersSightTypeProvider>().clearSightTypeFilters,
      ),
    ];

    return Scaffold(
      appBar: AppBarStandard(
        title: '',
        showNavigationButton: true,
        actions: appBarActions,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingCommon,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.categories.toUpperCase(),
                  style: theme.textTheme.overline,
                ),
                const SizedBox(
                  height: AppSizes.paddingDetailContentDivider,
                ),
                const TableSightType(),
                const SizedBox(
                  height: AppSizes.paddingDetailContentDivider,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppSizes.paddingSpaceBetweenFiltersAndSlider,
          ),
          const RangeSliderForSightFilter(
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingCommon,
            ),
          ),
          const Spacer(),
          Consumer<FiltersSightTypeProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingCommon,
                  vertical: AppSizes.paddingCommon / 2,
                ),
                child: ButtonNormal(
                  text:
                      '${AppStrings.show.toUpperCase()} (${value.getSightCountByFilters()})',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
