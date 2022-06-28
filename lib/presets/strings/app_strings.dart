/// Строковые константы приложения
class AppStrings {
  static const String appTitle = 'Места';

  /// Заголовки экранов
  static const String scrTitleSightListScreen = 'Список интересных мест';
  static const String srcTitleFavoriteScreen = 'Избранное';
  static const String srcTitleSettingsScreen = 'Настройки';
  static const String srcTitleAddSightScreen = 'Новое место';
  static const String srcTitleSelectSightTypeScreen = 'Категория';

  /// Строки для графика работы
  static const String closedUntil = 'Закрыто до';

  /// Строки для планирования
  static const String planedFor = 'Запланировано на';
  static const String planeWasReached = 'Цель достигнута';

  /// Строки кнопак
  static const String buildRoute = 'Построить маршрут';
  static const String plan = 'Запланировать';
  static const String addToFavorites = 'В Избранное';
  static const String wantToVisit = 'Хочу посетить';
  static const String visited = 'Посетил';
  static const String empty = 'Пусто';
  static const String show = 'Показать';
  static const String clear = 'Очистить';
  static const String cancel = 'Отмена';
  static const String create = 'Создать';
  static const String save = 'Сохранить';

  /// Строки настройки
  static const String lightTheme = 'Светлая тема';
  static const String darkTheme = 'Тёмная тема';
  static const String watchTutorial = 'Смотреть туториал';

  /// Строки страниц
  static const String emptyPageWantToVisit =
      'Отмечайте понравившиеся\nместа и они появиятся здесь.';
  static const String emptyPageVisited =
      'Завершите маршрут,\nчтобы место попало сюда.';

  static const String categories = 'Категории';

  static const String distance = 'Расстояние';

  /// Строки для поле ввода
  static const String labelCategory = 'Категория';
  static const String labelName = 'Название';
  static const String labelLatitude = 'Широта';
  static const String labelLongitude = 'Долгота';
  static const String labelDescription = 'Описание';
  static const String hintEnterText = 'Введите текст';
  static const String hintNotSelected = 'Не выбрано';
  static const String linkShowOnMap = 'Указать на карте';

  /// Ошибки полей ввода
  static const String errorEmptyField = 'Введите данные';
  static const String errorRequiredEmptyField = 'Обязательное заполнение';
  static const String errorMinLenghtField = 'Не меньше {minLenght} символов';
  static const String errorMaxLenghtField = 'Не больше {maxLenght} символов';
  static const String errorMinMaxNumberField =
      'Значение между {minValue} и {maxValue}';
  static const String errorInvalidDataField = 'Неверные данные';

  /// Строки для измерения
  static const String m = 'м';
  static const String km = 'км';

  static const String fromDistance = 'от';
  static const String toDistance = 'до';

  static const String appEmptyString = '';

  AppStrings._();
}
