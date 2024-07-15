import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "produtos" field.
  List<ProdutoAddStruct>? _produtos;
  List<ProdutoAddStruct> get produtos => _produtos ?? const [];
  bool hasProdutos() => _produtos != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "informacoes_adicionais" field.
  String? _informacoesAdicionais;
  String get informacoesAdicionais => _informacoesAdicionais ?? '';
  bool hasInformacoesAdicionais() => _informacoesAdicionais != null;

  // "preparando" field.
  bool? _preparando;
  bool get preparando => _preparando ?? false;
  bool hasPreparando() => _preparando != null;

  // "finalizado" field.
  bool? _finalizado;
  bool get finalizado => _finalizado ?? false;
  bool hasFinalizado() => _finalizado != null;

  // "dataFinalizado" field.
  DateTime? _dataFinalizado;
  DateTime? get dataFinalizado => _dataFinalizado;
  bool hasDataFinalizado() => _dataFinalizado != null;

  // "user_garcom" field.
  DocumentReference? _userGarcom;
  DocumentReference? get userGarcom => _userGarcom;
  bool hasUserGarcom() => _userGarcom != null;

  // "mesa" field.
  DocumentReference? _mesa;
  DocumentReference? get mesa => _mesa;
  bool hasMesa() => _mesa != null;

  // "createdString" field.
  String? _createdString;
  String get createdString => _createdString ?? '';
  bool hasCreatedString() => _createdString != null;

  // "finalizadoString" field.
  String? _finalizadoString;
  String get finalizadoString => _finalizadoString ?? '';
  bool hasFinalizadoString() => _finalizadoString != null;

  // "numeroPedido" field.
  int? _numeroPedido;
  int get numeroPedido => _numeroPedido ?? 0;
  bool hasNumeroPedido() => _numeroPedido != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _produtos = getStructList(
      snapshotData['produtos'],
      ProdutoAddStruct.fromMap,
    );
    _total = castToType<double>(snapshotData['total']);
    _informacoesAdicionais = snapshotData['informacoes_adicionais'] as String?;
    _preparando = snapshotData['preparando'] as bool?;
    _finalizado = snapshotData['finalizado'] as bool?;
    _dataFinalizado = snapshotData['dataFinalizado'] as DateTime?;
    _userGarcom = snapshotData['user_garcom'] as DocumentReference?;
    _mesa = snapshotData['mesa'] as DocumentReference?;
    _createdString = snapshotData['createdString'] as String?;
    _finalizadoString = snapshotData['finalizadoString'] as String?;
    _numeroPedido = castToType<int>(snapshotData['numeroPedido']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pedidos')
          : FirebaseFirestore.instance.collectionGroup('pedidos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pedidos').doc(id);

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  DateTime? createdTime,
  double? total,
  String? informacoesAdicionais,
  bool? preparando,
  bool? finalizado,
  DateTime? dataFinalizado,
  DocumentReference? userGarcom,
  DocumentReference? mesa,
  String? createdString,
  String? finalizadoString,
  int? numeroPedido,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'total': total,
      'informacoes_adicionais': informacoesAdicionais,
      'preparando': preparando,
      'finalizado': finalizado,
      'dataFinalizado': dataFinalizado,
      'user_garcom': userGarcom,
      'mesa': mesa,
      'createdString': createdString,
      'finalizadoString': finalizadoString,
      'numeroPedido': numeroPedido,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.produtos, e2?.produtos) &&
        e1?.total == e2?.total &&
        e1?.informacoesAdicionais == e2?.informacoesAdicionais &&
        e1?.preparando == e2?.preparando &&
        e1?.finalizado == e2?.finalizado &&
        e1?.dataFinalizado == e2?.dataFinalizado &&
        e1?.userGarcom == e2?.userGarcom &&
        e1?.mesa == e2?.mesa &&
        e1?.createdString == e2?.createdString &&
        e1?.finalizadoString == e2?.finalizadoString &&
        e1?.numeroPedido == e2?.numeroPedido;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.produtos,
        e?.total,
        e?.informacoesAdicionais,
        e?.preparando,
        e?.finalizado,
        e?.dataFinalizado,
        e?.userGarcom,
        e?.mesa,
        e?.createdString,
        e?.finalizadoString,
        e?.numeroPedido
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
