import 'package:places/presets/settings/settings.dart';

/// Иконки приложения
class AppIcons {
  // иконки для пустых страниц
  static const String emptyPageCard = '$_path/empty_pages/card.svg';
  static const String emptyPageClear = '$_path/empty_pages/clear.svg';
  static const String emptyPageGo = '$_path/empty_pages/go.svg';
  static const String emptyPageMap = '$_path/empty_pages/map.svg';
  static const String emptyPageSearch = '$_path/empty_pages/search.svg';

  // иконки меню
  static const String menuHeart = '$_path/menu/heart.svg';
  static const String menuHeartFull = '$_path/menu/heart_full.svg';
  static const String menuList = '$_path/menu/list.svg';
  static const String menuListFull = '$_path/menu/list_full.svg';
  static const String menuMap = '$_path/menu/map.svg';
  static const String menuMapFull = '$_path/menu/map_full.svg';
  static const String menuSettings = '$_path/menu/settings.svg';
  static const String menuSettingsFull = '$_path/menu/settings_full.svg';

  // остальные иконки
  static const String iconCalendar = '$_pathOther/calendar.svg';
  static const String iconCalendarFull = '$_pathOther/calendar_full.svg';
  static const String iconClose = '$_pathOther/close.svg';
  static const String iconShare = '$_pathOther/share.svg';
  static const String iconGo = '$_pathOther/go.svg';
  static const String iconArrow = '$_pathOther/arrow.svg';
  static const String iconFail = '$_pathOther/fail.svg';

  static const String _path = AppSettings.pathIcons;
  static const String _pathOther = '$_path/other';

  AppIcons._();
}
