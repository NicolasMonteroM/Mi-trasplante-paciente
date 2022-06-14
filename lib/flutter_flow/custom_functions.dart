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
  var numberTemporal = 0.0;

  switch (number) {
    case "1/4":
      numberTemporal = 1 / 4;
      break;
    case "1/3":
      numberTemporal = 1 / 3;
      break;
    case "Mitad":
      numberTemporal = 1 / 2;
      break;
    default:
      numberTemporal = double.parse(number);
  }

  if (numberTemporal > 1) {
    temporal = ["pastillas", "cápsulas"];
  }
  if (numberTemporal < 1) {
    temporal = ["de pastilla"];
  }
  if (numberTemporal == 1) {
    temporal = ["pastilla", "cápsula"];
  }
  return temporal;
}

List<String> numeroDeTomas(String numero) {
  List<String> temporal = [];
  var numeroTemporal = int.parse(numero);
  for (int i = 0; i < numeroTemporal; i++) {
    temporal.add(i.toString());
  }
  return temporal;
}

bool imagenSubida(String imagen) {
  // if an image is uploaded return true
  if (imagen == null) {
    return false;
  } else {
    return true;
  }
}

String fechaSeleccionada(DateTime fecha) {
  // turn date into string
  DateFormat dateFormat = DateFormat.MMMMd('en_US');
  return dateFormat.format(fecha);
}

bool finalizacionSeleccionada(DateTime fecha) {
  // if date is selected return true
  if (fecha == null) {
    return false;
  }
  return true;
}

bool existeFinalizacion(DateTime fecha) {
  // if date is defined return true
  print("hola mundo77");
  if (fecha != null) {
    print("hola mundo88");
    return true;
  }
  return false;
}

DateTime diaSiguiente(DateTime diaActual) {
  // add an aditional day
  var hoy = diaActual;
  hoy.add(Duration(hours: 24));
  return hoy;
}

bool checkInputPosition(
  String selectedNumber,
  String inputPosition,
) {
  // turn the variables into integers and return true if they are equal
  var temporalNumber = int.parse(selectedNumber);
  var temporalPosition = int.parse(inputPosition);

  if (temporalNumber >= temporalPosition) {
    return true;
  } else if (temporalNumber < temporalPosition) {
    return false;
  }
}

List<DateTime> agregarHorasALista(
  DateTime hora1,
  DateTime hora2,
  DateTime hora3,
  DateTime hora4,
  DateTime hora5,
  DateTime hora6,
  DateTime hora7,
  DateTime hora8,
  DateTime hora9,
  DateTime hora10,
  DateTime hora11,
  DateTime hora12,
) {
  // add the variables to a list and check if they are empty
  List<DateTime> horas = [];
  if (hora1 != null) {
    DateTime hora = DateTime(hora1.hour, hora1.minute);
    horas.add(hora);
  }
  if (hora2 != null) {
    DateTime hora = DateTime(hora2.hour, hora2.minute);
    horas.add(hora);
  }
  if (hora3 != null) {
    DateTime hora = DateTime(hora3.hour, hora3.minute);
    horas.add(hora);
  }
  if (hora4 != null) {
    DateTime hora = DateTime(hora4.hour, hora4.minute);
    horas.add(hora);
  }
  if (hora5 != null) {
    DateTime hora = DateTime(hora5.hour, hora5.minute);
    horas.add(hora);
  }
  if (hora6 != null) {
    DateTime hora = DateTime(hora6.hour, hora6.minute);
    horas.add(hora);
  }
  if (hora7 != null) {
    DateTime hora = DateTime(hora7.hour, hora7.minute);
    horas.add(hora);
  }
  if (hora8 != null) {
    DateTime hora = DateTime(hora8.hour, hora8.minute);
    horas.add(hora);
  }
  if (hora9 != null) {
    DateTime hora = DateTime(hora9.hour, hora9.minute);
    horas.add(hora);
  }
  if (hora10 != null) {
    DateTime hora = DateTime(hora10.hour, hora10.minute);
    horas.add(hora);
  }
  if (hora11 != null) {
    DateTime hora = DateTime(hora11.hour, hora11.minute);
    horas.add(hora);
  }
  if (hora12 != null) {
    DateTime hora = DateTime(hora12.hour, hora12.minute);
    horas.add(hora);
  }

  return horas;
}

DateTimeRange rangoDeDia(DateTime inicioDeDia) {
  // add 24 hours to the day

  // DateTime temporal = inicioDeDia.add(const Duration(days: 1));
  DateTimeRange rango = DateTimeRange(
      start: inicioDeDia, end: inicioDeDia.add(const Duration(days: 1)));

  // String temporalInfo = '($temporal"+"$rango)';

  return rango;
}
