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

DocumentReference? friendsListUsernames(
  UsersRecord authUser,
  int indexInList,
  List<UsersRecord> allUsers,
) {
  String returnUsername = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference<Object?> returnUserRef =
      authUser.friendsList.elementAt(indexInList);

  return returnUserRef;

  //return "Test";
}

bool doesUserExist(
  List<UsersRecord> usersCollection,
  String input,
) {
  return usersCollection.any((user) => user.displayName == input);
}

bool deleteUser(UsersRecord thisUser) {
  String userID = thisUser.uid;
  //String thisUserAsString = thisUser.path;
  //String thisUserID = thisUserAsString.substring(7);

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

bool sendFriendRequest(
  DocumentReference senderRef,
  String receiverUsername,
  List<UsersRecord> usersCollection,
) {
  bool toReturn = false;
  UsersRecord receiverUser = usersCollection[0];
  String senderRefAsString = senderRef.path;
  String senderRefID = senderRefAsString.substring(7);
  UsersRecord senderUser = usersCollection[0];

  for (int usersIndex = 0; usersIndex < usersCollection.length; usersIndex++) {
    if (usersCollection[usersIndex].uid == senderRefID) {
      senderUser = usersCollection[usersIndex];
    }
  }

  for (UsersRecord user in usersCollection) {
    if (receiverUsername.toLowerCase() == user.displayName.toLowerCase()) {
      receiverUser = user;
    }
  }

  DocumentReference receiverRef = receiverUser.reference;

  if (receiverUser.friendRequests.contains(senderRef) ||
      receiverUser.friendsList.contains(senderRef)) {
    toReturn = false;
  } else if (senderUser.friendRequests.contains(receiverRef) ||
      senderUser.friendsList.contains(receiverRef)) {
    toReturn = false;
  } else {
    receiverUser.friendRequests.add(senderRef);
    toReturn = true;
  }

  /*UsersRecord senderUser = usersCollection[0];
  UsersRecord receiverUser = usersCollection[1];
  bool toReturn;

  for (UsersRecord user in usersCollection) {
    if (senderUsername.toLowerCase() == user.displayName.toLowerCase()) {
      UsersRecord senderUser = user;
    }
    if (receiverUsername.toLowerCase() == user.displayName.toLowerCase()) {
      UsersRecord receiverUser = user;
    }
  }

  if (receiverUser.friendRequests.contains(senderUser)) {
    toReturn = false;
  } else {
    receiverUser.friendRequests.add(senderUser as DocumentReference<Object?>);
    toReturn = true;
  }

  return toReturn;

  if (senderUser in receiverUser.friendRequests){
    toReturn = false;
  } else {
  receiverUser.friendRequests.add(senderUser);
  toReturn = true;
  }
  return toReturn;*/

  return toReturn;
}

DocumentReference? friendRequestUsernames(
  UsersRecord authUser,
  int indexInList,
  List<UsersRecord> allUsers,
) {
  String returnUsername = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference<Object?> returnUserRef =
      authUser.friendRequests.elementAt(indexInList);

  return returnUserRef;

  //return "Test";
}

bool acceptFriendRequest(
  String requesterUsername,
  UsersRecord accepterUser,
  List<UsersRecord> usersCollection,
) {
  bool toReturn = false;
  UsersRecord requesterUser = usersCollection[0];

  for (int usersIndex = 0; usersIndex < usersCollection.length; usersIndex++) {
    if (usersCollection[usersIndex].displayName == requesterUsername) {
      requesterUser = usersCollection[usersIndex];
    }
  }

  DocumentReference requesterRef = requesterUser.reference;

  if (accepterUser.friendRequests.contains(requesterRef)) {
    accepterUser.friendsList.add(requesterRef);
    accepterUser.friendRequests.remove(requesterRef);
    toReturn = true;
  }

  return toReturn;
}

bool removeFriendsListFriend(
  String friendUsername,
  UsersRecord removerUser,
  List<UsersRecord> usersCollection,
) {
  bool toReturn = false;
  UsersRecord friendUser = usersCollection[0];

  for (int usersIndex = 0; usersIndex < usersCollection.length; usersIndex++) {
    if (usersCollection[usersIndex].displayName == friendUsername) {
      friendUser = usersCollection[usersIndex];
    }
  }

  DocumentReference friendRef = friendUser.reference;

  if (removerUser.friendsList.contains(friendRef)) {
    removerUser.friendsList.remove(friendRef);
    toReturn = true;
  }
  return toReturn;
}

bool removeFriendRequest(
  String requesterUsername,
  UsersRecord removerUser,
  List<UsersRecord> usersCollection,
) {
  bool toReturn = false;
  UsersRecord requesterUser = usersCollection[0];

  for (int usersIndex = 0; usersIndex < usersCollection.length; usersIndex++) {
    if (usersCollection[usersIndex].displayName == requesterUsername) {
      requesterUser = usersCollection[usersIndex];
    }
  }

  DocumentReference requesterRef = requesterUser.reference;

  if (removerUser.friendRequests.contains(requesterRef)) {
    removerUser.friendRequests.remove(requesterRef);
    toReturn = true;
  }
  return toReturn;
}
