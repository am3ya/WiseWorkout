import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _showOnboard = prefs.getBool('ff_showOnboard') ?? _showOnboard;
    });
    _safeInit(() {
      _showInfoCollection =
          prefs.getBool('ff_showInfoCollection') ?? _showInfoCollection;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  WorkoutStruct _workout = WorkoutStruct();
  WorkoutStruct get workout => _workout;
  set workout(WorkoutStruct _value) {
    _workout = _value;
  }

  void updateWorkoutStruct(Function(WorkoutStruct) updateFn) {
    updateFn(_workout);
  }

  bool _showOnboard = true;
  bool get showOnboard => _showOnboard;
  set showOnboard(bool _value) {
    _showOnboard = _value;
    prefs.setBool('ff_showOnboard', _value);
  }

  bool _showInfoCollection = true;
  bool get showInfoCollection => _showInfoCollection;
  set showInfoCollection(bool _value) {
    _showInfoCollection = _value;
    prefs.setBool('ff_showInfoCollection', _value);
  }

  String _clubName = '';
  String get clubName => _clubName;
  set clubName(String _value) {
    _clubName = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
