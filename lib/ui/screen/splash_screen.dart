import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:places/presets/assets/images.dart';
import 'package:places/presets/settings/local_settings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Сплеш-экран
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<bool> isInitialized;

  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.tertiaryContainer,
              theme.colorScheme.tertiary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: const GradientRotation(260 * 3.14 / 180),
            tileMode: TileMode.repeated,
            stops: const [0, 0.8],
          ),
        ),
        child: const Center(
          child: IconSvg(
            icon: AppImages.logo,
            size: AppSizes.sizeImageLogo,
          ),
        ),
      ),
    );
  }

  /// Переход либо на онбординг, если был первый вход, либо на главный экран
  Future<void> _navigateToNext() async {
    isInitialized = Future.delayed(
      const Duration(seconds: AppLocalSettings.splashScreenDelay),
      () {
        log('Переход на следующий экран');

        return true;
      },
    );
  }
}
