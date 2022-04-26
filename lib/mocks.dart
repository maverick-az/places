import 'package:places/domain/sight.dart';
import 'package:places/presets/strings/sight_strings.dart';

// типы мест
final Map<String, SightType> _mapSightTypes = {
  SightStrings.placeTypeIdArchitecturalObjects: SightType(
    id: SightStrings.placeTypeIdArchitecturalObjects,
    name: SightStrings.placeTypeNameArchitecturalObjects,
  ),
  SightStrings.placeTypeIdCulturalObjects: SightType(
    id: SightStrings.placeTypeIdCulturalObjects,
    name: SightStrings.placeTypeNameCulturalObjects,
  ),
  SightStrings.placeTypeIdNaturalObjects: SightType(
    id: SightStrings.placeTypeIdNaturalObjects,
    name: SightStrings.placeTypeNameNaturalObjects,
  ),
  SightStrings.placeTypeIdReligiousObjects: SightType(
    id: SightStrings.placeTypeIdReligiousObjects,
    name: SightStrings.placeTypeNameReligiousObjects,
  ),
};

// список мест
final List<Sight> mocks = [
  Sight(
    name: 'Собор Рождества Христова',
    type: _mapSightTypes[SightStrings.placeTypeIdReligiousObjects]!,
    details:
        'Кафедральный храм Кишинёвской митрополии Русской Православной Церкви в Кишинёве. Архитектурный памятник XIX века.',
    lat: 47.02628651566078,
    lon: 28.834503298261733,
  ),
  Sight(
    name: 'Триумфальная арка',
    type: _mapSightTypes[SightStrings.placeTypeIdArchitecturalObjects]!,
    details:
        'Сооружена в 1846 году под руководством архитектора И. Заушкевича для размещения колокола весом в 6,4 т, отлитого из трофейных турецких пушек.',
    lat: 47.0249143750118,
    lon: 28.832665240591115,
  ),
  Sight(
    name: 'Памятник Стефану Великому',
    type: _mapSightTypes[SightStrings.placeTypeIdArchitecturalObjects]!,
    details:
        'Памятник правившему Молдавией с 12 апреля 1457 года по 2 июля 1504 года господарю Молдавии Стефану Великому.',
    lat: 47.02565872456588,
    lon: 28.830362124119684,
  ),
  Sight(
    name: 'Милештские подземные галереи',
    type: _mapSightTypes[SightStrings.placeTypeIdArchitecturalObjects]!,
    details:
        'Милештий Мичь – самые большие винные погреба в мире длинной в 200 километров, 55 из которых используются в производстве и хранении качественных вин.',
    lat: 46.920626797932506,
    lon: 28.820536740588565,
  ),
  Sight(
    name: 'Органный Зал',
    type: _mapSightTypes[SightStrings.placeTypeIdCulturalObjects]!,
    details:
        'Органный зал — концертный зал в муниципии Кишинёв. Здание Органного зала является памятником архитектуры начала XX века.',
    lat: 47.02227491725311,
    lon: 28.83507818476753,
  ),
  Sight(
    name: 'Старый Орхей',
    type: _mapSightTypes[SightStrings.placeTypeIdNaturalObjects]!,
    details:
        'История местности охватывает не одну тысячу лет — самые старые археологические свидетельства датируются 4-1 веками до н. э., а наиболее «современными» можно считать постройки 17 века.',
    lat: 47.30318218967716,
    lon: 28.968050155939142,
  ),
];
