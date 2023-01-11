import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/app_bar/app_bar_sight_details.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
import 'package:places/ui/widgets/button/button_normal.dart';
import 'package:places/ui/widgets/button/button_small_with_status.dart';
import 'package:places/ui/widgets/divider/divider_default.dart';

/// Экран подробной информации о месте
class SightDetails extends StatelessWidget {
  final Sight sight;
  final ScrollController? scrollController;
  final bool forBottomSheet;

  const SightDetails(
    this.sight, {
    this.scrollController,
    this.forBottomSheet = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: AppSizes.heightAppBarImage,
            flexibleSpace: Stack(
              children: [
                AppBarSightDetails(
                  imageUrls: sight.urls,
                  hideTopNavigation: forBottomSheet,
                ),
                if (forBottomSheet) _BottomSheetMinimizeIcon(theme: theme),
                if (forBottomSheet) _ButtonCloseBottomSheet(theme: theme),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingCommon,
                vertical: AppSizes.paddingDetailContentDivider,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sight.name,
                    style: theme.textTheme.headline4,
                  ),
                  const SizedBox(
                    height: AppSizes.paddingSubtitleDivider,
                  ),
                  Row(
                    children: [
                      Text(
                        sight.type.name.toLowerCase(),
                        style: theme.textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: AppSizes.paddingCommon,
                      ),
                      Text(
                        '${AppStrings.closedUntil.toLowerCase()} 09:00',
                        style: theme.textTheme.subtitle2?.copyWith(
                          color: theme.brightness == Brightness.dark
                              ? theme.colorScheme.background
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.paddingDetailContentDivider,
                  ),
                  Text(
                    sight.details,
                    style: theme.textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: AppSizes.paddingDetailContentDivider,
                  ),
                  ButtonNormal(
                    text: AppStrings.buildRoute.toUpperCase(),
                    icon: AppIcons.iconGo,
                  ),
                  const SizedBox(
                    height: AppSizes.paddingCommon,
                  ),
                  const DividerDefault(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ButtonSmallWithStatus(
                        icon: AppIcons.iconCalendar,
                        text: AppStrings.plan,
                        disabled: true,
                      ),
                      ButtonSmallWithStatus(
                        icon: AppIcons.menuHeart,
                        text: AppStrings.addToFavorites,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonCloseBottomSheet extends StatelessWidget {
  final ThemeData theme;

  const _ButtonCloseBottomSheet({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingCommon),
          child: CircleAvatar(
            backgroundColor: theme.primaryColor,
            child: ButtonIconSvg(
              icon: AppIcons.iconClose,
              color: theme.primaryColorDark,
              action: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheetMinimizeIcon extends StatelessWidget {
  final ThemeData theme;

  const _BottomSheetMinimizeIcon({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 12,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.paddingCommon / 2),
          ),
          width: 40,
          height: 4,
        ),
      ),
    );
  }
}
