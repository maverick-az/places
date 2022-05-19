import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_favorite.dart';
import 'package:places/ui/widgets/container/container_for_image_network.dart';

/// Карточка интересного место
class SightCard extends StatelessWidget {
  final Sight sight;
  final EdgeInsetsGeometry? margin;

  const SightCard(this.sight, {Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: margin,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.all(
            AppSizes.radiusNormal,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ContainerForImageNetwork(
                  url: sight.urls.first,
                  height: AppSizes.heightImageCard,
                ),
                // const ContainerWithOpacityForImages(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingCommon),
                    child: Text(
                      sight.type.name.toLowerCase(),
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 19, 18, 18),
                    child: ButtonFavorite(),
                  ),
                ),
              ],
            ),
            _CardContent(sight: sight),
          ],
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final Sight sight;

  const _CardContent({
    Key? key,
    required this.sight,
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
            sight.name,
            style: theme.textTheme.headline6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: AppSizes.paddingSubtitleDivider,
          ),
          Text(
            sight.details,
            style: theme.textTheme.subtitle2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
