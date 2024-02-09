import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/explain_calorie_difference_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'start_workout_timer_widget.dart' show StartWorkoutTimerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartWorkoutTimerModel extends FlutterFlowModel<StartWorkoutTimerWidget> {
  ///  Local state fields for this page.

  int indexZero = 0;

  int indexSix = 6;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stepsTextField widget.
  FocusNode? stepsTextFieldFocusNode;
  TextEditingController? stepsTextFieldController;
  String? Function(BuildContext, String?)? stepsTextFieldControllerValidator;
  // State field(s) for distanceTextField widget.
  FocusNode? distanceTextFieldFocusNode;
  TextEditingController? distanceTextFieldController;
  String? Function(BuildContext, String?)? distanceTextFieldControllerValidator;
  // State field(s) for speedTextField widget.
  FocusNode? speedTextFieldFocusNode;
  TextEditingController? speedTextFieldController;
  String? Function(BuildContext, String?)? speedTextFieldControllerValidator;
  // State field(s) for caloriesTextField widget.
  FocusNode? caloriesTextFieldFocusNode;
  TextEditingController? caloriesTextFieldController;
  String? Function(BuildContext, String?)? caloriesTextFieldControllerValidator;
  // State field(s) for targetTextField widget.
  FocusNode? targetTextFieldFocusNode;
  TextEditingController? targetTextFieldController;
  String? Function(BuildContext, String?)? targetTextFieldControllerValidator;
  // State field(s) for walkingSwitch widget.
  bool? walkingSwitchValue;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    stepsTextFieldFocusNode?.dispose();
    stepsTextFieldController?.dispose();

    distanceTextFieldFocusNode?.dispose();
    distanceTextFieldController?.dispose();

    speedTextFieldFocusNode?.dispose();
    speedTextFieldController?.dispose();

    caloriesTextFieldFocusNode?.dispose();
    caloriesTextFieldController?.dispose();

    targetTextFieldFocusNode?.dispose();
    targetTextFieldController?.dispose();

    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
