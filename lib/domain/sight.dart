import 'package:places/domain/sight_type.dart';

/// Модель данных мест достопримечательности
class Sight {
  final String name;
  final List<String> urls;
  final String details;
  final double lat;
  final double lon;
  final SightType type;

  Sight({
    required this.name,
    required this.type,
    required this.urls,
    required this.details,
    required this.lat,
    required this.lon,
  });
}
