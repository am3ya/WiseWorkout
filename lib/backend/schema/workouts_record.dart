import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "stepsTaken" field.
  int? _stepsTaken;
  int get stepsTaken => _stepsTaken ?? 0;
  bool hasStepsTaken() => _stepsTaken != null;

  // "caloriesBurned" field.
  double? _caloriesBurned;
  double get caloriesBurned => _caloriesBurned ?? 0.0;
  bool hasCaloriesBurned() => _caloriesBurned != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "dateUploaded" field.
  DateTime? _dateUploaded;
  DateTime? get dateUploaded => _dateUploaded;
  bool hasDateUploaded() => _dateUploaded != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _duration = castToType<double>(snapshotData['duration']);
    _stepsTaken = castToType<int>(snapshotData['stepsTaken']);
    _caloriesBurned = castToType<double>(snapshotData['caloriesBurned']);
    _distance = castToType<double>(snapshotData['distance']);
    _dateUploaded = snapshotData['dateUploaded'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workouts')
          : FirebaseFirestore.instance.collectionGroup('workouts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workouts').doc(id);

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  double? duration,
  int? stepsTaken,
  double? caloriesBurned,
  double? distance,
  DateTime? dateUploaded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'duration': duration,
      'stepsTaken': stepsTaken,
      'caloriesBurned': caloriesBurned,
      'distance': distance,
      'dateUploaded': dateUploaded,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    return e1?.duration == e2?.duration &&
        e1?.stepsTaken == e2?.stepsTaken &&
        e1?.caloriesBurned == e2?.caloriesBurned &&
        e1?.distance == e2?.distance &&
        e1?.dateUploaded == e2?.dateUploaded;
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality().hash([
        e?.duration,
        e?.stepsTaken,
        e?.caloriesBurned,
        e?.distance,
        e?.dateUploaded
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}
