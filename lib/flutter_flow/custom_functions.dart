import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String vecesAlDia(String numero) {
  String temporal = "";
  if (numero == "1") {
    temporal = " vez al día";
  } else {
    temporal = "veces al día";
  }
  return temporal;
}

String intervaloDeHoras(String numero) {
  var temporal = int.parse(numero);
  var intervalo = 24 / temporal;
  String intervaloDefinido = intervalo.toStringAsFixed(0);
  return intervaloDefinido;
}

String selectorMinutos(String hora) {
  var temporal = "";
  if (hora != "") {
    temporal = "00";
  } else {
    temporal = "";
  }
  return temporal;
}

String selectorHora(String hora) {
  var temporal = "";
  var horaInt = int.parse(hora);
  if (horaInt > 12) {
    horaInt = 12;
  }
  temporal = horaInt.toString();
  return temporal;
}

List<String> presentacionMedicamento(String number) {
  List<String> temporal = [];
  var numberTemporal = double.parse(number);
  if (numberTemporal > 1) {
    temporal = ["pastillas", "cápsulas"];
  } else {
    temporal = ["pastilla", "cápsula"];
  }
  return temporal;
}
