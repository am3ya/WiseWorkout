import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdviceRecord extends FirestoreRecord {
  AdviceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fitnessGoal" field.
  String? _fitnessGoal;
  String get fitnessGoal => _fitnessGoal ?? '';
  bool hasFitnessGoal() => _fitnessGoal != null;

  // "adviceString" field.
  String? _adviceString;
  String get adviceString => _adviceString ?? '';
  bool hasAdviceString() => _adviceString != null;

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

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  void _initializeFields() {
    _fitnessGoal = snapshotData['fitnessGoal'] as String?;
    _adviceString = snapshotData['adviceString'] as String?;
    _creatorRef = snapshotData['creatorRef'] as DocumentReference?;
    _creatorPFP = snapshotData['creatorPFP'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _creatorName = snapshotData['creatorName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advice');

  static Stream<AdviceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdviceRecord.fromSnapshot(s));

  static Future<AdviceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdviceRecord.fromSnapshot(s));

  static AdviceRecord fromSnapshot(DocumentSnapshot snapshot) => AdviceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdviceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdviceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdviceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdviceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdviceRecordData({
  String? fitnessGoal,
  String? adviceString,
  DocumentReference? creatorRef,
  String? creatorPFP,
  DateTime? createdTime,
  String? creatorName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fitnessGoal': fitnessGoal,
      'adviceString': adviceString,
      'creatorRef': creatorRef,
      'creatorPFP': creatorPFP,
      'created_time': createdTime,
      'creatorName': creatorName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdviceRecordDocumentEquality implements Equality<AdviceRecord> {
  const AdviceRecordDocumentEquality();

  @override
  bool equals(AdviceRecord? e1, AdviceRecord? e2) {
    return e1?.fitnessGoal == e2?.fitnessGoal &&
        e1?.adviceString == e2?.adviceString &&
        e1?.creatorRef == e2?.creatorRef &&
        e1?.creatorPFP == e2?.creatorPFP &&
        e1?.createdTime == e2?.createdTime &&
        e1?.creatorName == e2?.creatorName;
  }

  @override
  int hash(AdviceRecord? e) => const ListEquality().hash([
        e?.fitnessGoal,
        e?.adviceString,
        e?.creatorRef,
        e?.creatorPFP,
        e?.createdTime,
        e?.creatorName
      ]);

  @override
  bool isValidKey(Object? o) => o is AdviceRecord;
}
