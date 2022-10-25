// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionWidget extends StatefulWidget {
  const PermissionWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _PermissionWidgetState createState() => _PermissionWidgetState();
}

final cameraPermission = Permission.camera;
final photoLibraryPermission = Permission.photos;
final locationPermission = Permission.location;
final contactsPermission = Permission.contacts;
final notificationsPermission = Permission.notification;

class _PermissionWidgetState extends State<PermissionWidget> {
  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await customRequestPermission(cameraPermission);
      await customRequestPermission(photoLibraryPermission);
      await customRequestPermission(locationPermission);
      await customRequestPermission(contactsPermission);
      await customRequestPermission(notificationsPermission);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> customRequestPermission(Permission setting) async {
    if (kIsWeb) {
      return;
    }
    if (!await setting.isGranted) {
      final k = await setting.request();
    }
  }
}
