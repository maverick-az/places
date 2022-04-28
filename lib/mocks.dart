import 'package:places/domain/sight.dart';
import 'package:places/presets/strings/sight_strings.dart';

// типы мест
final Map<String, SightType> _mapSightTypes = {
  SightStrings.placeTypeIdHotel: SightType(
    id: SightStrings.placeTypeIdHotel,
    name: SightStrings.placeTypeNameHotel,
  ),
  SightStrings.placeTypeIdRestaurant: SightType(
    id: SightStrings.placeTypeIdRestaurant,
    name: SightStrings.placeTypeNameRestaurant,
  ),
  SightStrings.placeTypeIdSpecialPlace: SightType(
    id: SightStrings.placeTypeIdSpecialPlace,
    name: SightStrings.placeTypeNameSpecialPlace,
  ),
  SightStrings.placeTypeIdPark: SightType(
    id: SightStrings.placeTypeIdPark,
    name: SightStrings.placeTypeNamePark,
  ),
  SightStrings.placeTypeIdMuseum: SightType(
    id: SightStrings.placeTypeIdMuseum,
    name: SightStrings.placeTypeNameMuseum,
  ),
  SightStrings.placeTypeIdCafe: SightType(
    id: SightStrings.placeTypeIdCafe,
    name: SightStrings.placeTypeNameCafe,
  ),
};

// список мест
final List<Sight> mocks = [
  Sight(
    name: 'Radisson Blu Leogrand Hotel',
    type: _mapSightTypes[SightStrings.placeTypeIdHotel]!,
    details:
        'Этот отель расположен в самом центре города, рядом со знаменитым собором Рождества Христова и зданием Парламента Кишинёва. К услугам гостей бесплатная парковка, бесплатный Wi-Fi и элегантный ресторан. Кроме того, гости могут бесплатно посещать фитнес-центр и спа-центр.',
    lat: 47.02453323537953,
    lon: 28.83674466942646,
  ),
  Sight(
    name: 'Mi piace',
    type: _mapSightTypes[SightStrings.placeTypeIdRestaurant]!,
    details:
        'Ресторан Mi Piace для эстетов-гурманов. Ресторан Mi Piace находится рядом с самым красивым местом Кишенева – Долиной Роз. Ресторан Mi Piace пронизан особой атмосферой европейского аристократизма и утонченного шика.',
    lat: 46.99868135843299,
    lon: 28.857941840590414,
  ),
  Sight(
    name: 'Милештские подземные галереи',
    type: _mapSightTypes[SightStrings.placeTypeIdSpecialPlace]!,
    details:
        'Милештий Мичь – самые большие винные погреба в мире длинной в 200 километров, 55 из которых используются в производстве и хранении качественных вин.',
    lat: 46.920626797932506,
    lon: 28.820536740588565,
  ),
  Sight(
    name: 'Парк "Штефан чел Маре"',
    type: _mapSightTypes[SightStrings.placeTypeIdPark]!,
    details:
        '«Штефан чел Маре» - центральный парк в Кишиневе. Кроме того, это одна из интереснейших достопримечательностей города и популярное место отдыха кишиневцев.',
    lat: 47.02562223331627,
    lon: 28.828305260604864,
  ),
  Sight(
    name: 'Национальный музей этнографии Кишинёва',
    type: _mapSightTypes[SightStrings.placeTypeIdMuseum]!,
    details:
        'Национальный музей этнографии и естественной истории Кишинёва гордо носит звание самого старого музея Молдавии (действует с 1889 г.). Нынешнее его здание было построено в 1905 г. по проекту архитектора В. Цыганко и единственное в Молдавии выполнено в псевдо-мавританском стиле.',
    lat: 47.02343032841899,
    lon: 28.819900169426464,
  ),
  Sight(
    name: 'Mojito',
    type: _mapSightTypes[SightStrings.placeTypeIdCafe]!,
    details:
        'Аргентина и Япония  ближе как никогда к вам, в самом центре Кишинёва. Насладитесь кулинарным удовольствием, выбрав ароматный стейк приготовленный по уникальному аргентинскому рецепту, или побалуйте себя свежим суши, специально приготовленным для вас.',
    lat: 47.050852201188384,
    lon: 28.863491211756607,
  ),
];
