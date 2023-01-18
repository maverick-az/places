/// Общие параметры приложения
class AppSettings {
  // региональные настройки
  static const defaultLocale = 'ru';

  // папки
  static const String pathAssets = 'res';
  static const String pathIcons = '$pathAssets/icons';
  static const String pathImages = '$pathAssets/images';

  // формат даты
  static const String dateFormatAbrMonth = 'd MMM y';
  static const String dateFormatAbrMonthTime = 'd MMM y HH:mm';

  AppSettings._();
}
