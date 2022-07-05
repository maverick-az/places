import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_top_navigation.dart';
import 'package:places/ui/widgets/container/container_for_image_network.dart';

/// AppBar для экранов списка
class AppBarSightDetails extends StatelessWidget
    implements PreferredSizeWidget {
  final List<String> imageUrls;

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.heightAppBarImage);

  const AppBarSightDetails({required this.imageUrls, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      toolbarHeight: AppSizes.heightAppBarImage,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: AppSizes.heightAppBarImage,
        child: Stack(
          children: [
            const Positioned(
              top: 12,
              left: 16,
              child: ButtonTopNavigation(),
            ),
            Positioned(
              bottom: 0,
              left: -8,
              child: Container(
                width: 152,
                height: 8,
                decoration: BoxDecoration(
                  color: theme.primaryColorDark,
                  borderRadius:
                      const BorderRadius.all(AppSizes.radiusBtnImageSlider),
                ),
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: ContainerForImageNetwork(
        url: imageUrls.first,
        height: double.infinity,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
