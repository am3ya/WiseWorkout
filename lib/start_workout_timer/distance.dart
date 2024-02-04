import 'package:geolocator/geolocator.dart';
import 'dart:async';

class DistanceTracker {
  late bool _isTracking;
  late double _totalDistance;
  Position? _lastPosition;
  late Timer _distanceUpdateTimer;
  static const int _updateInterval = 1;
  final void Function(double) onUpdateLiveDistance;
  static const double _distanceThreshold = 0.01;
  bool _isPaused = false;

  DistanceTracker({required this.onUpdateLiveDistance}) {
    _isTracking = false;
    _totalDistance = 0.0;
    _lastPosition = null;
  }

  // Start tracking live distance.
  void startTracking() {
    if (!_isTracking) {
      _isTracking = true;

      // Initialize the last known position.
      _determinePosition().then((position) {
        if (position != null) {
          _lastPosition = position;
        }
      });

      // Set up a timer to update live distance at regular intervals.
      _distanceUpdateTimer = Timer.periodic(
        Duration(seconds: _updateInterval),
        (Timer timer) {
          _updateLiveDistance();
        },
      );
    }
  }

  // Stop tracking live distance.
  void stopTracking() {
    if (_isTracking) {
      _isTracking = false;
      _distanceUpdateTimer.cancel();
      _totalDistance = 0.0;
    }
  }



  void pauseTracking() {
    _isPaused = true;
  }

  void resumeTracking() {
    _isPaused = false;
  }

  Future<void> _updateLiveDistance() async {
    Position? currentPosition = await _determinePosition();
    if (_isPaused) {
      return; // Do not update distance if tracking is paused
    }

    if (currentPosition != null && _lastPosition != null) {
      double distanceInMeters = Geolocator.distanceBetween(
        _lastPosition!.latitude,
        _lastPosition!.longitude,
        currentPosition.latitude,
        currentPosition.longitude,
      ).floorToDouble();

      // Convert distance from meters to kilometers
      double distanceInKilometers = distanceInMeters / 1000.0;

      if (distanceInKilometers >= _distanceThreshold) {
        // Only update distance if the change is above the threshold
        _totalDistance += distanceInKilometers;
        _lastPosition = currentPosition;

        print('Live Distance: ${_totalDistance.toStringAsFixed(2)} kilometers');

        // Call the callback function to update the UI with the live distance
        onUpdateLiveDistance(_totalDistance);
      }
    }
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted, and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  /// Get the last known position of the device.
  ///
  /// Returns `null` if no position is available.
  Future<Position?> getLastKnownPosition() async {
    return await Geolocator.getLastKnownPosition();
  }

  double calculateDistance(
      double startLatitude, double startLongitude, double endLatitude, double endLongitude) {
    return Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);
  }

  /*void manuallyUpdateLiveDistance() {
    _updateLiveDistance();
  }*/
}