import 'package:flutter/cupertino.dart';
import 'package:places/domain/coordonate.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/strings/app_strings.dart';

/// Перечисление состояние поиска
enum SightSearchStatus {
  empty,
  waitingForMinChars,
  inProgress,
  done,
  notFound,
}

class SightWithSelection {
  Sight sight;
  Iterable<RegExpMatch> mathes;

  SightWithSelection(this.sight, this.mathes);
}

/// Модель для поиска мест
class SightSearchProvider extends ChangeNotifier {
  late final List<Sight> _searchedHistory;
  late final List<SightWithSelection> _foundedSights;
  final _minCharsForSearching = 2;
  // TODO(me): after adding a repository, delete
  final _emulateLoading = true;

  SightSearchStatus get status => _status;
  List<Sight> get searchedHistory => _searchedHistory;
  List<SightWithSelection> get foundedSights => _foundedSights;

  late SightSearchStatus _status;
  String _searchingValue = '';

  SightSearchProvider() {
    _searchedHistory = mocksSightSearchedHistory;
    _foundedSights = [];
    _status = SightSearchStatus.empty;
  }

  void addSearchedWordToHistory(Sight sight) {
    if (_searchedHistory.contains(sight)) {
      return;
    }
    _searchedHistory.add(sight);
  }

  void deleteItemFromSearchedHistory(int id) {
    _searchedHistory.removeAt(id);
    notifyListeners();
  }

  void clearSearchedHistory() {
    _searchedHistory.clear();
    notifyListeners();
  }

  String? isValidSearchingValue() {
    return _searchingValue.length < _minCharsForSearching
        ? AppStrings.errorMinLenghtForSearching
            .replaceAll('{minValue}', _minCharsForSearching.toString())
        : null;
  }

  // ignore: long-method
  Future<void> searchSights(String valueForSearch) async {
    _searchingValue = valueForSearch;
    final oldStatus = _status;

    _status = valueForSearch.isEmpty
        ? SightSearchStatus.empty
        : isValidSearchingValue() == null
            ? SightSearchStatus.inProgress
            : SightSearchStatus.waitingForMinChars;

    if (_status == SightSearchStatus.empty ||
        _status == SightSearchStatus.waitingForMinChars) {
      if (oldStatus != _status) {
        notifyListeners();
      }

      return;
    }

    notifyListeners();

    if (_emulateLoading) {
      await Future.delayed(const Duration(seconds: 1), () => Future);
    }

    if (_foundedSights.isNotEmpty) {
      _foundedSights.clear();
    }

    if (mocksSelectedSightType.isNotEmpty) {
      final regExpresion = RegExp('($valueForSearch)+', caseSensitive: false);
      for (var i = 0; i < mocks.length; i++) {
        final sight = mocks[i];
        final mathes = regExpresion.allMatches(sight.name);
        if (mathes.isEmpty) {
          continue;
        }
        final hasSightType = mocksSelectedSightType.any((sightType) {
          if (sightType.id != sight.type.id) {
            return false;
          }
          final distance = Coordonate.distanceBetween(
            mocksCurrentLocation,
            Coordonate(sight.lat, sight.lon),
          );

          return distance >= mocksStartSightDistance &&
              distance <= mocksEndSightDistance;
        });
        if (!hasSightType) {
          continue;
        }
        _foundedSights.add(SightWithSelection(sight, mathes));
      }
    }
    _status = _foundedSights.isEmpty
        ? SightSearchStatus.notFound
        : SightSearchStatus.done;

    if (_searchingValue == valueForSearch) {
      notifyListeners();
    }
  }
}
