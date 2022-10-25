// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_auth/firebase_auth.dart';

Future signInWithEmailLink(String userEmail) async {
  await FirebaseAuth.instance
      .sendSignInLinkToEmail(
          email: userEmail,
          actionCodeSettings: ActionCodeSettings(
            url: "https://wattlogic.page.link/",
            handleCodeInApp: true,
            androidPackageName: "com.wattlogic.app",
            androidMinimumVersion: "1",
          ))
      .then((value) {
    print("email sent");
  });
}
