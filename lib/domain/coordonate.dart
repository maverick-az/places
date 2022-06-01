import 'dart:math' as math;

/// Модель географических координат
class Coordonate {
  final double lat;
  final double lon;

  const Coordonate(this.lat, this.lon);

  /// данные в м
  static double distanceBetween(
    Coordonate from,
    Coordonate to,
  ) {
    const earthRadius = 6378137.0;
    final dLat = _toRadians(to.lat - from.lat);
    final dLon = _toRadians(to.lon - from.lon);

    final a = math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) *
            math.cos(_toRadians(from.lat)) *
            math.cos(_toRadians(to.lat));

    final c = 2 * math.asin(math.sqrt(a));

    // ignore: avoid_print
    //print(earthRadius * c);

    return earthRadius * c;
  }

  static double _toRadians(double degree) {
    return degree * math.pi / 180;
  }
}
