import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintainingFitnessRecord extends FirestoreRecord {
  MaintainingFitnessRecord._(
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
          ? parent.collection('maintainingFitness')
          : FirebaseFirestore.instance.collectionGroup('maintainingFitness');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('maintainingFitness').doc(id);

  static Stream<MaintainingFitnessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaintainingFitnessRecord.fromSnapshot(s));

  static Future<MaintainingFitnessRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MaintainingFitnessRecord.fromSnapshot(s));

  static MaintainingFitnessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaintainingFitnessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaintainingFitnessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaintainingFitnessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaintainingFitnessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaintainingFitnessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaintainingFitnessRecordData({
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

class MaintainingFitnessRecordDocumentEquality
    implements Equality<MaintainingFitnessRecord> {
  const MaintainingFitnessRecordDocumentEquality();

  @override
  bool equals(MaintainingFitnessRecord? e1, MaintainingFitnessRecord? e2) {
    return e1?.advice == e2?.advice &&
        e1?.creatorRef == e2?.creatorRef &&
        e1?.creatorPFP == e2?.creatorPFP &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(MaintainingFitnessRecord? e) => const ListEquality()
      .hash([e?.advice, e?.creatorRef, e?.creatorPFP, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is MaintainingFitnessRecord;
}
