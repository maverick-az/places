import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/domain/favorite_sight.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
import 'package:places/ui/widgets/container/container_for_image_network.dart';

/// Карточка мест в избраное
class FavoriteSightCard extends StatelessWidget {
  final FavoriteSight favoriteSight;
  final EdgeInsetsGeometry? margin;

  const FavoriteSightCard(this.favoriteSight, {Key? key, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: margin,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.backgroundColor,
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
                    splashColor: theme.colorScheme.background.withOpacity(0.2),
                    onTap: () {},
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
                  padding: const EdgeInsets.fromLTRB(18, 19, 18, 18),
                  child: _FavoriteCardButtons(favoriteSight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoriteCardButtons extends StatelessWidget {
  final FavoriteSight favoriteSight;

  const _FavoriteCardButtons(this.favoriteSight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonIconSvg(
          icon: favoriteSight.visited
              ? AppIcons.iconShare
              : AppIcons.iconCalendar,
        ),
        const SizedBox(
          width: AppSizes.paddingCommon,
        ),
        const ButtonIconSvg(
          icon: AppIcons.iconClose,
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
