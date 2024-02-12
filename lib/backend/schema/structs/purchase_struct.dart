// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseStruct extends FFFirebaseStruct {
  PurchaseStruct({
    DocumentReference? productRef,
    String? productName,
    String? productPFP,
    String? productKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _productName = productName,
        _productPFP = productPFP,
        _productKey = productKey,
        super(firestoreUtilData);

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;
  bool hasProductRef() => _productRef != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;
  bool hasProductName() => _productName != null;

  // "productPFP" field.
  String? _productPFP;
  String get productPFP => _productPFP ?? '';
  set productPFP(String? val) => _productPFP = val;
  bool hasProductPFP() => _productPFP != null;

  // "productKey" field.
  String? _productKey;
  String get productKey => _productKey ?? '';
  set productKey(String? val) => _productKey = val;
  bool hasProductKey() => _productKey != null;

  static PurchaseStruct fromMap(Map<String, dynamic> data) => PurchaseStruct(
        productRef: data['productRef'] as DocumentReference?,
        productName: data['productName'] as String?,
        productPFP: data['productPFP'] as String?,
        productKey: data['productKey'] as String?,
      );

  static PurchaseStruct? maybeFromMap(dynamic data) =>
      data is Map ? PurchaseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'productRef': _productRef,
        'productName': _productName,
        'productPFP': _productPFP,
        'productKey': _productKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'productRef': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'productName': serializeParam(
          _productName,
          ParamType.String,
        ),
        'productPFP': serializeParam(
          _productPFP,
          ParamType.String,
        ),
        'productKey': serializeParam(
          _productKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static PurchaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      PurchaseStruct(
        productRef: deserializeParam(
          data['productRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        productName: deserializeParam(
          data['productName'],
          ParamType.String,
          false,
        ),
        productPFP: deserializeParam(
          data['productPFP'],
          ParamType.String,
          false,
        ),
        productKey: deserializeParam(
          data['productKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PurchaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchaseStruct &&
        productRef == other.productRef &&
        productName == other.productName &&
        productPFP == other.productPFP &&
        productKey == other.productKey;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([productRef, productName, productPFP, productKey]);
}

PurchaseStruct createPurchaseStruct({
  DocumentReference? productRef,
  String? productName,
  String? productPFP,
  String? productKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchaseStruct(
      productRef: productRef,
      productName: productName,
      productPFP: productPFP,
      productKey: productKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchaseStruct? updatePurchaseStruct(
  PurchaseStruct? purchase, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchase
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchaseStructData(
  Map<String, dynamic> firestoreData,
  PurchaseStruct? purchase,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchase == null) {
    return;
  }
  if (purchase.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchase.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchaseData = getPurchaseFirestoreData(purchase, forFieldValue);
  final nestedData = purchaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = purchase.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchaseFirestoreData(
  PurchaseStruct? purchase, [
  bool forFieldValue = false,
]) {
  if (purchase == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchase.toMap());

  // Add any Firestore field values
  purchase.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchaseListFirestoreData(
  List<PurchaseStruct>? purchases,
) =>
    purchases?.map((e) => getPurchaseFirestoreData(e, true)).toList() ?? [];
