import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/presets/styles/text_styles.dart';
import 'package:places/ui/widgets/button/button_favorite.dart';

/// Карточка интересного место
class SightCard extends StatelessWidget {
  final Sight sight;
  final EdgeInsetsGeometry? margin;

  const SightCard(this.sight, {Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: const BoxDecoration(
        color: AppColors.whiteGreen,
        borderRadius: BorderRadius.all(
          AppSizes.radiusNormal,
        ),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: AppSizes.heightImageCard,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingCommon),
                    child: Text(
                      sight.type.name.toLowerCase(),
                      style: AppTextStyles.smallBold.copyWith(
                        color: AppColors.white,
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
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.vertical(
                bottom: AppSizes.radiusNormal,
              ),
            ),
            padding: const EdgeInsets.all(
              AppSizes.paddingCommon,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sight.name,
                  style: AppTextStyles.text.copyWith(
                    color: AppColors.secondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: AppSizes.paddingSubtitleDivider,
                ),
                Text(
                  sight.details,
                  style: AppTextStyles.small.copyWith(
                    color: AppColors.secondary2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
