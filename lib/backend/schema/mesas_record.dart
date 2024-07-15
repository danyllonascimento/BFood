import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MesasRecord extends FirestoreRecord {
  MesasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numeroMesa" field.
  int? _numeroMesa;
  int get numeroMesa => _numeroMesa ?? 0;
  bool hasNumeroMesa() => _numeroMesa != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "qrMesa" field.
  String? _qrMesa;
  String get qrMesa => _qrMesa ?? '';
  bool hasQrMesa() => _qrMesa != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _numeroMesa = castToType<int>(snapshotData['numeroMesa']);
    _ativo = snapshotData['ativo'] as bool?;
    _descricao = snapshotData['descricao'] as String?;
    _qrMesa = snapshotData['qrMesa'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('mesas')
          : FirebaseFirestore.instance.collectionGroup('mesas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('mesas').doc(id);

  static Stream<MesasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MesasRecord.fromSnapshot(s));

  static Future<MesasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MesasRecord.fromSnapshot(s));

  static MesasRecord fromSnapshot(DocumentSnapshot snapshot) => MesasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MesasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MesasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MesasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MesasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMesasRecordData({
  int? numeroMesa,
  bool? ativo,
  String? descricao,
  String? qrMesa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numeroMesa': numeroMesa,
      'ativo': ativo,
      'descricao': descricao,
      'qrMesa': qrMesa,
    }.withoutNulls,
  );

  return firestoreData;
}

class MesasRecordDocumentEquality implements Equality<MesasRecord> {
  const MesasRecordDocumentEquality();

  @override
  bool equals(MesasRecord? e1, MesasRecord? e2) {
    return e1?.numeroMesa == e2?.numeroMesa &&
        e1?.ativo == e2?.ativo &&
        e1?.descricao == e2?.descricao &&
        e1?.qrMesa == e2?.qrMesa;
  }

  @override
  int hash(MesasRecord? e) => const ListEquality()
      .hash([e?.numeroMesa, e?.ativo, e?.descricao, e?.qrMesa]);

  @override
  bool isValidKey(Object? o) => o is MesasRecord;
}
