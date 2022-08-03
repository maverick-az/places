import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/assets/images.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Добаление и просмотр изображения
class InputAddPreviewImages extends StatelessWidget {
  final List<String> images;
  final ValueChanged<String> onImageAdd;
  final ValueChanged<String>? onImageDelete;

  const InputAddPreviewImages({
    required this.images,
    required this.onImageAdd,
    this.onImageDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _AddImageButton(
            onTap: () => onImageAdd('image'),
          ),
          ...images.map(
            (image) {
              return Dismissible(
                key: ValueKey(image),
                direction: DismissDirection.up,
                onDismissed: (_) => onImageDelete!(image),
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSizes.paddingCommon),
                  child: _AddImageButton(
                    imageAsset: AppImages.testAsset,
                    onTap: () => onImageDelete!(image),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AddImageButton extends StatelessWidget {
  final String? imageAsset;
  final VoidCallback? onTap;

  const _AddImageButton({
    this.imageAsset,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAddButton = imageAsset == null;

    return SizedBox.fromSize(
      size: AppSizes.sizeBtnAddImage,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AbsorbPointer(
            absorbing: !isAddButton,
            child: GestureDetector(
              child: Container(
                clipBehavior: Clip.antiAlias,
                child: isAddButton
                    ? IconSvg(
                        icon: AppIcons.iconUnion,
                        color: theme.colorScheme.tertiary,
                      )
                    : Image.asset(
                        imageAsset!,
                        fit: BoxFit.fill,
                      ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(AppSizes.radiusNormal),
                    side: BorderSide(
                      width: isAddButton ? 2 : 0,
                      color: theme.colorScheme.tertiary.withOpacity(0.46),
                    ),
                  ),
                ),
              ),
              onTap: onTap,
            ),
          ),
          if (!isAddButton)
            Align(
              alignment: Alignment.topRight,
              child: ButtonIconSvg(
                icon: AppIcons.iconClear,
                paddingSize: IconPaddingSize.extraSmall,
                action: onTap,
              ),
            ),
        ],
      ),
    );
  }
}
