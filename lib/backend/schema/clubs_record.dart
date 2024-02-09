import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubsRecord extends FirestoreRecord {
  ClubsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "club_name" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  bool hasClubName() => _clubName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "membersRefs" field.
  List<DocumentReference>? _membersRefs;
  List<DocumentReference> get membersRefs => _membersRefs ?? const [];
  bool hasMembersRefs() => _membersRefs != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "numberOfMembers" field.
  int? _numberOfMembers;
  int get numberOfMembers => _numberOfMembers ?? 0;
  bool hasNumberOfMembers() => _numberOfMembers != null;

  void _initializeFields() {
    _clubName = snapshotData['club_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _membersRefs = getDataList(snapshotData['membersRefs']);
    _bio = snapshotData['bio'] as String?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _numberOfMembers = castToType<int>(snapshotData['numberOfMembers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubsRecord.fromSnapshot(s));

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubsRecord.fromSnapshot(s));

  static ClubsRecord fromSnapshot(DocumentSnapshot snapshot) => ClubsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubsRecordData({
  String? clubName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? bio,
  DocumentReference? creator,
  int? numberOfMembers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'club_name': clubName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'bio': bio,
      'creator': creator,
      'numberOfMembers': numberOfMembers,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubsRecordDocumentEquality implements Equality<ClubsRecord> {
  const ClubsRecordDocumentEquality();

  @override
  bool equals(ClubsRecord? e1, ClubsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clubName == e2?.clubName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.membersRefs, e2?.membersRefs) &&
        e1?.bio == e2?.bio &&
        e1?.creator == e2?.creator &&
        e1?.numberOfMembers == e2?.numberOfMembers;
  }

  @override
  int hash(ClubsRecord? e) => const ListEquality().hash([
        e?.clubName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.membersRefs,
        e?.bio,
        e?.creator,
        e?.numberOfMembers
      ]);

  @override
  bool isValidKey(Object? o) => o is ClubsRecord;
}
