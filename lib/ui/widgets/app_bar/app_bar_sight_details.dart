import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/button/button_top_navigation.dart';

/// AppBar для экранов списка
class AppBarSightDetails extends StatelessWidget
    implements PreferredSizeWidget {
  // TODO(me): изменить на картинку
  final String? image;

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.heightAppBarImage);

  const AppBarSightDetails({this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: AppSizes.heightAppBarImage,
      titleSpacing: 0,
      title: SizedBox(
        width: double.infinity,
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
                decoration: const BoxDecoration(
                  color: AppColors.whiteMain,
                  borderRadius: BorderRadius.all(AppSizes.radiusBtnImageSlider),
                ),
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: Container(
        width: double.infinity,
        color: AppColors.whiteGreen,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
