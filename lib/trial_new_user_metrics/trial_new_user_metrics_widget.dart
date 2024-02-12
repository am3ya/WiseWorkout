import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/error_occured_widget.dart';
import '/components/intake_too_high_widget.dart';
import '/components/intake_too_low_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'trial_new_user_metrics_model.dart';
export 'trial_new_user_metrics_model.dart';

class TrialNewUserMetricsWidget extends StatefulWidget {
  const TrialNewUserMetricsWidget({super.key});

  @override
  State<TrialNewUserMetricsWidget> createState() =>
      _TrialNewUserMetricsWidgetState();
}

class _TrialNewUserMetricsWidgetState extends State<TrialNewUserMetricsWidget>
    with TickerProviderStateMixin {
  late TrialNewUserMetricsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrialNewUserMetricsModel());

    _model.textController1 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.age, 0) != null
            ? valueOrDefault(currentUserDocument?.age, 0).toString()
            : null);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.height, 0.0) != null
            ? valueOrDefault(currentUserDocument?.height, 0.0).toString()
            : null);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.weight, 0.0) != null
            ? valueOrDefault(currentUserDocument?.weight, 0.0).toString()
            : null);
    _model.textFieldFocusNode3 ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Welcome',
              style: FlutterFlowTheme.of(context).displaySmall,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'Page 3/3',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 12.0, 8.0, 0.0),
                          child: LinearPercentIndicator(
                            percent: 0.99,
                            width: MediaQuery.sizeOf(context).width * 0.96,
                            lineHeight: 12.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor: Color(0xFFE0E3E7),
                            barRadius: Radius.circular(24.0),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 100.0, 0.0, 0.0),
                          child: Text(
                            'Tell us about yourself',
                            style: FlutterFlowTheme.of(context).displaySmall,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Please enter your information below',
                            style: FlutterFlowTheme.of(context).labelLarge,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ),
                        Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Age (years): ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Enter age...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Height (cm): ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => TextFormField(
                                          controller: _model.textController2,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Enter height (cm)...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Weight (kg): ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode3,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Enter weight (kg)...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Gender: ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= valueOrDefault(
                                                        currentUserDocument
                                                            ?.gender,
                                                        '') !=
                                                    null &&
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.gender,
                                                        '') !=
                                                    ''
                                            ? valueOrDefault(
                                                currentUserDocument?.gender, '')
                                            : null,
                                      ),
                                      options: ['Male', 'Female'],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (functions.isEmpty(_model.textController1.text)) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ErrorOccuredWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            return;
                          } else {
                            if (functions
                                .isEmpty(_model.textController2.text)) {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ErrorOccuredWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              return;
                            } else {
                              if (functions
                                  .isEmpty(_model.textController3.text)) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ErrorOccuredWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                return;
                              } else {
                                if (!((_model.dropDownValue == 'Male') ||
                                    (_model.dropDownValue == 'Female'))) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ErrorOccuredWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  return;
                                }

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  age:
                                      int.tryParse(_model.textController1.text),
                                  height: double.tryParse(
                                      _model.textController2.text),
                                  weight: double.tryParse(
                                      _model.textController3.text),
                                  infoCollectionComplete: true,
                                  gender: _model.dropDownValue,
                                ));
                                if ((valueOrDefault(
                                            currentUserDocument?.age, 0) >=
                                        5) &&
                                    (valueOrDefault(
                                            currentUserDocument?.age, 0) <=
                                        12)) {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    ageGroup: 'Children (Ages 5-12)',
                                  ));
                                } else {
                                  if ((valueOrDefault(
                                              currentUserDocument?.age, 0) >=
                                          13) &&
                                      (valueOrDefault(
                                              currentUserDocument?.age, 0) <=
                                          18)) {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      ageGroup: 'Teenagers (Ages 13-18)',
                                    ));
                                  } else {
                                    if ((valueOrDefault(
                                                currentUserDocument?.age, 0) >=
                                            19) &&
                                        (valueOrDefault(
                                                currentUserDocument?.age, 0) <=
                                            30)) {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        ageGroup: 'Young Adults (Ages 19-30)',
                                      ));
                                    } else {
                                      if ((valueOrDefault(
                                                  currentUserDocument?.age,
                                                  0) >=
                                              31) &&
                                          (valueOrDefault(
                                                  currentUserDocument?.age,
                                                  0) <=
                                              60)) {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          ageGroup: 'Adults (Ages 31-60)',
                                        ));
                                      } else {
                                        if (valueOrDefault(
                                                currentUserDocument?.age, 0) >=
                                            61) {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            ageGroup:
                                                'Older Adults (Ages 61 and above)',
                                          ));
                                        }
                                      }
                                    }
                                  }
                                }

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  bmr: functions.calculateBMR(
                                      valueOrDefault(
                                          currentUserDocument?.gender, ''),
                                      valueOrDefault(
                                          currentUserDocument?.weight, 0.0),
                                      valueOrDefault(
                                          currentUserDocument?.height, 0.0),
                                      valueOrDefault(
                                          currentUserDocument?.age, 0)),
                                  bmi: functions.calculateBMI(
                                      valueOrDefault(
                                          currentUserDocument?.weight, 0.0),
                                      valueOrDefault(
                                          currentUserDocument?.height, 0.0)),
                                ));
                                if (valueOrDefault(
                                        currentUserDocument?.bmi, 0.0) <
                                    18.5) {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    bmiGroup: 'Underweight (<18.5)',
                                  ));
                                } else {
                                  if ((valueOrDefault(
                                              currentUserDocument?.bmi, 0.0) >=
                                          18.5) &&
                                      (valueOrDefault(
                                              currentUserDocument?.bmi, 0.0) <=
                                          24.9)) {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      bmiGroup: 'Normal weight (18.5-24.9)',
                                    ));
                                  } else {
                                    if ((valueOrDefault(
                                                currentUserDocument?.bmi,
                                                0.0) >=
                                            25.0) &&
                                        (valueOrDefault(
                                                currentUserDocument?.bmi,
                                                0.0) <=
                                            29.9)) {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        bmiGroup: 'Overweight (25.0-29.9)',
                                      ));
                                    } else {
                                      if (valueOrDefault(
                                              currentUserDocument?.bmi, 0.0) >=
                                          30.0) {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          bmiGroup: 'Obesity (30+)',
                                        ));
                                      }
                                    }
                                  }
                                }

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  tdee: functions.calculateTDEE(
                                      valueOrDefault(
                                          currentUserDocument?.howActive, ''),
                                      valueOrDefault(
                                          currentUserDocument?.bmr, 0.0)),
                                ));
                                if (valueOrDefault(
                                        currentUserDocument?.dailyCalorieIntake,
                                        0.0) ==
                                    0.0) {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    dailyCalorieIntake: functions
                                        .setDailyCalorieIntake(valueOrDefault(
                                            currentUserDocument?.tdee, 0.0)),
                                    dailyCalorieBurningGoal: 300.0,
                                  ));

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    calorieDifference: valueOrDefault(
                                        currentUserDocument
                                            ?.dailyCalorieBurningGoal,
                                        0.0),
                                    calorieDiffLastUpdate: getCurrentTimestamp,
                                  ));
                                  if (valueOrDefault(
                                          currentUserDocument?.fitnessGoal2,
                                          '') ==
                                      'Losing weight') {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'dailyCalorieBurningGoal':
                                              FieldValue.increment(100.0),
                                        },
                                      ),
                                    });

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      calorieDifference: valueOrDefault(
                                          currentUserDocument
                                              ?.dailyCalorieBurningGoal,
                                          0.0),
                                      calorieDiffLastUpdate:
                                          getCurrentTimestamp,
                                    ));
                                  }
                                } else {
                                  if (functions.intakeMinusTdee(
                                          valueOrDefault(
                                              currentUserDocument
                                                  ?.dailyCalorieIntake,
                                              0.0),
                                          valueOrDefault(
                                              currentUserDocument?.tdee,
                                              0.0)) ==
                                      'good') {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      dailyCalorieBurningGoal:
                                          functions.setDailyBurnGoal(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.dailyCalorieIntake,
                                                  0.0),
                                              valueOrDefault(
                                                  currentUserDocument?.tdee,
                                                  0.0)),
                                    ));

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      calorieDifference: valueOrDefault(
                                          currentUserDocument
                                              ?.dailyCalorieBurningGoal,
                                          0.0),
                                      calorieDiffLastUpdate:
                                          getCurrentTimestamp,
                                    ));
                                    if (valueOrDefault(
                                            currentUserDocument?.fitnessGoal2,
                                            '') ==
                                        'Losing weight') {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'dailyCalorieBurningGoal':
                                                FieldValue.increment(100.0),
                                          },
                                        ),
                                      });

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        calorieDifference: valueOrDefault(
                                            currentUserDocument
                                                ?.dailyCalorieBurningGoal,
                                            0.0),
                                        calorieDiffLastUpdate:
                                            getCurrentTimestamp,
                                      ));
                                    }
                                  } else {
                                    if ((functions.intakeMinusTdee(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.dailyCalorieIntake,
                                                    0.0),
                                                valueOrDefault(
                                                    currentUserDocument?.tdee,
                                                    0.0)) ==
                                            'intakeTooLittle') ||
                                        (functions.intakeMinusTdee(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.dailyCalorieIntake,
                                                    0.0),
                                                valueOrDefault(
                                                    currentUserDocument?.tdee,
                                                    0.0)) ==
                                            'differenceTooLittle')) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: IntakeTooLowWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      return;
                                    } else {
                                      if (functions.intakeMinusTdee(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.dailyCalorieIntake,
                                                  0.0),
                                              valueOrDefault(
                                                  currentUserDocument?.tdee,
                                                  0.0)) ==
                                          'intakeTooMuch') {
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
                                                child: IntakeTooHighWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        return;
                                      } else {
                                        return;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }

                          setState(() {
                            FFAppState().showInfoCollection = false;
                            FFAppState().weekStart = getCurrentTimestamp;
                          });

                          context.pushNamed(
                            'startworkout',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 200),
                              ),
                            },
                          );
                        },
                        text: 'Continue to workout',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}