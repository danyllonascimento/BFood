// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EditModeStruct extends FFFirebaseStruct {
  EditModeStruct({
    bool? active,
    DocumentReference? refPedido,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _active = active,
        _refPedido = refPedido,
        super(firestoreUtilData);

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "refPedido" field.
  DocumentReference? _refPedido;
  DocumentReference? get refPedido => _refPedido;
  set refPedido(DocumentReference? val) => _refPedido = val;

  bool hasRefPedido() => _refPedido != null;

  static EditModeStruct fromMap(Map<String, dynamic> data) => EditModeStruct(
        active: data['active'] as bool?,
        refPedido: data['refPedido'] as DocumentReference?,
      );

  static EditModeStruct? maybeFromMap(dynamic data) =>
      data is Map ? EditModeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'refPedido': _refPedido,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'refPedido': serializeParam(
          _refPedido,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static EditModeStruct fromSerializableMap(Map<String, dynamic> data) =>
      EditModeStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        refPedido: deserializeParam(
          data['refPedido'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['estabelecimentos', 'pedidos'],
        ),
      );

  @override
  String toString() => 'EditModeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EditModeStruct &&
        active == other.active &&
        refPedido == other.refPedido;
  }

  @override
  int get hashCode => const ListEquality().hash([active, refPedido]);
}

EditModeStruct createEditModeStruct({
  bool? active,
  DocumentReference? refPedido,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EditModeStruct(
      active: active,
      refPedido: refPedido,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EditModeStruct? updateEditModeStruct(
  EditModeStruct? editMode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    editMode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEditModeStructData(
  Map<String, dynamic> firestoreData,
  EditModeStruct? editMode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (editMode == null) {
    return;
  }
  if (editMode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && editMode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final editModeData = getEditModeFirestoreData(editMode, forFieldValue);
  final nestedData = editModeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = editMode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEditModeFirestoreData(
  EditModeStruct? editMode, [
  bool forFieldValue = false,
]) {
  if (editMode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(editMode.toMap());

  // Add any Firestore field values
  editMode.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEditModeListFirestoreData(
  List<EditModeStruct>? editModes,
) =>
    editModes?.map((e) => getEditModeFirestoreData(e, true)).toList() ?? [];
