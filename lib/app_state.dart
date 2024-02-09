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

  double _dailyCalorieIntake = 0.0;
  double get dailyCalorieIntake => _dailyCalorieIntake;
  set dailyCalorieIntake(double _value) {
    _dailyCalorieIntake = _value;
  }

  double _timerState = 0.0;
  double get timerState => _timerState;
  set timerState(double _value) {
    _timerState = _value;
  }

  DateTime? _weekStart;
  DateTime? get weekStart => _weekStart;
  set weekStart(DateTime? _value) {
    _weekStart = _value;
  }

  DateTime? _todaysDate;
  DateTime? get todaysDate => _todaysDate;
  set todaysDate(DateTime? _value) {
    _todaysDate = _value;
  }

  int _stepCount = 0;
  int get stepCount => _stepCount;
  set stepCount(int _value) {
    _stepCount = _value;
  }

  double _distance = 0.0;
  double get distance => _distance;
  set distance(double _value) {
    _distance = _value;
  }

  double _caloriesBurned = 0.0;
  double get caloriesBurned => _caloriesBurned;
  set caloriesBurned(double _value) {
    _caloriesBurned = _value;
  }

  int _workoutTime = 0;
  int get workoutTime => _workoutTime;
  set workoutTime(int _value) {
    _workoutTime = _value;
  }

  int _unixDays = 0;
  int get unixDays => _unixDays;
  set unixDays(int _value) {
    _unixDays = _value;
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
