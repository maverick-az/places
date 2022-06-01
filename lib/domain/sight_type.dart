import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/sight_strings.dart';

/// Модель данных тип мест достопримечательности
class SightType {
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

  final String id;
  final String name;
  final String icon;

  static List<SightType> get list => _list;

  SightType({
    required this.id,
    required this.name,
    required this.icon,
  });

  // найти элемент в список типов мест по идентификатиору
  static SightType getById(String id) {
    return _list.firstWhere((element) => element.id == id);
  }
}
