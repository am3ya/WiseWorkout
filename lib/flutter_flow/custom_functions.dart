import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<SetStruct> createSets() {
  SetStruct set1 = SetStruct(reps: 10, weight: 145, number: 1);
  return [set1];
}

String formatDuration(int milliseconds) {
  Duration duration = Duration(milliseconds: milliseconds);
  int twoDigitMinutes = duration.inMinutes.remainder(60);
  int twoDigitSeconds = duration.inSeconds.remainder(60);
  String twoDigitMinutesStr = twoDigitMinutes.toString().padLeft(2, '0');
  String twoDigitSecondsStr = twoDigitSeconds.toString().padLeft(2, '0');
  return "$twoDigitMinutesStr:$twoDigitSecondsStr";
}

List<String> getLabels() {
  return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
}

List<int> getFrequency(List<DateTime> workouts) {
  List<int> frequency = List.filled(7, 0);

  for (var workout in workouts) {
    int dayOfWeek = workout.weekday;
    frequency[dayOfWeek - 1]++;
  }

  return frequency;
}

bool hasNoSpaces(String input) {
  return !input.contains(' ');
}

bool isEmpty(String input) {
  return input.isEmpty;
}

bool doesUserExist(
  List<UsersRecord> usersCollection,
  String input,
) {
  return usersCollection.any((user) => user.displayName == input);
}

bool deleteUser(UsersRecord thisUser) {
  String userID = thisUser.uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  firestore.collection('users').doc(userID).delete();
  return true;
}

List<UsersRecord>? searchUsers(
  String searchedUsername,
  List<UsersRecord> usersCollection,
) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<UsersRecord> searchedUsers = [];

  for (UsersRecord user in usersCollection) {
    if (user.displayName
        .toLowerCase()
        .contains(searchedUsername.toLowerCase())) {
      searchedUsers.add(user);
    }
  }

  return searchedUsers;
  //usersCollection.any((user) => user.displayName.toLowerCase().contains(searchedUsername.toLowerCase()));

  //usersCollection.any((user) => user.displayName == input);
}

String? searchUsersPhotoURL(
  String searchedUsername,
  List<UsersRecord> usersCollection,
) {
  String? photoURL;

  for (UsersRecord user in usersCollection) {
    if (user.displayName
        .toLowerCase()
        .contains(searchedUsername.toLowerCase())) {
      photoURL = user.photoUrl;
    }
  }

  return photoURL;
}

bool? sendFriendRequest(
  String senderUsername,
  String receiverUsername,
  List<UsersRecord> usersCollection,
) {
  UsersRecord senderUser = usersCollection[0];
  UsersRecord receiverUser = usersCollection[1];
  bool toReturn;

  for (UsersRecord user in usersCollection) {
    if (senderUsername.toLowerCase() == user.displayName.toLowerCase()) {
      /*UsersRecord*/ senderUser = user;
    }
    if (receiverUsername.toLowerCase() == user.displayName.toLowerCase()) {
      /*UsersRecord*/ receiverUser = user;
    }
  }

  if (receiverUser.friendRequests.contains(senderUser)) {
    toReturn = false;
  } else {
    receiverUser.friendRequests.add(senderUser as DocumentReference<Object?>);
    toReturn = true;
  }

  return toReturn;

  /*if (senderUser in receiverUser.friendRequests){
    toReturn = false;
  } else {
  receiverUser.friendRequests.add(senderUser);
  toReturn = true;
  }
  return toReturn;*/
}
