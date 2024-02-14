import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "feedbackString" field.
  String? _feedbackString;
  String get feedbackString => _feedbackString ?? '';
  bool hasFeedbackString() => _feedbackString != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "ticketNumber" field.
  int? _ticketNumber;
  int get ticketNumber => _ticketNumber ?? 0;
  bool hasTicketNumber() => _ticketNumber != null;

  // "creatorPFP" field.
  String? _creatorPFP;
  String get creatorPFP => _creatorPFP ?? '';
  bool hasCreatorPFP() => _creatorPFP != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  void _initializeFields() {
    _feedbackString = snapshotData['feedbackString'] as String?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _ticketNumber = castToType<int>(snapshotData['ticketNumber']);
    _creatorPFP = snapshotData['creatorPFP'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _subject = snapshotData['subject'] as String?;
    _creatorName = snapshotData['creatorName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? feedbackString,
  DocumentReference? creator,
  int? ticketNumber,
  String? creatorPFP,
  String? userType,
  DateTime? createdTime,
  String? status,
  String? subject,
  String? creatorName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feedbackString': feedbackString,
      'creator': creator,
      'ticketNumber': ticketNumber,
      'creatorPFP': creatorPFP,
      'user_type': userType,
      'created_time': createdTime,
      'status': status,
      'subject': subject,
      'creatorName': creatorName,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.feedbackString == e2?.feedbackString &&
        e1?.creator == e2?.creator &&
        e1?.ticketNumber == e2?.ticketNumber &&
        e1?.creatorPFP == e2?.creatorPFP &&
        e1?.userType == e2?.userType &&
        e1?.createdTime == e2?.createdTime &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.creatorName == e2?.creatorName;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.feedbackString,
        e?.creator,
        e?.ticketNumber,
        e?.creatorPFP,
        e?.userType,
        e?.createdTime,
        e?.status,
        e?.subject,
        e?.creatorName
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}