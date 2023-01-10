import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/domain/favorite_sight.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
import 'package:places/ui/widgets/container/container_for_image_network.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Карточка мест в избраное
class FavoriteSightCard extends StatelessWidget {
  final FavoriteSight favoriteSight;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onDelete;
  final bool isDraggable;

  const FavoriteSightCard(
    this.favoriteSight, {
    required this.onDelete,
    this.margin,
    this.isDraggable = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Stack(
        children: [
          Container(
            margin: margin,
            decoration: BoxDecoration(
              color: theme.errorColor,
              borderRadius: const BorderRadius.all(
                AppSizes.radiusNormal,
              ),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.paddingCommon),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IconSvg(icon: AppIcons.iconBucket),
                    const SizedBox(height: AppSizes.paddingCommon / 2),
                    Text(
                      AppStrings.delete,
                      style: theme.textTheme.overline?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Dismissible(
            key: ObjectKey(favoriteSight),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => onDelete(),
            child: Container(
              margin: margin,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: isDraggable
                    ? HSLColor.fromColor(theme.backgroundColor)
                        .withLightness(0.9)
                        .toColor()
                    : theme.backgroundColor,
                borderRadius: const BorderRadius.all(
                  AppSizes.radiusNormal,
                ),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ContainerForImageNetwork(
                          url: favoriteSight.sight.urls.first,
                          height: AppSizes.heightImageCard,
                        ),
                        _CardContent(favoriteSight: favoriteSight),
                      ],
                    ),
                    Positioned.fill(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor:
                              theme.colorScheme.background.withOpacity(0.2),
                          onTap: () {
                            Navigator.of(context).push<SightDetails>(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SightDetails(favoriteSight.sight),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.paddingCommon),
                        child: Text(
                          favoriteSight.sight.type.name.toLowerCase(),
                          style: theme.textTheme.subtitle1?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 11, 10, 10),
                        child: _FavoriteCardButtons(
                          favoriteSight,
                          onDelete: onDelete,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteCardButtons extends StatelessWidget {
  final FavoriteSight favoriteSight;
  final VoidCallback onDelete;

  const _FavoriteCardButtons(
    this.favoriteSight, {
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonIconSvg(
          icon: favoriteSight.visited
              ? AppIcons.iconShare
              : AppIcons.iconCalendar,
          // TODO(me): add action
          action: () {},
        ),
        ButtonIconSvg(
          icon: AppIcons.iconClose,
          action: onDelete,
        ),
      ],
    );
  }
}

class _CardContent extends StatelessWidget {
  final FavoriteSight favoriteSight;

  const _CardContent({
    Key? key,
    required this.favoriteSight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(
        AppSizes.paddingCommon,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            favoriteSight.sight.name,
            style: theme.textTheme.headline6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: AppSizes.paddingSubtitleDivider,
          ),
          SizedBox(
            height: 28,
            child: Text(
              favoriteSight.date == null
                  ? ''
                  : '${favoriteSight.visited ? AppStrings.planeWasReached : AppStrings.planedFor} ${DateFormat(AppSettings.dateFormatAbrMonth).format(
                      favoriteSight.date!,
                    )}',
              style: theme.textTheme.subtitle2?.copyWith(
                color: favoriteSight.visited
                    ? theme.colorScheme.secondaryContainer
                    : theme.colorScheme.tertiary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: AppSizes.paddingSubtitleDivider,
          ),
          Text(
            '${AppStrings.closedUntil} 09:00',
            style: theme.textTheme.subtitle2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
