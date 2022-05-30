import 'package:flutter/material.dart';
import 'package:places/domain/coordonate.dart';
import 'package:places/domain/favorite_sight.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/presets/strings/sight_strings.dart';

// список мест
final List<Sight> mocks = [
  Sight(
    name: 'Radisson Blu Leogrand Hotel',
    type: SightType.getById(SightStrings.placeTypeIdHotel),
    urls: [
      'http://photos.wikimapia.org/p/00/08/45/73/36_big.jpg',
    ],
    details:
        'Этот отель расположен в самом центре города, рядом со знаменитым собором Рождества Христова и зданием Парламента Кишинёва. К услугам гостей бесплатная парковка, бесплатный Wi-Fi и элегантный ресторан. Кроме того, гости могут бесплатно посещать фитнес-центр и спа-центр.',
    lat: 47.02453323537953,
    lon: 28.83674466942646,
  ),
  Sight(
    name: 'Mi piace',
    type: SightType.getById(SightStrings.placeTypeIdRestaurant),
    urls: [
      'https://mipiace.md/wp-content/uploads/slider5/Mi-Piace-535.jpeg',
      'https://mipiace.md/wp-content/uploads/2018/09/Mi-Piace-546.jpg',
      'https://mipiace.md/wp-content/uploads/2018/09/Mi-Piace-555.jpg',
    ],
    details:
        'Ресторан Mi Piace для эстетов-гурманов. Ресторан Mi Piace находится рядом с самым красивым местом Кишенева – Долиной Роз. Ресторан Mi Piace пронизан особой атмосферой европейского аристократизма и утонченного шика.',
    lat: 46.99868135843299,
    lon: 28.857941840590414,
  ),
  Sight(
    name: 'Weekend Boutique Hotel',
    type: SightType.getById(SightStrings.placeTypeIdHotel),
    urls: [
      'https://cf.bstatic.com/xdata/images/hotel/max1280x900/11607575.jpg?k=ffe03f739e3f30238a5908d48a245570bce656e439048b08580e58168a82d0b2&o=&hp=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/c1/07/3f/lobby.jpg?w=1200&h=-1&s=1',
    ],
    details:
        'Номера бутик-отеля Weekend индивидуально оформлены в элегантном стиле 1950-х годов. Во всех номерах есть кондиционер, спутниковое телевидение, рабочая зона и современная ванная комната.',
    lat: 46.920626797932506,
    lon: 28.820536740588565,
  ),
  Sight(
    name: 'Парк "Штефан чел Маре"',
    type: SightType.getById(SightStrings.placeTypeIdPark),
    urls: [
      'https://www.viza.md/sites/default/files/images/04_Parc_St_cel_Mare_070512_003.JPG',
      'https://www.dudu.md/pic/product/2020/04/18/31925e99e943a1bd4.jpg',
      'http://photos.wikimapia.org/p/00/07/63/83/85_big.jpg',
    ],
    details:
        '«Штефан чел Маре» - центральный парк в Кишиневе. Кроме того, это одна из интереснейших достопримечательностей города и популярное место отдыха кишиневцев.',
    lat: 47.02562223331627,
    lon: 28.828305260604864,
  ),
  Sight(
    name: 'Национальный музей этнографии Кишинёва',
    type: SightType.getById(SightStrings.placeTypeIdMuseum),
    urls: [
      'https://moldovatur.md/wp-content/uploads/2020/01/MoldovaTur_Chisinau_Ethnographic_Museum.jpg',
      'https://www.moldpres.md/uploads/news/2019/09/19/19007381_big1568902957.jpg',
      'https://1.bp.blogspot.com/-kJMxGgYLFM4/XFsHIk8XUtI/AAAAAAAAGuQ/PN1HDeol4iUFXFacTpJ2kp9EgD1dzsVbQCLcBGAs/s1600/moldavskaya-svadiba-v-muzee-etnografii-i-naturalinoi-istorii.jpg',
    ],
    details:
        'Национальный музей этнографии и естественной истории Кишинёва гордо носит звание самого старого музея Молдавии (действует с 1889 г.). Нынешнее его здание было построено в 1905 г. по проекту архитектора В. Цыганко и единственное в Молдавии выполнено в псевдо-мавританском стиле.',
    lat: 47.02343032841899,
    lon: 28.819900169426464,
  ),
  Sight(
    name: 'Mojito',
    type: SightType.getById(SightStrings.placeTypeIdCafe),
    urls: [
      'https://citylive.md/img/2020/07/30420045_364149454083299_7330388823847263159_o.jpg',
      'https://www.fest.md/files/places/4/image_476_10_preview.jpg',
      'https://www.fest.md/files/places/4/image_476_20_preview.jpg',
    ],
    details:
        'Аргентина и Япония  ближе как никогда к вам, в самом центре Кишинёва. Насладитесь кулинарным удовольствием, выбрав ароматный стейк приготовленный по уникальному аргентинскому рецепту, или побалуйте себя свежим суши, специально приготовленным для вас.',
    lat: 47.050852201188384,
    lon: 28.863491211756607,
  ),
  Sight(
    name: 'Парк Дендрарий',
    type: SightType.getById(SightStrings.placeTypeIdPark),
    urls: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/42/bf/f7/photo2jpg.jpg?w=1200&h=-1&s=1',
      'https://s13.stc.yc.kpcdn.net/share/i/4/2151657/wr-750.webp',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/14/19/ef/2b/caption.jpg',
    ],
    details:
        'Идеальный семейный отдых можно провести в парке Дендрарий. Парк Дендрарий живописный, каждое дерево, куст или цветок цепляют взгляд, в нём расслабляешься, наслаждаешься свежим воздухом и отпускаешь все неприятные мысли.',
    lat: 47.03289998044136,
    lon: 28.8101806270972,
  ),
  Sight(
    name: 'Сквер с панорамным видом на Чеканах',
    type: SightType.getById(SightStrings.placeTypeIdSpecialPlace),
    urls: [
      'https://i.simpalsmedia.com/point.md/news/thumbnails/large/954c6ca923e004538cb6f02f2e34543b.jpg',
      'https://i.simpalsmedia.com/point.md/news/thumbnails/large/a9d5bdeab7670e3f380c3e715832df2a.jpg',
    ],
    details:
        'Сквер с панорамным видом на город на улице Марии Дрэган в секторе Чеканы превратился в современное пространство для отдыха.',
    lat: 47.014222164812324,
    lon: 28.882793093465622,
  ),
  Sight(
    name: 'Национальный Музей Археологии и Истории Молдовы',
    type: SightType.getById(SightStrings.placeTypeIdSpecialPlace),
    urls: [
      'https://www.fest.md/files/places/2/image_217_5_large.jpg',
      'https://ic.pics.livejournal.com/zhidchenko22/82890995/32986/32986_original.jpg',
    ],
    details:
        'Музей был открыт в 1987 г. в здании бывшего Регионального Лицея, находящемся в историческом центре Кишинёва. Перед зданием установлен памятник Латинской волчице с Ромулом и Ремом – точная копия знаменитого римского монумента.',
    lat: 47.02272544411117,
    lon: 28.828110040591103,
  ),
  Sight(
    name: 'Кафе-Бар "Caffe Graffiti"',
    type: SightType.getById(SightStrings.placeTypeIdCafe),
    urls: [
      'http://www.prospect.md/images/business/kafe-bar-caffe-graffiti_thumb.jpg',
      'http://www.resto.md/images/stories/places/221-caffe-graffiti/caffe-graffiti-chisinau-7.jpg',
      'https://i.simpalsmedia.com/point_files/files/0245e7e3fd19313b54b25fb2e679e12d.jpg',
    ],
    details:
        'Стильная и комфортная атмосфера, непринуждённая и лишённая малейших церемоний, в сочетании с отменной японской и итальянской кухней и достойным сервисом – вот что сделает посетителей «Caffe Graffiti» постоянными.',
    lat: 46.999925603446755,
    lon: 28.842870369425754,
  ),
];

final List<FavoriteSight> mocksFavorite = [
  FavoriteSight(
    sight: mocks[0],
    date: DateTime(2022, 9, 15),
  ),
  FavoriteSight(
    sight: mocks[1],
    date: DateTime(2022, 5, 16),
  ),
  FavoriteSight(
    sight: mocks[2],
    date: DateTime(2022, 3, 5),
    visited: true,
  ),
  FavoriteSight(
    sight: mocks[3],
  ),
];

final List<SightType> mocksSelectedSightType = [];

const Coordonate mocksCurrentLocation =
    Coordonate(47.02438411418258, 28.83675434746436);

const ThemeMode mocksThemeMode = ThemeMode.light;
