import 'package:places/domain/entity.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/sight_strings.dart';

/// Модель данных тип мест достопримечательности
class SightType extends Entity {
  // список типов мест
  static final List<SightType> _list = [
    SightType(
      id: SightStrings.placeTypeIdHotel,
      name: SightStrings.placeTypeNameHotel,
      icon: AppIcons.categoryHotel,
    ),
    SightType(
      id: SightStrings.placeTypeIdRestaurant,
      name: SightStrings.placeTypeNameRestaurant,
      icon: AppIcons.categoryRestaurant,
    ),
    SightType(
      id: SightStrings.placeTypeIdSpecialPlace,
      name: SightStrings.placeTypeNameSpecialPlace,
      icon: AppIcons.categoryParticularPlace,
    ),
    SightType(
      id: SightStrings.placeTypeIdPark,
      name: SightStrings.placeTypeNamePark,
      icon: AppIcons.categoryPark,
    ),
    SightType(
      id: SightStrings.placeTypeIdMuseum,
      name: SightStrings.placeTypeNameMuseum,
      icon: AppIcons.categoryMuseum,
    ),
    SightType(
      id: SightStrings.placeTypeIdCafe,
      name: SightStrings.placeTypeNameCafe,
      icon: AppIcons.categoryCafe,
    ),
  ];

  final String icon;

  static List<SightType> get list => _list;

  SightType({
    String id = '',
    required String name,
    required this.icon,
  }) : super(id: id, name: name);
  // список элементов
  static List<SightType> getList() {
    return _list;
  }

  // найти элемент в список типов мест по идентификатиору
  static SightType? getById(String id) {
    for (var i = 0; i < _list.length; i++) {
      final element = _list[i];
      if (element.id == id) {
        return element;
      }
    }

    return null;
  }
}
