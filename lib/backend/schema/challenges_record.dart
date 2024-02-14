import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengesRecord extends FirestoreRecord {
  ChallengesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "challengerRef" field.
  DocumentReference? _challengerRef;
  DocumentReference? get challengerRef => _challengerRef;
  bool hasChallengerRef() => _challengerRef != null;

  // "gettingChallengedRef" field.
  DocumentReference? _gettingChallengedRef;
  DocumentReference? get gettingChallengedRef => _gettingChallengedRef;
  bool hasGettingChallengedRef() => _gettingChallengedRef != null;

  // "challengerSteps" field.
  int? _challengerSteps;
  int get challengerSteps => _challengerSteps ?? 0;
  bool hasChallengerSteps() => _challengerSteps != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "winner" field.
  DocumentReference? _winner;
  DocumentReference? get winner => _winner;
  bool hasWinner() => _winner != null;

  // "loser" field.
  DocumentReference? _loser;
  DocumentReference? get loser => _loser;
  bool hasLoser() => _loser != null;

  // "gettingChallengedSteps" field.
  int? _gettingChallengedSteps;
  int get gettingChallengedSteps => _gettingChallengedSteps ?? 0;
  bool hasGettingChallengedSteps() => _gettingChallengedSteps != null;

  // "challengerPFP" field.
  String? _challengerPFP;
  String get challengerPFP => _challengerPFP ?? '';
  bool hasChallengerPFP() => _challengerPFP != null;

  // "gettingChallengedPFP" field.
  String? _gettingChallengedPFP;
  String get gettingChallengedPFP => _gettingChallengedPFP ?? '';
  bool hasGettingChallengedPFP() => _gettingChallengedPFP != null;

  // "challengerName" field.
  String? _challengerName;
  String get challengerName => _challengerName ?? '';
  bool hasChallengerName() => _challengerName != null;

  // "gettingChallengedName" field.
  String? _gettingChallengedName;
  String get gettingChallengedName => _gettingChallengedName ?? '';
  bool hasGettingChallengedName() => _gettingChallengedName != null;

  // "draw" field.
  List<DocumentReference>? _draw;
  List<DocumentReference> get draw => _draw ?? const [];
  bool hasDraw() => _draw != null;

  // "loserName" field.
  String? _loserName;
  String get loserName => _loserName ?? '';
  bool hasLoserName() => _loserName != null;

  // "winnerName" field.
  String? _winnerName;
  String get winnerName => _winnerName ?? '';
  bool hasWinnerName() => _winnerName != null;

  // "drawNames" field.
  List<String>? _drawNames;
  List<String> get drawNames => _drawNames ?? const [];
  bool hasDrawNames() => _drawNames != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "winnerPFP" field.
  String? _winnerPFP;
  String get winnerPFP => _winnerPFP ?? '';
  bool hasWinnerPFP() => _winnerPFP != null;

  // "loserPFP" field.
  String? _loserPFP;
  String get loserPFP => _loserPFP ?? '';
  bool hasLoserPFP() => _loserPFP != null;

  void _initializeFields() {
    _challengerRef = snapshotData['challengerRef'] as DocumentReference?;
    _gettingChallengedRef =
        snapshotData['gettingChallengedRef'] as DocumentReference?;
    _challengerSteps = castToType<int>(snapshotData['challengerSteps']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _winner = snapshotData['winner'] as DocumentReference?;
    _loser = snapshotData['loser'] as DocumentReference?;
    _gettingChallengedSteps =
        castToType<int>(snapshotData['gettingChallengedSteps']);
    _challengerPFP = snapshotData['challengerPFP'] as String?;
    _gettingChallengedPFP = snapshotData['gettingChallengedPFP'] as String?;
    _challengerName = snapshotData['challengerName'] as String?;
    _gettingChallengedName = snapshotData['gettingChallengedName'] as String?;
    _draw = getDataList(snapshotData['draw']);
    _loserName = snapshotData['loserName'] as String?;
    _winnerName = snapshotData['winnerName'] as String?;
    _drawNames = getDataList(snapshotData['drawNames']);
    _status = snapshotData['status'] as String?;
    _winnerPFP = snapshotData['winnerPFP'] as String?;
    _loserPFP = snapshotData['loserPFP'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challenges');

  static Stream<ChallengesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengesRecord.fromSnapshot(s));

  static Future<ChallengesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChallengesRecord.fromSnapshot(s));

  static ChallengesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengesRecordData({
  DocumentReference? challengerRef,
  DocumentReference? gettingChallengedRef,
  int? challengerSteps,
  DateTime? createdTime,
  DocumentReference? winner,
  DocumentReference? loser,
  int? gettingChallengedSteps,
  String? challengerPFP,
  String? gettingChallengedPFP,
  String? challengerName,
  String? gettingChallengedName,
  String? loserName,
  String? winnerName,
  String? status,
  String? winnerPFP,
  String? loserPFP,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'challengerRef': challengerRef,
      'gettingChallengedRef': gettingChallengedRef,
      'challengerSteps': challengerSteps,
      'created_time': createdTime,
      'winner': winner,
      'loser': loser,
      'gettingChallengedSteps': gettingChallengedSteps,
      'challengerPFP': challengerPFP,
      'gettingChallengedPFP': gettingChallengedPFP,
      'challengerName': challengerName,
      'gettingChallengedName': gettingChallengedName,
      'loserName': loserName,
      'winnerName': winnerName,
      'status': status,
      'winnerPFP': winnerPFP,
      'loserPFP': loserPFP,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengesRecordDocumentEquality implements Equality<ChallengesRecord> {
  const ChallengesRecordDocumentEquality();

  @override
  bool equals(ChallengesRecord? e1, ChallengesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.challengerRef == e2?.challengerRef &&
        e1?.gettingChallengedRef == e2?.gettingChallengedRef &&
        e1?.challengerSteps == e2?.challengerSteps &&
        e1?.createdTime == e2?.createdTime &&
        e1?.winner == e2?.winner &&
        e1?.loser == e2?.loser &&
        e1?.gettingChallengedSteps == e2?.gettingChallengedSteps &&
        e1?.challengerPFP == e2?.challengerPFP &&
        e1?.gettingChallengedPFP == e2?.gettingChallengedPFP &&
        e1?.challengerName == e2?.challengerName &&
        e1?.gettingChallengedName == e2?.gettingChallengedName &&
        listEquality.equals(e1?.draw, e2?.draw) &&
        e1?.loserName == e2?.loserName &&
        e1?.winnerName == e2?.winnerName &&
        listEquality.equals(e1?.drawNames, e2?.drawNames) &&
        e1?.status == e2?.status &&
        e1?.winnerPFP == e2?.winnerPFP &&
        e1?.loserPFP == e2?.loserPFP;
  }

  @override
  int hash(ChallengesRecord? e) => const ListEquality().hash([
        e?.challengerRef,
        e?.gettingChallengedRef,
        e?.challengerSteps,
        e?.createdTime,
        e?.winner,
        e?.loser,
        e?.gettingChallengedSteps,
        e?.challengerPFP,
        e?.gettingChallengedPFP,
        e?.challengerName,
        e?.gettingChallengedName,
        e?.draw,
        e?.loserName,
        e?.winnerName,
        e?.drawNames,
        e?.status,
        e?.winnerPFP,
        e?.loserPFP
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengesRecord;
}