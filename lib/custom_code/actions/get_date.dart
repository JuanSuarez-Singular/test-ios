// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> getDate(String? date) async {
  // Add your function code here!

  var parsedDate = DateTime.parse(date ?? '');
  String hour = DateFormat('hh:mm a').format(parsedDate);

  return hour;
}
