import 'dart:async';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';


class CalorieTracker {
  double weight = currentUserDocument!.weight; // Example weight, this should be dynamically set
  double metRunning = 7.0;
  double metWalking = 3.3;
  Timer? periodicCheckTimer;
  double caloriesBurned = 0.0;
  bool isPaused = false; // To manage pause/resume state
  bool isTracking = false; // To manage whether tracking has started
  final bool Function() getIsRunning;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final Function(double) onCaloriesUpdated;

  CalorieTracker({required this.onCaloriesUpdated, required this.getIsRunning});

  void startCalorieTracking() {
    if (!isTracking) { // Check if tracking hasn't started yet
      isTracking = true; // Mark as tracking started
      isPaused = false; // Ensure tracking isn't paused

      periodicCheckTimer = Timer.periodic(Duration(seconds: 60), (Timer timer) {
        if (!isPaused) { // Only calculate and update calories if not paused
          _calculateAndUpdateCalories();
        }
      });
    }
  }

  void _calculateAndUpdateCalories() {
    bool isRunning = getIsRunning();
    double metValue = isRunning ? metRunning : metWalking;
    double caloriesBurnedPerMin = (metValue * 3.5 * weight / 200);

    caloriesBurned += caloriesBurnedPerMin;
    onCaloriesUpdated(caloriesBurned);
  }

  void pauseTracking() {
    isPaused = true;
    // No need to cancel the timer here; just prevent updates during pause
  }

  void resumeTracking() {
    isPaused = false;
    // No additional timer setup required; the existing timer handles resume
  }

  void stopCalorieTracking() {
    isTracking = false; // Mark tracking as stopped
    periodicCheckTimer?.cancel();
    periodicCheckTimer = null;
    caloriesBurned = 0.0;
    isPaused = false; // Reset pause state
  }
}