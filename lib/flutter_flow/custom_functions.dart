import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference stringToCategoriaRef(
  String? referenceId,
  String? referenceEstabelecimento,
) {
  return FirebaseFirestore.instance
      .collection('estabelecimentos')
      .doc(referenceEstabelecimento)
      .collection('categorias')
      .doc(referenceId);
}

List<ProdutoAddStruct> editarProduto(
  ProdutoAddStruct produto,
  List<ProdutoAddStruct> produtos,
  int index,
) {
  for (var i = 0; i < produtos.length; i++) {
    if (i == index) {
      produtos[i] = produto;

      break;
    }
  }

  return produtos;
}

DocumentReference stringToMesaRef(
  String? referenceId,
  String? referenceEstabelecimento,
) {
  return FirebaseFirestore.instance
      .collection('estabelecimentos')
      .doc(referenceEstabelecimento)
      .collection('mesas')
      .doc(referenceId);
}

int verificarSeContem(
  DocumentReference produtoRef,
  List<ProdutoAddStruct> list,
) {
  int result = 999;

  for (var i = 0; i < list.length; i++) {
    if (list[i].produto == produtoRef) {
      result = i;
      break;
    }
  }

  return result;
}

String imagePathToString(String image) {
  return image;
}

List<ProdutoAddStruct> adicionarProduto(
  ProdutoAddStruct produto,
  List<ProdutoAddStruct> produtos,
) {
  List<ProdutoAddStruct> result = produtos;

  result.add(produto);

  return result;
}

DocumentReference stringToEstaRef(String? referenceId) {
  //

  return FirebaseFirestore.instance
      .collection('estabelecimentos')
      .doc(referenceId);
}

List<ProdutoAddStruct> listaProdutoVazia() {
  return [];
}
