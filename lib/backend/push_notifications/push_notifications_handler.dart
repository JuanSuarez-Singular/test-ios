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
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
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
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'LogIn': (data) async => LogInWidget(),
  'Support': (data) async => NavBarPage(initialPage: 'Support'),
  'Profile': (data) async => NavBarPage(initialPage: 'Profile'),
  'Appointments': (data) async => AppointmentsWidget(),
  'KnowledgeBase': (data) async => KnowledgeBaseWidget(),
  'VerifyCode': (data) async => VerifyCodeWidget(),
  'InstallationTaskList1': (data) async => InstallationTaskList1Widget(),
  'CostumerSatisfied': (data) async => CostumerSatisfiedWidget(),
  'InstallationTaskList': (data) async => InstallationTaskListWidget(),
  'RescheduleAppointment': (data) async => RescheduleAppointmentWidget(),
  'CreateAccount': (data) async => CreateAccountWidget(),
  'InstallStatus': (data) async => InstallStatusWidget(),
  'CustomerSign-Off': (data) async => CustomerSignOffWidget(),
  'VerifyInstall': (data) async => VerifyInstallWidget(),
  'Startpage': (data) async => StartpageWidget(),
  'ProjectInformation': (data) async => ProjectInformationWidget(),
  'CustomerSign-Off3': (data) async => CustomerSignOff3Widget(),
  'CustomerSign-Off2': (data) async => CustomerSignOff2Widget(),
  'ChangeOrder': (data) async => ChangeOrderWidget(),
  'InstallationConfirmation': (data) async => InstallationConfirmationWidget(),
  'AppointmentsOnMyWay': (data) async => AppointmentsOnMyWayWidget(
        appId: getParameter(data, 'appId'),
        customer: getParameter(data, 'customer'),
        dateInstall: getParameter(data, 'dateInstall'),
        hourInstall: getParameter(data, 'hourInstall'),
        street: getParameter(data, 'street'),
        city: getParameter(data, 'city'),
        state: getParameter(data, 'state'),
        zip: getParameter(data, 'zip'),
        lenOfRun: getParameter(data, 'lenOfRun'),
        verticalRunPanel: getParameter(data, 'verticalRunPanel'),
        verticalRunCharger: getParameter(data, 'verticalRunCharger'),
        totalDistance: getParameter(data, 'totalDistance'),
        chargerLocation: getParameter(data, 'chargerLocation'),
        panelLocation: getParameter(data, 'panelLocation'),
        panelInside: getParameter(data, 'panelInside'),
        chargerId: getParameter(data, 'chargerId'),
        chargerTitle: getParameter(data, 'chargerTitle'),
        ev: getParameter(data, 'ev'),
        chargerLocationDesc: getParameter(data, 'chargerLocationDesc'),
        propertyType: getParameter(data, 'propertyType'),
        urlStaticMap: getParameter(data, 'urlStaticMap'),
      ),
  'UnableToCompleteWork': (data) async => UnableToCompleteWorkWidget(),
  'Installation': (data) async => InstallationWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
