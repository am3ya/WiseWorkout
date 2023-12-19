import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesRecord extends FirestoreRecord {
  ExercisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "body_part" field.
  String? _bodyPart;
  String get bodyPart => _bodyPart ?? '';
  bool hasBodyPart() => _bodyPart != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "fitness_goal_achieved" field.
  String? _fitnessGoalAchieved;
  String get fitnessGoalAchieved => _fitnessGoalAchieved ?? '';
  bool hasFitnessGoalAchieved() => _fitnessGoalAchieved != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as String?;
    _bodyPart = snapshotData['body_part'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _fitnessGoalAchieved = snapshotData['fitness_goal_achieved'] as String?;
    _bio = snapshotData['bio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercises');

  static Stream<ExercisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExercisesRecord.fromSnapshot(s));

  static Future<ExercisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExercisesRecord.fromSnapshot(s));

  static ExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExercisesRecordData({
  String? name,
  String? category,
  String? bodyPart,
  DateTime? date,
  String? fitnessGoalAchieved,
  String? bio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
      'body_part': bodyPart,
      'date': date,
      'fitness_goal_achieved': fitnessGoalAchieved,
      'bio': bio,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExercisesRecordDocumentEquality implements Equality<ExercisesRecord> {
  const ExercisesRecordDocumentEquality();

  @override
  bool equals(ExercisesRecord? e1, ExercisesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.category == e2?.category &&
        e1?.bodyPart == e2?.bodyPart &&
        e1?.date == e2?.date &&
        e1?.fitnessGoalAchieved == e2?.fitnessGoalAchieved &&
        e1?.bio == e2?.bio;
  }

  @override
  int hash(ExercisesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.category,
        e?.bodyPart,
        e?.date,
        e?.fitnessGoalAchieved,
        e?.bio
      ]);

  @override
  bool isValidKey(Object? o) => o is ExercisesRecord;
}
