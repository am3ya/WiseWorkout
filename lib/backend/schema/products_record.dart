import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productPFP" field.
  String? _productPFP;
  String get productPFP => _productPFP ?? '';
  bool hasProductPFP() => _productPFP != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  // "keys" field.
  List<String>? _keys;
  List<String> get keys => _keys ?? const [];
  bool hasKeys() => _keys != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "brandRef" field.
  DocumentReference? _brandRef;
  DocumentReference? get brandRef => _brandRef;
  bool hasBrandRef() => _brandRef != null;

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  void _initializeFields() {
    _productPFP = snapshotData['productPFP'] as String?;
    _productName = snapshotData['productName'] as String?;
    _cost = castToType<int>(snapshotData['cost']);
    _keys = getDataList(snapshotData['keys']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _brandRef = snapshotData['brandRef'] as DocumentReference?;
    _brandName = snapshotData['brandName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? productPFP,
  String? productName,
  int? cost,
  int? quantity,
  DocumentReference? brandRef,
  String? brandName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productPFP': productPFP,
      'productName': productName,
      'cost': cost,
      'quantity': quantity,
      'brandRef': brandRef,
      'brandName': brandName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.productPFP == e2?.productPFP &&
        e1?.productName == e2?.productName &&
        e1?.cost == e2?.cost &&
        listEquality.equals(e1?.keys, e2?.keys) &&
        e1?.quantity == e2?.quantity &&
        e1?.brandRef == e2?.brandRef &&
        e1?.brandName == e2?.brandName;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.productPFP,
        e?.productName,
        e?.cost,
        e?.keys,
        e?.quantity,
        e?.brandRef,
        e?.brandName
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
