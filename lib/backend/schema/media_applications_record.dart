import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaApplicationsRecord extends FirestoreRecord {
  MediaApplicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "media" field.
  String? _media;
  String get media => _media ?? '';
  bool hasMedia() => _media != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "creatorPFP" field.
  String? _creatorPFP;
  String get creatorPFP => _creatorPFP ?? '';
  bool hasCreatorPFP() => _creatorPFP != null;

  void _initializeFields() {
    _media = snapshotData['media'] as String?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _creatorName = snapshotData['creatorName'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _creatorPFP = snapshotData['creatorPFP'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mediaApplications');

  static Stream<MediaApplicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MediaApplicationsRecord.fromSnapshot(s));

  static Future<MediaApplicationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MediaApplicationsRecord.fromSnapshot(s));

  static MediaApplicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MediaApplicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MediaApplicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MediaApplicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MediaApplicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MediaApplicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMediaApplicationsRecordData({
  String? media,
  DocumentReference? creator,
  String? creatorName,
  DateTime? createdTime,
  String? creatorPFP,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'media': media,
      'creator': creator,
      'creatorName': creatorName,
      'created_time': createdTime,
      'creatorPFP': creatorPFP,
    }.withoutNulls,
  );

  return firestoreData;
}

class MediaApplicationsRecordDocumentEquality
    implements Equality<MediaApplicationsRecord> {
  const MediaApplicationsRecordDocumentEquality();

  @override
  bool equals(MediaApplicationsRecord? e1, MediaApplicationsRecord? e2) {
    return e1?.media == e2?.media &&
        e1?.creator == e2?.creator &&
        e1?.creatorName == e2?.creatorName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.creatorPFP == e2?.creatorPFP;
  }

  @override
  int hash(MediaApplicationsRecord? e) => const ListEquality().hash(
      [e?.media, e?.creator, e?.creatorName, e?.createdTime, e?.creatorPFP]);

  @override
  bool isValidKey(Object? o) => o is MediaApplicationsRecord;
}
