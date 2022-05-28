import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/providers/filters_sight_type_provider.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';
import 'package:provider/provider.dart';

/// Кнопка с иконкой и галочкой для объектов с признаком активности
class ButtonIconSightType extends StatelessWidget {
  final SightType sightType;

  const ButtonIconSightType({
    required this.sightType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filterProvider = Provider.of<FiltersSightTypeProvider>(
      context,
      listen: false,
    );

    void _onPressed() {
      filterProvider.changeSightTypeFilter(sightType);
    }

    return Align(
      child: Column(
        children: [
          Stack(
            children: [
              OutlinedButton(
                onPressed: _onPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: theme.colorScheme.tertiary.withOpacity(0.16),
                  shape: const CircleBorder(),
                  alignment: Alignment.center,
                  fixedSize: AppSizes.sizeBtnCategory,
                  side: BorderSide.none,
                  splashFactory: InkSplash.splashFactory,
                ),
                child: IconSvg(
                  icon: sightType.icon,
                  color: theme.colorScheme.tertiary,
                  size: AppSizes.sizeIconCategory,
                ),
              ),
              Selector<FiltersSightTypeProvider, bool>(
                selector: (context, provider) =>
                    provider.isSightTypeAddedToFilter(sightType),
                builder: (context, isAddedToFilter, child) {
                  return isAddedToFilter ? const _TickIcon() : const SizedBox();
                },
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.paddingBtnNormalWithIcon,
          ),
          Text(
            sightType.name,
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }
}

class _TickIcon extends StatelessWidget {
  const _TickIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: AppSizes.sizeIconSuperSmall.width,
        height: AppSizes.sizeIconSuperSmall.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColorDark,
        ),
        child: const IconSvg(
          icon: AppIcons.iconTick,
        ),
      ),
    );
  }
}
