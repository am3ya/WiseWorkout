import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalPropertiesRecord extends FirestoreRecord {
  GlobalPropertiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessCategories" field.
  List<String>? _businessCategories;
  List<String> get businessCategories => _businessCategories ?? const [];
  bool hasBusinessCategories() => _businessCategories != null;

  // "howActive" field.
  List<String>? _howActive;
  List<String> get howActive => _howActive ?? const [];
  bool hasHowActive() => _howActive != null;

  // "ageGroup" field.
  List<String>? _ageGroup;
  List<String> get ageGroup => _ageGroup ?? const [];
  bool hasAgeGroup() => _ageGroup != null;

  // "bmiGroup" field.
  List<String>? _bmiGroup;
  List<String> get bmiGroup => _bmiGroup ?? const [];
  bool hasBmiGroup() => _bmiGroup != null;

  // "fitnessGoal" field.
  List<String>? _fitnessGoal;
  List<String> get fitnessGoal => _fitnessGoal ?? const [];
  bool hasFitnessGoal() => _fitnessGoal != null;

  // "landingPageMedia" field.
  List<String>? _landingPageMedia;
  List<String> get landingPageMedia => _landingPageMedia ?? const [];
  bool hasLandingPageMedia() => _landingPageMedia != null;

  void _initializeFields() {
    _businessCategories = getDataList(snapshotData['businessCategories']);
    _howActive = getDataList(snapshotData['howActive']);
    _ageGroup = getDataList(snapshotData['ageGroup']);
    _bmiGroup = getDataList(snapshotData['bmiGroup']);
    _fitnessGoal = getDataList(snapshotData['fitnessGoal']);
    _landingPageMedia = getDataList(snapshotData['landingPageMedia']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('globalProperties');

  static Stream<GlobalPropertiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlobalPropertiesRecord.fromSnapshot(s));

  static Future<GlobalPropertiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GlobalPropertiesRecord.fromSnapshot(s));

  static GlobalPropertiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlobalPropertiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlobalPropertiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlobalPropertiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlobalPropertiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlobalPropertiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlobalPropertiesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class GlobalPropertiesRecordDocumentEquality
    implements Equality<GlobalPropertiesRecord> {
  const GlobalPropertiesRecordDocumentEquality();

  @override
  bool equals(GlobalPropertiesRecord? e1, GlobalPropertiesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.businessCategories, e2?.businessCategories) &&
        listEquality.equals(e1?.howActive, e2?.howActive) &&
        listEquality.equals(e1?.ageGroup, e2?.ageGroup) &&
        listEquality.equals(e1?.bmiGroup, e2?.bmiGroup) &&
        listEquality.equals(e1?.fitnessGoal, e2?.fitnessGoal) &&
        listEquality.equals(e1?.landingPageMedia, e2?.landingPageMedia);
  }

  @override
  int hash(GlobalPropertiesRecord? e) => const ListEquality().hash([
        e?.businessCategories,
        e?.howActive,
        e?.ageGroup,
        e?.bmiGroup,
        e?.fitnessGoal,
        e?.landingPageMedia
      ]);

  @override
  bool isValidKey(Object? o) => o is GlobalPropertiesRecord;
}