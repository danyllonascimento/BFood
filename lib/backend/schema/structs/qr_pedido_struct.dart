// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrPedidoStruct extends FFFirebaseStruct {
  QrPedidoStruct({
    DocumentReference? mesa,
    int? numeroMesa,
    List<ProdutoAddStruct>? produtos,
    String? informacoesAdicionais,
    DocumentReference? estabalecimento,
    int? numeroPedido,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mesa = mesa,
        _numeroMesa = numeroMesa,
        _produtos = produtos,
        _informacoesAdicionais = informacoesAdicionais,
        _estabalecimento = estabalecimento,
        _numeroPedido = numeroPedido,
        super(firestoreUtilData);

  // "mesa" field.
  DocumentReference? _mesa;
  DocumentReference? get mesa => _mesa;
  set mesa(DocumentReference? val) => _mesa = val;

  bool hasMesa() => _mesa != null;

  // "numeroMesa" field.
  int? _numeroMesa;
  int get numeroMesa => _numeroMesa ?? 0;
  set numeroMesa(int? val) => _numeroMesa = val;

  void incrementNumeroMesa(int amount) => numeroMesa = numeroMesa + amount;

  bool hasNumeroMesa() => _numeroMesa != null;

  // "produtos" field.
  List<ProdutoAddStruct>? _produtos;
  List<ProdutoAddStruct> get produtos => _produtos ?? const [];
  set produtos(List<ProdutoAddStruct>? val) => _produtos = val;

  void updateProdutos(Function(List<ProdutoAddStruct>) updateFn) {
    updateFn(_produtos ??= []);
  }

  bool hasProdutos() => _produtos != null;

  // "informacoesAdicionais" field.
  String? _informacoesAdicionais;
  String get informacoesAdicionais => _informacoesAdicionais ?? '';
  set informacoesAdicionais(String? val) => _informacoesAdicionais = val;

  bool hasInformacoesAdicionais() => _informacoesAdicionais != null;

  // "estabalecimento" field.
  DocumentReference? _estabalecimento;
  DocumentReference? get estabalecimento => _estabalecimento;
  set estabalecimento(DocumentReference? val) => _estabalecimento = val;

  bool hasEstabalecimento() => _estabalecimento != null;

  // "numeroPedido" field.
  int? _numeroPedido;
  int get numeroPedido => _numeroPedido ?? 0;
  set numeroPedido(int? val) => _numeroPedido = val;

  void incrementNumeroPedido(int amount) =>
      numeroPedido = numeroPedido + amount;

  bool hasNumeroPedido() => _numeroPedido != null;

  static QrPedidoStruct fromMap(Map<String, dynamic> data) => QrPedidoStruct(
        mesa: data['mesa'] as DocumentReference?,
        numeroMesa: castToType<int>(data['numeroMesa']),
        produtos: getStructList(
          data['produtos'],
          ProdutoAddStruct.fromMap,
        ),
        informacoesAdicionais: data['informacoesAdicionais'] as String?,
        estabalecimento: data['estabalecimento'] as DocumentReference?,
        numeroPedido: castToType<int>(data['numeroPedido']),
      );

  static QrPedidoStruct? maybeFromMap(dynamic data) =>
      data is Map ? QrPedidoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mesa': _mesa,
        'numeroMesa': _numeroMesa,
        'produtos': _produtos?.map((e) => e.toMap()).toList(),
        'informacoesAdicionais': _informacoesAdicionais,
        'estabalecimento': _estabalecimento,
        'numeroPedido': _numeroPedido,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mesa': serializeParam(
          _mesa,
          ParamType.DocumentReference,
        ),
        'numeroMesa': serializeParam(
          _numeroMesa,
          ParamType.int,
        ),
        'produtos': serializeParam(
          _produtos,
          ParamType.DataStruct,
          isList: true,
        ),
        'informacoesAdicionais': serializeParam(
          _informacoesAdicionais,
          ParamType.String,
        ),
        'estabalecimento': serializeParam(
          _estabalecimento,
          ParamType.DocumentReference,
        ),
        'numeroPedido': serializeParam(
          _numeroPedido,
          ParamType.int,
        ),
      }.withoutNulls;

  static QrPedidoStruct fromSerializableMap(Map<String, dynamic> data) =>
      QrPedidoStruct(
        mesa: deserializeParam(
          data['mesa'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['estabelecimentos', 'mesas'],
        ),
        numeroMesa: deserializeParam(
          data['numeroMesa'],
          ParamType.int,
          false,
        ),
        produtos: deserializeStructParam<ProdutoAddStruct>(
          data['produtos'],
          ParamType.DataStruct,
          true,
          structBuilder: ProdutoAddStruct.fromSerializableMap,
        ),
        informacoesAdicionais: deserializeParam(
          data['informacoesAdicionais'],
          ParamType.String,
          false,
        ),
        estabalecimento: deserializeParam(
          data['estabalecimento'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['estabelecimentos'],
        ),
        numeroPedido: deserializeParam(
          data['numeroPedido'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QrPedidoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QrPedidoStruct &&
        mesa == other.mesa &&
        numeroMesa == other.numeroMesa &&
        listEquality.equals(produtos, other.produtos) &&
        informacoesAdicionais == other.informacoesAdicionais &&
        estabalecimento == other.estabalecimento &&
        numeroPedido == other.numeroPedido;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mesa,
        numeroMesa,
        produtos,
        informacoesAdicionais,
        estabalecimento,
        numeroPedido
      ]);
}

QrPedidoStruct createQrPedidoStruct({
  DocumentReference? mesa,
  int? numeroMesa,
  String? informacoesAdicionais,
  DocumentReference? estabalecimento,
  int? numeroPedido,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QrPedidoStruct(
      mesa: mesa,
      numeroMesa: numeroMesa,
      informacoesAdicionais: informacoesAdicionais,
      estabalecimento: estabalecimento,
      numeroPedido: numeroPedido,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QrPedidoStruct? updateQrPedidoStruct(
  QrPedidoStruct? qrPedido, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    qrPedido
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQrPedidoStructData(
  Map<String, dynamic> firestoreData,
  QrPedidoStruct? qrPedido,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (qrPedido == null) {
    return;
  }
  if (qrPedido.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && qrPedido.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final qrPedidoData = getQrPedidoFirestoreData(qrPedido, forFieldValue);
  final nestedData = qrPedidoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = qrPedido.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQrPedidoFirestoreData(
  QrPedidoStruct? qrPedido, [
  bool forFieldValue = false,
]) {
  if (qrPedido == null) {
    return {};
  }
  final firestoreData = mapToFirestore(qrPedido.toMap());

  // Add any Firestore field values
  qrPedido.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQrPedidoListFirestoreData(
  List<QrPedidoStruct>? qrPedidos,
) =>
    qrPedidos?.map((e) => getQrPedidoFirestoreData(e, true)).toList() ?? [];
