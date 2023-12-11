import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "friends_list" field.
  List<DocumentReference>? _friendsList;
  List<DocumentReference> get friendsList => _friendsList ?? const [];
  bool hasFriendsList() => _friendsList != null;

  // "friend_requests" field.
  List<DocumentReference>? _friendRequests;
  List<DocumentReference> get friendRequests => _friendRequests ?? const [];
  bool hasFriendRequests() => _friendRequests != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "fitness_goal" field.
  List<String>? _fitnessGoal;
  List<String> get fitnessGoal => _fitnessGoal ?? const [];
  bool hasFitnessGoal() => _fitnessGoal != null;

  // "info_collection_complete" field.
  bool? _infoCollectionComplete;
  bool get infoCollectionComplete => _infoCollectionComplete ?? false;
  bool hasInfoCollectionComplete() => _infoCollectionComplete != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _friendsList = getDataList(snapshotData['friends_list']);
    _friendRequests = getDataList(snapshotData['friend_requests']);
    _weight = castToType<double>(snapshotData['weight']);
    _height = castToType<double>(snapshotData['height']);
    _interests = getDataList(snapshotData['interests']);
    _age = castToType<int>(snapshotData['age']);
    _fitnessGoal = getDataList(snapshotData['fitness_goal']);
    _infoCollectionComplete = snapshotData['info_collection_complete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userType,
  double? weight,
  double? height,
  int? age,
  bool? infoCollectionComplete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_type': userType,
      'weight': weight,
      'height': height,
      'age': age,
      'info_collection_complete': infoCollectionComplete,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userType == e2?.userType &&
        listEquality.equals(e1?.friendsList, e2?.friendsList) &&
        listEquality.equals(e1?.friendRequests, e2?.friendRequests) &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        listEquality.equals(e1?.interests, e2?.interests) &&
        e1?.age == e2?.age &&
        listEquality.equals(e1?.fitnessGoal, e2?.fitnessGoal) &&
        e1?.infoCollectionComplete == e2?.infoCollectionComplete;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userType,
        e?.friendsList,
        e?.friendRequests,
        e?.weight,
        e?.height,
        e?.interests,
        e?.age,
        e?.fitnessGoal,
        e?.infoCollectionComplete
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
