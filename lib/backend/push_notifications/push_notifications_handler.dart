import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'login': ParameterData.none(),
  'history': ParameterData.none(),
  'userProfile': ParameterData.none(),
  'startworkout': ParameterData.none(),
  'ForgotPassword01': ParameterData.none(),
  'deleteAccount': ParameterData.none(),
  'searchPage': ParameterData.none(),
  'trialNewUserInfoPage': ParameterData.none(),
  'trialNewUserInterests': ParameterData.none(),
  'trialNewUserMetrics': ParameterData.none(),
  'friendsPage': ParameterData.none(),
  'editProfilePage': ParameterData.none(),
  'adminProfile': ParameterData.none(),
  'testCalendar': ParameterData.none(),
  'businessProfile': ParameterData.none(),
  'sendFeedback': ParameterData.none(),
  'businessEditProfile': ParameterData.none(),
  'viewAboutPage': ParameterData.none(),
  'adminSearchUsers': ParameterData.none(),
  'startWorkoutTimer': ParameterData.none(),
  'clubsPage': ParameterData.none(),
  'createClubPage': ParameterData.none(),
  'clubMembersPage': ParameterData.none(),
  'adminViewApplications': ParameterData.none(),
  'manageTips': ParameterData.none(),
  'editClubPage': ParameterData.none(),
  'createTipsPage': ParameterData.none(),
  'adminViewCategories': ParameterData.none(),
  'adminCreateCategory': ParameterData.none(),
  'challengeTimer': ParameterData.none(),
  'challengePage': ParameterData.none(),
  'challengeFriendsPage': ParameterData.none(),
  'gettingChallengedTimer': ParameterData.none(),
  'challengeResultPage': ParameterData.none(),
  'businessStoreFront': ParameterData.none(),
  'purchasesPage': ParameterData.none(),
  'addProductPage': ParameterData.none(),
  'favouriteBrandsPage': ParameterData.none(),
  'adminSearchClubs': ParameterData.none(),
  'leaderboardPage': ParameterData.none(),
  'landingPageMedia': ParameterData.none(),
  'addLandingPageMedia': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
