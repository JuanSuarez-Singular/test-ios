// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

Future<bool> signatureFunction(
  String signUrl,
  String agreement,
  String name,
) async {
  try {
    ScreenshotController screenshotController = ScreenshotController();

    final response = await get(Uri.parse(signUrl));

    final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, 'imagetest.png'));

    file.writeAsBytesSync(response.bodyBytes);

    final image = await screenshotController.captureFromWidget(
      Container(
        color: Colors.white,
        height: 600,
        width: 400,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(agreement, style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            Expanded(
              child: Image.file(
                file,
                //height: 400,
                width: 400,
              ),
            )
          ],
        ),
      ),
    );

    final storageRef = FirebaseStorage.instance.ref().child('signs/$name.png');

    final result = await storageRef.putData(image /* , metadata */);
    return /* file.path */ /* "" */ true;
  } catch (e) {
    return false;
  }
}
