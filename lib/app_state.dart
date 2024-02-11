import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  DocumentReference? _adviceRef =
      FirebaseFirestore.instance.doc('/advice/04V9yG0JaP6h3xL0BJif');
  DocumentReference? get adviceRef => _adviceRef;
  set adviceRef(DocumentReference? _value) {
    _adviceRef = _value;
  }

  String _brandName = '';
  String get brandName => _brandName;
  set brandName(String _value) {
    _brandName = _value;
  }

  String _friendName = '';
  String get friendName => _friendName;
  set friendName(String _value) {
    _friendName = _value;
  }

  DocumentReference? _friendRef;
  DocumentReference? get friendRef => _friendRef;
  set friendRef(DocumentReference? _value) {
    _friendRef = _value;
  }

  DocumentReference? _challengeRef;
  DocumentReference? get challengeRef => _challengeRef;
  set challengeRef(DocumentReference? _value) {
    _challengeRef = _value;
  }

  DocumentReference? _brandRef;
  DocumentReference? get brandRef => _brandRef;
  set brandRef(DocumentReference? _value) {
    _brandRef = _value;
  }
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
