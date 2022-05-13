import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/domain/favorite_sight.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';
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
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: margin,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.all(
            AppSizes.radiusNormal,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ContainerForImageNetwork(
                  url: favoriteSight.sight.urls.first,
                  height: AppSizes.heightImageCard,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingCommon),
                    child: Text(
                      favoriteSight.sight.type.name.toLowerCase(),
                      style: AppTextStyles.smallBold.copyWith(
                        color: AppColors.white,
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
            _CardContent(favoriteSight: favoriteSight),
          ],
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
          color: AppColors.white,
        ),
        const SizedBox(
          width: AppSizes.paddingCommon,
        ),
        const ButtonIconSvg(
          icon: AppIcons.iconClose,
          color: AppColors.white,
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
    return Padding(
      padding: const EdgeInsets.all(
        AppSizes.paddingCommon,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            favoriteSight.sight.name,
            style: AppTextStyles.text.copyWith(
              color: AppColors.secondary,
            ),
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
              style: AppTextStyles.small.copyWith(
                color: favoriteSight.visited
                    ? AppColors.secondary2
                    : AppColors.whiteGreen,
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
            style: AppTextStyles.small.copyWith(
              color: AppColors.secondary2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
