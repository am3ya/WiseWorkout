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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'getting_challenged_timer_model.dart';
export 'getting_challenged_timer_model.dart';

class GettingChallengedTimerWidget extends StatefulWidget {
  const GettingChallengedTimerWidget({super.key});

  @override
  State<GettingChallengedTimerWidget> createState() =>
      _GettingChallengedTimerWidgetState();
}

class _GettingChallengedTimerWidgetState
    extends State<GettingChallengedTimerWidget> {
  late GettingChallengedTimerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GettingChallengedTimerModel());

    _model.stepsTextFieldController ??= TextEditingController();
    _model.stepsTextFieldFocusNode ??= FocusNode();

    _model.distanceTextFieldController ??= TextEditingController();
    _model.distanceTextFieldFocusNode ??= FocusNode();

    _model.speedTextFieldController ??= TextEditingController();
    _model.speedTextFieldFocusNode ??= FocusNode();

    _model.caloriesTextFieldController ??= TextEditingController();
    _model.caloriesTextFieldFocusNode ??= FocusNode();

    _model.targetTextFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.calorieDifference, 0.0)
            .toString());
    _model.targetTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<ChallengesRecord>(
      stream: ChallengesRecord.getDocument(FFAppState().challengeRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final gettingChallengedTimerChallengesRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: (_model.timerMilliseconds < 1740000)
                      ? null
                      : () async {
                          FFAppState().friendName = '';
                          FFAppState().friendRef = null;

                          context.pushNamed('challengeFriendsPage');
                        },
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 386.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            70.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Steps',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            102.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Distance (km)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.stepsTextFieldController,
                                            focusNode:
                                                _model.stepsTextFieldFocusNode,
                                            autofocus: true,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.center,
                                            validator: _model
                                                .stepsTextFieldControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .distanceTextFieldController,
                                            focusNode: _model
                                                .distanceTextFieldFocusNode,
                                            autofocus: true,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.center,
                                            validator: _model
                                                .distanceTextFieldControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 386.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Pace (min/km)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            50.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Calories (kcal)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.speedTextFieldController,
                                            focusNode:
                                                _model.speedTextFieldFocusNode,
                                            autofocus: true,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.center,
                                            validator: _model
                                                .speedTextFieldControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .caloriesTextFieldController,
                                            focusNode: _model
                                                .caloriesTextFieldFocusNode,
                                            autofocus: true,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.center,
                                            validator: _model
                                                .caloriesTextFieldControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 386.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            125.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Calorie target',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ExplainCalorieDifferenceWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Icon(
                                          Icons.info,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => TextFormField(
                                              controller: _model
                                                  .targetTextFieldController,
                                              focusNode: _model
                                                  .targetTextFieldFocusNode,
                                              autofocus: true,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              textAlign: TextAlign.center,
                                              validator: _model
                                                  .targetTextFieldControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  110.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Walking',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.walkingSwitchValue ??= true,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.walkingSwitchValue = newValue!);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).accent1,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            Text(
                              'Running',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Color(0x34111417),
                                  offset: Offset(0.0, -2.0),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 12.0, 15.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 24.0),
                                    child: FlutterFlowTimer(
                                      initialTime: _model.timerMilliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                      ),
                                      controller: _model.timerController,
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            90.0, 0.0, 60.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 30.0,
                                          borderWidth: 2.0,
                                          buttonSize: 60.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: Icon(
                                            Icons.play_arrow_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 36.0,
                                          ),
                                          onPressed: () async {
                                            _model.timerController
                                                .onStartTimer();
                                          },
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: 30.0,
                                        borderWidth: 2.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.stop,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          _model.timerController.onStopTimer();
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hold end challenge to see your results.',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 44.0),
                                    child: StreamBuilder<List<WorkoutsRecord>>(
                                      stream: queryWorkoutsRecord(
                                        parent: currentUserReference,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<WorkoutsRecord>
                                            buttonWorkoutsRecordList =
                                            snapshot.data!;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onLongPress: () async {
                                            FFAppState().stepCount = int.parse(
                                                _model.stepsTextFieldController
                                                    .text);
                                            FFAppState().todaysDate =
                                                getCurrentTimestamp;
                                            FFAppState().distance =
                                                double.parse(_model
                                                    .distanceTextFieldController
                                                    .text);
                                            FFAppState().caloriesBurned =
                                                double.parse(_model
                                                    .caloriesTextFieldController
                                                    .text);
                                            FFAppState().workoutTime =
                                                _model.timerMilliseconds;
                                            if (FFAppState().stepCount >
                                                gettingChallengedTimerChallengesRecord
                                                    .challengerSteps) {
                                              await gettingChallengedTimerChallengesRecord
                                                  .reference
                                                  .update(
                                                      createChallengesRecordData(
                                                winner: currentUserReference,
                                                loser: FFAppState().friendRef,
                                                gettingChallengedSteps:
                                                    FFAppState().stepCount,
                                                loserName:
                                                    FFAppState().friendName,
                                                winnerName:
                                                    currentUserDisplayName,
                                                status: 'closed',
                                                winnerPFP: currentUserPhoto,
                                                loserPFP:
                                                    gettingChallengedTimerChallengesRecord
                                                        .challengerPFP,
                                              ));

                                              await currentUserReference!
                                                  .update({
                                                ...createUsersRecordData(
                                                  winPercentage: functions
                                                      .calculateWinPercentage(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.wins,
                                                              0),
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.draws,
                                                              0),
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.losses,
                                                              0)),
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'wins':
                                                        FieldValue.increment(1),
                                                    'credits':
                                                        FieldValue.increment(2),
                                                  },
                                                ),
                                              });

                                              await gettingChallengedTimerChallengesRecord
                                                  .challengerRef!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'losses':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                            } else {
                                              if (FFAppState().stepCount <
                                                  gettingChallengedTimerChallengesRecord
                                                      .challengerSteps) {
                                                await gettingChallengedTimerChallengesRecord
                                                    .reference
                                                    .update(
                                                        createChallengesRecordData(
                                                  winner:
                                                      FFAppState().friendRef,
                                                  loser: currentUserReference,
                                                  gettingChallengedSteps:
                                                      FFAppState().stepCount,
                                                  loserName:
                                                      currentUserDisplayName,
                                                  winnerName:
                                                      FFAppState().friendName,
                                                  status: 'closed',
                                                  winnerPFP:
                                                      gettingChallengedTimerChallengesRecord
                                                          .challengerPFP,
                                                  loserPFP: currentUserPhoto,
                                                ));

                                                await currentUserReference!
                                                    .update({
                                                  ...createUsersRecordData(
                                                    winPercentage: functions
                                                        .calculateWinPercentage(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.wins,
                                                                0),
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.draws,
                                                                0),
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.losses,
                                                                0)),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'losses':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });

                                                await gettingChallengedTimerChallengesRecord
                                                    .challengerRef!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'wins':
                                                          FieldValue.increment(
                                                              1),
                                                      'credits':
                                                          FieldValue.increment(
                                                              2),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                if (FFAppState().stepCount ==
                                                    gettingChallengedTimerChallengesRecord
                                                        .challengerSteps) {
                                                  await gettingChallengedTimerChallengesRecord
                                                      .reference
                                                      .update({
                                                    ...createChallengesRecordData(
                                                      gettingChallengedSteps:
                                                          FFAppState()
                                                              .stepCount,
                                                      status: 'closed',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'draw': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                        'drawNames': FieldValue
                                                            .arrayUnion([
                                                          currentUserDisplayName
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await gettingChallengedTimerChallengesRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'draw': FieldValue
                                                            .arrayUnion([
                                                          gettingChallengedTimerChallengesRecord
                                                              .challengerRef
                                                        ]),
                                                        'drawNames': FieldValue
                                                            .arrayUnion([
                                                          FFAppState()
                                                              .friendName
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...createUsersRecordData(
                                                      winPercentage: functions
                                                          .calculateWinPercentage(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.wins,
                                                                  0),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.draws,
                                                                  0),
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.losses,
                                                                  0)),
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'draws': FieldValue
                                                            .increment(1),
                                                        'credits': FieldValue
                                                            .increment(1),
                                                      },
                                                    ),
                                                  });

                                                  await gettingChallengedTimerChallengesRecord
                                                      .challengerRef!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'draws': FieldValue
                                                            .increment(1),
                                                        'credits': FieldValue
                                                            .increment(1),
                                                      },
                                                    ),
                                                  });
                                                }
                                              }
                                            }

                                            if (buttonWorkoutsRecordList
                                                    .length >
                                                0) {
                                              if (buttonWorkoutsRecordList
                                                      .last.dateUploaded ==
                                                  getCurrentTimestamp) {
                                                await buttonWorkoutsRecordList
                                                    .last.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'duration':
                                                          FieldValue.increment(
                                                              FFAppState()
                                                                  .workoutTime
                                                                  .toDouble()),
                                                      'stepsTaken':
                                                          FieldValue.increment(
                                                              FFAppState()
                                                                  .stepCount),
                                                      'caloriesBurned':
                                                          FieldValue.increment(
                                                              FFAppState()
                                                                  .caloriesBurned),
                                                      'distance':
                                                          FieldValue.increment(
                                                              FFAppState()
                                                                  .distance),
                                                      'last_updated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'calorieDifference':
                                                          FieldValue.increment(
                                                              -(FFAppState()
                                                                  .caloriesBurned)),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                await WorkoutsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createWorkoutsRecordData(
                                                    duration: FFAppState()
                                                        .workoutTime
                                                        .toDouble(),
                                                    stepsTaken:
                                                        FFAppState().stepCount,
                                                    caloriesBurned: FFAppState()
                                                        .caloriesBurned,
                                                    distance:
                                                        FFAppState().distance,
                                                    unixDays: functions
                                                        .daysSinceEpoch(),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'dateUploaded': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'calorieDifference':
                                                          FieldValue.increment(
                                                              -(FFAppState()
                                                                  .caloriesBurned)),
                                                    },
                                                  ),
                                                });
                                              }
                                            } else {
                                              await WorkoutsRecord.createDoc(
                                                      currentUserReference!)
                                                  .set({
                                                ...createWorkoutsRecordData(
                                                  duration: FFAppState()
                                                      .workoutTime
                                                      .toDouble(),
                                                  stepsTaken:
                                                      FFAppState().stepCount,
                                                  caloriesBurned: FFAppState()
                                                      .caloriesBurned,
                                                  distance:
                                                      FFAppState().distance,
                                                  unixDays: functions
                                                      .daysSinceEpoch(),
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'dateUploaded': FieldValue
                                                        .serverTimestamp(),
                                                    'last_updated': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'calorieDifference':
                                                        FieldValue.increment(
                                                            -(FFAppState()
                                                                .caloriesBurned)),
                                                  },
                                                ),
                                              });
                                            }

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You have completed the challenge. You can see the result on the challenge page.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));

                                            context.pushNamed('challengePage');
                                          },
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'End challenge',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
