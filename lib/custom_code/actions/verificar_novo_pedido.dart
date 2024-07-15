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

Future verificarNovoPedido(String? estabelecimentoRef) async {
  // Crie uma referência para a coleção
  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('estabelecimentos')
      .doc(estabelecimentoRef)
      .collection('pedidos');

  // Adicione um observador para detectar mudanças na coleção
  collectionReference.snapshots().listen((QuerySnapshot querySnapshot) {
    querySnapshot.docChanges.forEach((change) {
      if (change.type == DocumentChangeType.added) {
        // Notifique o usuário ou realize ação desejada quando um item for adicionado
        var novoItem = change.doc.data();
        print('Novo item adicionado: $novoItem');
      }
    });
  });
}
