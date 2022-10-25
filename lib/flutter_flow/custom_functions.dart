import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String sumRun(
  String? lenOfRun,
  String? verticalFromPanel,
  String? verticalFromCharger,
) {
  lenOfRun = lenOfRun ?? "0";
  verticalFromPanel = verticalFromPanel ?? "0";
  verticalFromCharger = verticalFromCharger ?? "0";

  if (lenOfRun == "null") lenOfRun = "0";
  if (verticalFromPanel == "null") verticalFromPanel = "0";
  if (verticalFromCharger == "null") verticalFromCharger = "0";

  return (double.parse(lenOfRun) +
          double.parse(verticalFromPanel) +
          double.parse(verticalFromCharger))
      .toStringAsFixed(2);
}

String removeZeros(String? valor) {
  // Add your function code here!

  return int.parse(valor ?? '').toString();
}

String? getHourFormString(String? date) {
  var parsedDate = DateTime.parse(date ?? '');
  String hour = DateFormat('hh:mm a').format(parsedDate);

  return hour;
}

String? getDateFromString(String? date) {
  // Add your function code here!
  var parsedDate = DateTime.parse(date ?? '');

  final DateFormat formatter = DateFormat('MM/dd/yyyy');
  final String formatted = formatter.format(parsedDate);

  return formatted;
}

List<dynamic> filterAppoimentList(
  List<dynamic> json,
  String? filtro,
) {
  // Add your function code here!
  var list = [];

  try {
    //
    for (var element in json) {
      if (element['status'] == filtro) {
        list.add(element);
      }

      //list.add(element['status'].toString());
    }
    //
  } catch (e) {
    return [];
  }
  //
  return list;
}

bool validateAddress(String? street) {
  // Add your function code here!

  if (street == "null") return true;

  return false;
}

String getUrlStaticMap(
  String chargerLatLen,
  String panelLatLen,
  List<dynamic> routes,
) {
  List routesLat = [];
  List routeslen = [];

  try {
    for (var e in routes) {
      routesLat.add(e['lat']);
      routeslen.add(e['lng']);
    }
  } catch (e) {
    return "";
  }

  String url = "";
  String x1Charger = chargerLatLen.split(",").first;
  String y1Charger = chargerLatLen.split(",").last;
  String x2Panel = panelLatLen.split(",").first;
  String y2Panel = panelLatLen.split(",").last;
  double centerX = (double.parse(x1Charger) + double.parse(x2Panel)) / 2;
  double centerY = (double.parse(y1Charger) + double.parse(y2Panel)) / 2;
  String centerMap = centerX.toString() + ',' + centerY.toString();

  String rutas = "";

  for (var i = 0; i < routesLat.length; i++) {
    // TO DO
    rutas =
        rutas + "|" + routesLat[i].toString() + "," + routeslen[i].toString();
  }

  url = """https://maps.googleapis.com/maps/api/staticmap?center=$centerMap
               &size=400x400
               &zoom=20
               &maptype=satellite
               &markers=icon:https://storage.googleapis.com/wattlogic-public/img/charger.png|$chargerLatLen
               &markers=icon:https://storage.googleapis.com/wattlogic-public/img/panel.png|$panelLatLen
               &path=weight:4|color:red$rutas
               &key=AIzaSyCuqGNkHCXyyZAXigdDnKK2tJuqiXIHl3U""";

  return url;
}

String sumChangeOrder(
  String material,
  String labor,
  String tax,
) {
  if (material == "") material = "0";
  if (labor == "") labor = "0";
  if (tax == "") tax = "0";

  return (double.parse(material) + double.parse(labor) + double.parse(tax))
      .toStringAsFixed(2);
}

List<String> addURLtoList(
  int index,
  String url,
  List<String> currentlist,
) {
  // Add your function code here!

  final aux = currentlist;
  try {
    currentlist[index] = url;
    return currentlist;
  } catch (e) {
    return aux;
  }
}

String getUrlFromList(
  List<String> list,
  int index,
) {
  // Add your function code here!

  return list[index];
}

List<String> deletUrlFromList(
  int index,
  List<String> list,
) {
  // Add your function code here!
  list[index] = "void";

  return list;
}

bool isThereUrlList(
  int index,
  List<String> list,
) {
  // Add your function code here!

  if (list[index] == "void" || list[index] == "inicial") {
    return false;
  } else {
    return true;
  }
}

bool checkPhotosForm(List<String> list) {
  // Add your function code here!

  var x = 0;
  for (var element in list) {
    if (element == "void" || element == "inicial") {
      x++;
    }
  }

  if (x > 0) {
    return false;
  }
  return true;
}

int milisecondsToMinutes(int miliseconds) {
  return miliseconds ~/ 60000;
}

String intToString(int number) {
  return number.toString();
}

String getStringPhotosFromList(List<String> list) {
  // Add your function code here!

  var result = "";
  for (var element in list) {
    result = "$result,$element";
  }

  return result;
}
