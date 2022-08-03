import 'package:places/presets/settings/settings.dart';

/// Предопределенные изображения приложения
class AppImages {
  // внешний источник
  static const String noImageUrl =
      'https://www.unfe.org/wp-content/uploads/2019/04/SM-placeholder.png';

  // внутренние файлы
  static const String testAsset = '$_pathImages/test.jpg';

  static const String _pathImages = AppSettings.pathImages;

  AppImages._();
}
