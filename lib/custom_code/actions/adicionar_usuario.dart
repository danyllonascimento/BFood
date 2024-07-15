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

import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// function para criar acesso para o app
Future<String> adicionarUsuario(
    String email,
    String senha,
    String nome,
    String photoUrl,
    DateTime createTime,
    bool admin,
    bool garcon,
    DocumentReference estabelecimento) async {
  String appName = gerarStringUnica(20);

  FirebaseApp app = await Firebase.initializeApp(
      name: appName, options: Firebase.app().options);

  try {
    // Criar usuário no Firebase Authentication
    UserCredential userCredential =
        await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );

    String userId = userCredential.user!.uid;

    // Adicionar informações na coleção "users" no Firebase Firestore
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'email': email,
      'display_name': nome,
      'created_time': createTime,
      'isAdmin': admin,
      'isGarcon': garcon,
      'uid': userId,
      'photo_url': photoUrl,
      'estabelecimentoRef': estabelecimento,
    });

    await app.delete();

    return userId;
  } catch (e) {
    return "";
  }
}

String gerarStringUnica(int comprimento) {
  const caracteresPermitidos = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  String stringAleatoria = '';

  for (int i = 0; i < comprimento; i++) {
    final indice = random.nextInt(caracteresPermitidos.length);
    stringAleatoria += caracteresPermitidos[indice];
    caracteresPermitidos.replaceRange(
        indice, indice + 1, ''); // Remover o caractere usado
  }

  return stringAleatoria;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
