// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoAddStruct extends FFFirebaseStruct {
  ProdutoAddStruct({
    DocumentReference? produto,
    int? quantidade,
    String? informacoesAdicionais,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produto = produto,
        _quantidade = quantidade,
        _informacoesAdicionais = informacoesAdicionais,
        super(firestoreUtilData);

  // "produto" field.
  DocumentReference? _produto;
  DocumentReference? get produto => _produto;
  set produto(DocumentReference? val) => _produto = val;

  bool hasProduto() => _produto != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "informacoes_adicionais" field.
  String? _informacoesAdicionais;
  String get informacoesAdicionais => _informacoesAdicionais ?? '';
  set informacoesAdicionais(String? val) => _informacoesAdicionais = val;

  bool hasInformacoesAdicionais() => _informacoesAdicionais != null;

  static ProdutoAddStruct fromMap(Map<String, dynamic> data) =>
      ProdutoAddStruct(
        produto: data['produto'] as DocumentReference?,
        quantidade: castToType<int>(data['quantidade']),
        informacoesAdicionais: data['informacoes_adicionais'] as String?,
      );

  static ProdutoAddStruct? maybeFromMap(dynamic data) => data is Map
      ? ProdutoAddStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'produto': _produto,
        'quantidade': _quantidade,
        'informacoes_adicionais': _informacoesAdicionais,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produto': serializeParam(
          _produto,
          ParamType.DocumentReference,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'informacoes_adicionais': serializeParam(
          _informacoesAdicionais,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProdutoAddStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProdutoAddStruct(
        produto: deserializeParam(
          data['produto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['estabelecimentos', 'produtos'],
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        informacoesAdicionais: deserializeParam(
          data['informacoes_adicionais'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProdutoAddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProdutoAddStruct &&
        produto == other.produto &&
        quantidade == other.quantidade &&
        informacoesAdicionais == other.informacoesAdicionais;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([produto, quantidade, informacoesAdicionais]);
}

ProdutoAddStruct createProdutoAddStruct({
  DocumentReference? produto,
  int? quantidade,
  String? informacoesAdicionais,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProdutoAddStruct(
      produto: produto,
      quantidade: quantidade,
      informacoesAdicionais: informacoesAdicionais,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProdutoAddStruct? updateProdutoAddStruct(
  ProdutoAddStruct? produtoAdd, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    produtoAdd
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProdutoAddStructData(
  Map<String, dynamic> firestoreData,
  ProdutoAddStruct? produtoAdd,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (produtoAdd == null) {
    return;
  }
  if (produtoAdd.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && produtoAdd.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final produtoAddData = getProdutoAddFirestoreData(produtoAdd, forFieldValue);
  final nestedData = produtoAddData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = produtoAdd.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProdutoAddFirestoreData(
  ProdutoAddStruct? produtoAdd, [
  bool forFieldValue = false,
]) {
  if (produtoAdd == null) {
    return {};
  }
  final firestoreData = mapToFirestore(produtoAdd.toMap());

  // Add any Firestore field values
  produtoAdd.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProdutoAddListFirestoreData(
  List<ProdutoAddStruct>? produtoAdds,
) =>
    produtoAdds?.map((e) => getProdutoAddFirestoreData(e, true)).toList() ?? [];
