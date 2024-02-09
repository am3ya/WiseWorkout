import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncreasingStaminaRecord extends FirestoreRecord {
  IncreasingStaminaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "advice" field.
  String? _advice;
  String get advice => _advice ?? '';
  bool hasAdvice() => _advice != null;

  // "creatorRef" field.
  DocumentReference? _creatorRef;
  DocumentReference? get creatorRef => _creatorRef;
  bool hasCreatorRef() => _creatorRef != null;

  // "creatorPFP" field.
  String? _creatorPFP;
  String get creatorPFP => _creatorPFP ?? '';
  bool hasCreatorPFP() => _creatorPFP != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _advice = snapshotData['advice'] as String?;
    _creatorRef = snapshotData['creatorRef'] as DocumentReference?;
    _creatorPFP = snapshotData['creatorPFP'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('increasingStamina')
          : FirebaseFirestore.instance.collectionGroup('increasingStamina');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('increasingStamina').doc(id);

  static Stream<IncreasingStaminaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IncreasingStaminaRecord.fromSnapshot(s));

  static Future<IncreasingStaminaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IncreasingStaminaRecord.fromSnapshot(s));

  static IncreasingStaminaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IncreasingStaminaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IncreasingStaminaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IncreasingStaminaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IncreasingStaminaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IncreasingStaminaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIncreasingStaminaRecordData({
  String? advice,
  DocumentReference? creatorRef,
  String? creatorPFP,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'advice': advice,
      'creatorRef': creatorRef,
      'creatorPFP': creatorPFP,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncreasingStaminaRecordDocumentEquality
    implements Equality<IncreasingStaminaRecord> {
  const IncreasingStaminaRecordDocumentEquality();

  @override
  bool equals(IncreasingStaminaRecord? e1, IncreasingStaminaRecord? e2) {
    return e1?.advice == e2?.advice &&
        e1?.creatorRef == e2?.creatorRef &&
        e1?.creatorPFP == e2?.creatorPFP &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(IncreasingStaminaRecord? e) => const ListEquality()
      .hash([e?.advice, e?.creatorRef, e?.creatorPFP, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is IncreasingStaminaRecord;
}
