import 'package:places/domain/sight.dart';

/// Модель данных мест достопримечательности в избраное
class FavoriteSight {
  final Sight sight;
  final bool visited;
  final DateTime? date;

  FavoriteSight({
    required this.sight,
    this.visited = false,
    this.date,
  });
}
