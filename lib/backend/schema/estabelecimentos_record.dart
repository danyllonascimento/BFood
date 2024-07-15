import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstabelecimentosRecord extends FirestoreRecord {
  EstabelecimentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "slogan" field.
  String? _slogan;
  String get slogan => _slogan ?? '';
  bool hasSlogan() => _slogan != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _slogan = snapshotData['slogan'] as String?;
    _logo = snapshotData['logo'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _email = snapshotData['email'] as String?;
    _active = snapshotData['active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estabelecimentos');

  static Stream<EstabelecimentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstabelecimentosRecord.fromSnapshot(s));

  static Future<EstabelecimentosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EstabelecimentosRecord.fromSnapshot(s));

  static EstabelecimentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstabelecimentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstabelecimentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstabelecimentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstabelecimentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstabelecimentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstabelecimentosRecordData({
  String? nome,
  DateTime? createdTime,
  String? slogan,
  String? logo,
  String? telefone,
  String? email,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'created_time': createdTime,
      'slogan': slogan,
      'logo': logo,
      'telefone': telefone,
      'email': email,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstabelecimentosRecordDocumentEquality
    implements Equality<EstabelecimentosRecord> {
  const EstabelecimentosRecordDocumentEquality();

  @override
  bool equals(EstabelecimentosRecord? e1, EstabelecimentosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.createdTime == e2?.createdTime &&
        e1?.slogan == e2?.slogan &&
        e1?.logo == e2?.logo &&
        e1?.telefone == e2?.telefone &&
        e1?.email == e2?.email &&
        e1?.active == e2?.active;
  }

  @override
  int hash(EstabelecimentosRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.createdTime,
        e?.slogan,
        e?.logo,
        e?.telefone,
        e?.email,
        e?.active
      ]);

  @override
  bool isValidKey(Object? o) => o is EstabelecimentosRecord;
}
