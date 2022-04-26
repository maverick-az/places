/// Модель данных мест достопримечательности
class Sight {
  final String name;
  final String url;
  final String details;
  final double lat;
  final double lon;
  final SightType type;

  Sight({
    required this.name,
    required this.type,
    this.url = '',
    this.details = '',
    this.lat = 0,
    this.lon = 0,
  });
}

/// Модель данных тип мест достопримечательности
class SightType {
  final String id;
  final String name;

  SightType({
    required this.id,
    required this.name,
  });
}
