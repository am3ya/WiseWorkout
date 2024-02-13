import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_about_page_model.dart';
export 'view_about_page_model.dart';

class ViewAboutPageWidget extends StatefulWidget {
  const ViewAboutPageWidget({super.key});

  @override
  State<ViewAboutPageWidget> createState() => _ViewAboutPageWidgetState();
}

class _ViewAboutPageWidgetState extends State<ViewAboutPageWidget> {
  late ViewAboutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewAboutPageModel());
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<GlobalPropertiesRecord>>(
            stream: queryGlobalPropertiesRecord(
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<GlobalPropertiesRecord> columnGlobalPropertiesRecordList =
                  snapshot.data!;
              final columnGlobalPropertiesRecord =
                  columnGlobalPropertiesRecordList.isNotEmpty
                      ? columnGlobalPropertiesRecordList.first
                      : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Icon(
                        Icons.run_circle,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 60.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Welcome to wise workout',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                    child: Text(
                      'Your ultimate companion on your journey to a healthier and fitter you! We believe that fitness is not just a destination; it\'s a lifestyle. Whether you\'re a seasoned fitness enthusiast or just starting your wellness journey, our app is designed to empower you every step of the way.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowMediaDisplay(
                            path:
                                columnGlobalPropertiesRecord!.landingPageMedia[
                                    random_data.randomInteger(
                                        0,
                                        functions.minusOne(
                                            columnGlobalPropertiesRecord!
                                                .landingPageMedia.length))],
                            imageBuilder: (path) => ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                path,
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            videoPlayerBuilder: (path) =>
                                FlutterFlowVideoPlayer(
                              path: path,
                              width: 300.0,
                              autoPlay: false,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('login');

                      setState(() {
                        FFAppState().showOnboard = false;
                      });
                    },
                    text: 'Go to login',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge,
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
