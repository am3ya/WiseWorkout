import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/error_occured_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_tips_page_widget.dart' show CreateTipsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTipsPageModel extends FlutterFlowModel<CreateTipsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ageGroup widget.
  String? ageGroupValue;
  FormFieldController<String>? ageGroupValueController;
  // State field(s) for bmiGroup widget.
  String? bmiGroupValue;
  FormFieldController<String>? bmiGroupValueController;
  // State field(s) for fitnessGoal widget.
  String? fitnessGoalValue;
  FormFieldController<String>? fitnessGoalValueController;
  // State field(s) for adviceString widget.
  FocusNode? adviceStringFocusNode;
  TextEditingController? adviceStringController;
  String? Function(BuildContext, String?)? adviceStringControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    adviceStringFocusNode?.dispose();
    adviceStringController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
