import 'package:flutter/foundation.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/utils/input_validator.dart';

/// Модель для оповещения изминений в форме редактирования мест
class FormEditSightProvider extends ChangeNotifier {
  String get name => _name;
  String get sightTypeId => _sightTypeId;
  String get description => _description;
  double? get lat => _lat;
  double? get long => _long;
  bool get isValidFormData => _isValidFormData;
  List<String> get imageList => _imageList;
  String? get sightTypeName => SightType.getById(_sightTypeId)?.name;

  set name(String name) {
    _name = name;
    isValidAllData();
  }

  set sightTypeId(String sightTypeId) {
    _sightTypeId = sightTypeId;
    isValidAllData();
  }

  set description(String description) {
    _description = description;
    isValidAllData();
  }

  List<String> _imageList = [];
  String _name = '';
  String _sightTypeId = '';
  String _description = '';
  double? _lat;
  double? _long;
  bool _isValidFormData = false;
  int _imageAddCounterForTesting = 0;

  void addImage(String image) {
    if (image.isEmpty || _imageList.contains(image)) {
      return;
    }
    _imageAddCounterForTesting++;
    _imageList = [..._imageList, '${image}_$_imageAddCounterForTesting'];
    isValidAllData();
  }

  void deleteImage(String image) {
    _imageList = [..._imageList];
    _imageList.remove(image);
    isValidAllData();
  }

  void setLat(String lat) {
    _lat = double.tryParse(lat);
    isValidAllData();
  }

  void setLong(String long) {
    _long = double.tryParse(long);
    isValidAllData();
  }

  String? validationName() {
    return InputValidator.isValidString(_name, minLenght: 5, maxLenght: 150);
  }

  String? validationDescription() {
    return InputValidator.isValidString(
      _description,
      minLenght: 50,
      maxLenght: 1000,
    );
  }

  String? validationSightType() {
    final validationString = InputValidator.isValidString(_sightTypeId);
    if (validationString != null) {
      return validationString;
    }
    if (!SightType.list.any((element) => element.id == _sightTypeId)) {
      return AppStrings.errorInvalidDataField;
    }

    return null;
  }

  String? validationLat() {
    return InputValidator.isValidNumber(
      _lat.toString(),
      minValue: -90,
      maxValue: 90,
    );
  }

  String? validationLong() {
    return InputValidator.isValidNumber(
      _long.toString(),
      minValue: -180,
      maxValue: 180,
    );
  }

  bool isValidAllData() {
    _isValidFormData = _imageList.isNotEmpty &&
        validationName() == null &&
        validationSightType() == null &&
        validationDescription() == null &&
        validationLat() == null &&
        validationLong() == null;
    notifyListeners();

    return _isValidFormData;
  }
}
