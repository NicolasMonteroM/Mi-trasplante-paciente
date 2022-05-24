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