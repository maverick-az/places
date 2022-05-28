import 'package:flutter/cupertino.dart';
import 'package:places/domain/coordonate.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/settings/local_settings.dart';

/// Модель для оповещения изминений в фильтр типов мест
class FiltersSightTypeProvider extends ChangeNotifier {
  double get startSightDistance => _startSightDistance;
  double get endSightDistance => _endSightDistance;
  int get filtersClearedTimes => _filtersClearedTimes;
  Coordonate get currentLocation => _curentLocation;

  late List<SightType> _selectedSightType;
  late double _startSightDistance;
  late double _endSightDistance;
  late Coordonate _curentLocation;

  int _filtersClearedTimes = 0;

  FiltersSightTypeProvider() {
    _selectedSightType = mocksSelectedSightType;
    assert(
        AppLocalSettings.minSightDistance < AppLocalSettings.maxSightDistance);
    _startSightDistance = AppLocalSettings.minSightDistance;
    _endSightDistance = AppLocalSettings.maxSightDistance;
    _curentLocation = mocksCurrentLocation;
  }

  bool isSightTypeAddedToFilter(SightType item) =>
      _selectedSightType.any((element) => element.id == item.id);

  void changeSightTypeFilter(SightType item) {
    if (isSightTypeAddedToFilter(item)) {
      _selectedSightType.remove(item);
    } else {
      _selectedSightType.add(item);
    }
    notifyListeners();
  }

  void changeDistance(double start, double end) {
    assert(start < end);
    _startSightDistance = start;
    _endSightDistance = end;
    if (_selectedSightType.isNotEmpty) {
      notifyListeners();
    }
  }

  int getSightCountByFilters() {
    if (_selectedSightType.isEmpty) return 0;

    return mocks
        .where((sight) => _selectedSightType.any((sightType) {
              if (sightType.id != sight.type.id) {
                return false;
              }
              final distance = Coordonate.distanceBetween(
                _curentLocation,
                Coordonate(sight.lat, sight.lon),
              );

              return distance >= _startSightDistance &&
                  distance <= _endSightDistance;
            }))
        .length;
  }

  void clearSightTypeFilters() {
    _selectedSightType.clear();
    _startSightDistance = AppLocalSettings.minSightDistance;
    _endSightDistance = AppLocalSettings.maxSightDistance;
    _filtersClearedTimes++;
    notifyListeners();
  }
}
