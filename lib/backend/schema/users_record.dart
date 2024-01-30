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

  // "info_collection_complete" field.
  bool? _infoCollectionComplete;
  bool get infoCollectionComplete => _infoCollectionComplete ?? false;
  bool hasInfoCollectionComplete() => _infoCollectionComplete != null;

  // "fitness_goal2" field.
  String? _fitnessGoal2;
  String get fitnessGoal2 => _fitnessGoal2 ?? '';
  bool hasFitnessGoal2() => _fitnessGoal2 != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "credential_doc" field.
  String? _credentialDoc;
  String get credentialDoc => _credentialDoc ?? '';
  bool hasCredentialDoc() => _credentialDoc != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "weeklyCalorieGoal" field.
  int? _weeklyCalorieGoal;
  int get weeklyCalorieGoal => _weeklyCalorieGoal ?? 0;
  bool hasWeeklyCalorieGoal() => _weeklyCalorieGoal != null;

  // "weeklyWorkouts" field.
  int? _weeklyWorkouts;
  int get weeklyWorkouts => _weeklyWorkouts ?? 0;
  bool hasWeeklyWorkouts() => _weeklyWorkouts != null;

  // "clubs" field.
  List<DocumentReference>? _clubs;
  List<DocumentReference> get clubs => _clubs ?? const [];
  bool hasClubs() => _clubs != null;

  // "BMR" field.
  double? _bmr;
  double get bmr => _bmr ?? 0.0;
  bool hasBmr() => _bmr != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

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
    _infoCollectionComplete = snapshotData['info_collection_complete'] as bool?;
    _fitnessGoal2 = snapshotData['fitness_goal2'] as String?;
    _bio = snapshotData['bio'] as String?;
    _category = snapshotData['category'] as String?;
    _credentialDoc = snapshotData['credential_doc'] as String?;
    _brandName = snapshotData['brand_name'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _weeklyCalorieGoal = castToType<int>(snapshotData['weeklyCalorieGoal']);
    _weeklyWorkouts = castToType<int>(snapshotData['weeklyWorkouts']);
    _clubs = getDataList(snapshotData['clubs']);
    _bmr = castToType<double>(snapshotData['BMR']);
    _gender = snapshotData['gender'] as String?;
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
  String? fitnessGoal2,
  String? bio,
  String? category,
  String? credentialDoc,
  String? brandName,
  bool? isActive,
  int? weeklyCalorieGoal,
  int? weeklyWorkouts,
  double? bmr,
  String? gender,
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
      'fitness_goal2': fitnessGoal2,
      'bio': bio,
      'category': category,
      'credential_doc': credentialDoc,
      'brand_name': brandName,
      'isActive': isActive,
      'weeklyCalorieGoal': weeklyCalorieGoal,
      'weeklyWorkouts': weeklyWorkouts,
      'BMR': bmr,
      'gender': gender,
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
        e1?.infoCollectionComplete == e2?.infoCollectionComplete &&
        e1?.fitnessGoal2 == e2?.fitnessGoal2 &&
        e1?.bio == e2?.bio &&
        e1?.category == e2?.category &&
        e1?.credentialDoc == e2?.credentialDoc &&
        e1?.brandName == e2?.brandName &&
        e1?.isActive == e2?.isActive &&
        e1?.weeklyCalorieGoal == e2?.weeklyCalorieGoal &&
        e1?.weeklyWorkouts == e2?.weeklyWorkouts &&
        listEquality.equals(e1?.clubs, e2?.clubs) &&
        e1?.bmr == e2?.bmr &&
        e1?.gender == e2?.gender;
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
        e?.infoCollectionComplete,
        e?.fitnessGoal2,
        e?.bio,
        e?.category,
        e?.credentialDoc,
        e?.brandName,
        e?.isActive,
        e?.weeklyCalorieGoal,
        e?.weeklyWorkouts,
        e?.clubs,
        e?.bmr,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
