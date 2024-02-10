import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'challenge_result_page_widget.dart' show ChallengeResultPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ChallengeResultPageModel
    extends FlutterFlowModel<ChallengeResultPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for theirSteps widget.
  FocusNode? theirStepsFocusNode;
  TextEditingController? theirStepsController;
  String? Function(BuildContext, String?)? theirStepsControllerValidator;
  // State field(s) for yourSteps widget.
  FocusNode? yourStepsFocusNode;
  TextEditingController? yourStepsController;
  String? Function(BuildContext, String?)? yourStepsControllerValidator;
  // State field(s) for createdTime widget.
  FocusNode? createdTimeFocusNode;
  TextEditingController? createdTimeController;
  String? Function(BuildContext, String?)? createdTimeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    theirStepsFocusNode?.dispose();
    theirStepsController?.dispose();

    yourStepsFocusNode?.dispose();
    yourStepsController?.dispose();

    createdTimeFocusNode?.dispose();
    createdTimeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
