// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MesaEstaStruct extends FFFirebaseStruct {
  MesaEstaStruct({
    String? idMesa,
    String? isEsta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idMesa = idMesa,
        _isEsta = isEsta,
        super(firestoreUtilData);

  // "idMesa" field.
  String? _idMesa;
  String get idMesa => _idMesa ?? '';
  set idMesa(String? val) => _idMesa = val;

  bool hasIdMesa() => _idMesa != null;

  // "isEsta" field.
  String? _isEsta;
  String get isEsta => _isEsta ?? '';
  set isEsta(String? val) => _isEsta = val;

  bool hasIsEsta() => _isEsta != null;

  static MesaEstaStruct fromMap(Map<String, dynamic> data) => MesaEstaStruct(
        idMesa: data['idMesa'] as String?,
        isEsta: data['isEsta'] as String?,
      );

  static MesaEstaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MesaEstaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'idMesa': _idMesa,
        'isEsta': _isEsta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idMesa': serializeParam(
          _idMesa,
          ParamType.String,
        ),
        'isEsta': serializeParam(
          _isEsta,
          ParamType.String,
        ),
      }.withoutNulls;

  static MesaEstaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MesaEstaStruct(
        idMesa: deserializeParam(
          data['idMesa'],
          ParamType.String,
          false,
        ),
        isEsta: deserializeParam(
          data['isEsta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MesaEstaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MesaEstaStruct &&
        idMesa == other.idMesa &&
        isEsta == other.isEsta;
  }

  @override
  int get hashCode => const ListEquality().hash([idMesa, isEsta]);
}

MesaEstaStruct createMesaEstaStruct({
  String? idMesa,
  String? isEsta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MesaEstaStruct(
      idMesa: idMesa,
      isEsta: isEsta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MesaEstaStruct? updateMesaEstaStruct(
  MesaEstaStruct? mesaEsta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mesaEsta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMesaEstaStructData(
  Map<String, dynamic> firestoreData,
  MesaEstaStruct? mesaEsta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mesaEsta == null) {
    return;
  }
  if (mesaEsta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mesaEsta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mesaEstaData = getMesaEstaFirestoreData(mesaEsta, forFieldValue);
  final nestedData = mesaEstaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mesaEsta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMesaEstaFirestoreData(
  MesaEstaStruct? mesaEsta, [
  bool forFieldValue = false,
]) {
  if (mesaEsta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mesaEsta.toMap());

  // Add any Firestore field values
  mesaEsta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMesaEstaListFirestoreData(
  List<MesaEstaStruct>? mesaEstas,
) =>
    mesaEstas?.map((e) => getMesaEstaFirestoreData(e, true)).toList() ?? [];
