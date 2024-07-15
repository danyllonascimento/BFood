// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:window_location_href/window_location_href.dart';

Future<MesaEstaStruct?> recuperarMesaEstabelecimento() async {
  String url = "${href}";
  Uri uri = Uri.parse(url);
  String? idMesa = uri.queryParameters['mesa'];
  String? idEsta = uri.queryParameters['esta'];

  return MesaEstaStruct(idMesa: idMesa, isEsta: idEsta);
}
