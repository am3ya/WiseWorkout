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

String formatDuration(double milliseconds) {
  Duration duration = Duration(milliseconds: milliseconds.toInt());
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

int weeklyWorkouts(String selectedNum) {
  int weekly = 0;

  if (selectedNum == "2") {
    weekly = 2;
  } else if (selectedNum == "3") {
    weekly = 3;
  } else if (selectedNum == "5") {
    weekly = 5;
  } else {
    weekly = 7;
  }

  return weekly;
}

bool doesClubExist(
  List<ClubsRecord> clubsCollection,
  String input,
) {
  return clubsCollection.any((club) => club.clubName == input);
}

bool compareUserRefs(
  DocumentReference ref1,
  DocumentReference ref2,
) {
  if (ref1 == ref2) {
    return true;
  } else {
    return false;
  }
}

bool removeClubRefFromUsers(
  List<UsersRecord> usersCollection,
  DocumentReference clubRef,
) {
  for (int i = 0; i < usersCollection.length; i++) {
    usersCollection[i].clubs.remove(clubRef);
  }

  return true;
}

double calculateBMR(
  String gender,
  double weight,
  double height,
  int age,
) {
  double bmr = 0.0;

  if (gender == "Male") {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  return double.parse(bmr.toStringAsFixed(3));
}

double calculateTDEE(
  String userActivity,
  double bmr,
) {
  double tdee = 2.0;

  if (userActivity == "Sedentary (little to no exercise)") {
    tdee = bmr * 1.2;
  } else if (userActivity ==
      "Lightly active (light exercise or sports 1-3 days per week)") {
    tdee = bmr * 1.375;
  } else if (userActivity ==
      "Moderately active (moderate exercise or sports 3-5 days per week)") {
    tdee = bmr * 1.55;
  } else if (userActivity ==
      "Very active (hard exercise or sports 6-7 days per week)") {
    tdee = bmr * 1.725;
  }

  return double.parse(tdee.toStringAsFixed(3));
}

double setDailyCalorieIntake(double tdee) {
  double calorieIntake = tdee + 300;

  return calorieIntake;
}

double setDailyBurnGoal(
  double dailyCalorieIntake,
  double tdee,
) {
  double dailyBurnGoal = 0.0;

  dailyBurnGoal = dailyCalorieIntake - tdee;

  return double.parse(dailyBurnGoal.toStringAsFixed(3));
  ;
}

String intakeMinusTdee(
  double calorieIntake,
  double tdee,
) {
  double difference = 0.0;
  String toReturn = "0";
  difference = calorieIntake - tdee;

  if (difference >= 0.0 && difference <= 99.9) {
    toReturn = "differenceTooLittle";
  } else if (difference >= 100.0 && difference <= 600.0) {
    toReturn = "good";
  } else if (difference < 0.0) {
    toReturn = "intakeTooLittle";
  } else if (difference > 600.0) {
    toReturn = "intakeTooMuch";
  }

  return toReturn;
}

double stringtoDouble(String str) {
  double result = 0.0;
  result = double.parse(str);

  return double.parse(result.toStringAsFixed(3));
}

int? durationDiff(
  DateTime weekStart,
  DateTime todaysDate,
) {
  Duration difference = todaysDate.difference(weekStart);

  int differenceInDays = difference.inDays;

  return differenceInDays;
}

int daysSinceEpoch() {
  int days = 0;

  int millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;

  // Convert milliseconds since epoch to seconds
  int secondsSinceEpoch = (millisecondsSinceEpoch / 1000).round();

  // Convert seconds to days
  int daysSinceEpoch = (secondsSinceEpoch / (60 * 60 * 24)).floor();

  return days;
}

String historyToString(
  String steps,
  String distance,
  String calories,
  String duration,
) {
  String returnStr = "I just burned ";
  returnStr = returnStr +
      calories +
      " calories and covered " +
      distance +
      " km all in " +
      duration +
      ". And I did it all in " +
      steps +
      " steps. Come join me on wise workout!";
  return returnStr;
}

double calculateBMI(
  double weight,
  double height,
) {
  double heightInMetres = height / 100;

  double bmi = weight / (heightInMetres * heightInMetres);

  return bmi;
}

int minusOne(int var1) {
  return var1 - 1;
}

DocumentReference randomAdvice(List<AdviceRecord> adviceCollection) {
  // Function to return the reference of a random document from the advice collection
  final randomIndex = math.Random().nextInt(adviceCollection.length);
  return adviceCollection[randomIndex].reference;
}

double? calculateWinPercentage(
  int? wins,
  int? draws,
  int? losses,
) {
  double winPercentage = 0.0;

  if (wins! > 0) {
    winPercentage = wins / (wins + draws! + losses!);
    winPercentage = winPercentage * 100;
  }

  return double.parse(winPercentage.toStringAsFixed(2));
}

String challengeToString(
  String friendName,
  String yourSteps,
  String theirSteps,
) {
  String toReturn = "lol";

  int yourStepsInt = int.parse(yourSteps);
  int theirStepsInt = int.parse(theirSteps);

  if (yourStepsInt > theirStepsInt) {
    toReturn = "I just beat " +
        friendName +
        " on wise workout! Their " +
        theirSteps +
        " were no match for my " +
        yourSteps +
        ". Next!";
  } else if (yourStepsInt < theirStepsInt) {
    toReturn = friendName +
        " just beat me on wise workout... Their " +
        theirSteps +
        " were just too good for my " +
        yourSteps +
        ". I'll get 'em next time!";
  } else {
    toReturn = friendName +
        " and I just drew on wise workout... We both ended on the same steps, " +
        theirSteps +
        " and " +
        yourSteps +
        ". How is that even possible?";
  }

  return toReturn;
}

List<String> stringSplitter(String largeString) {
  List<String> array = largeString.split(',');

  return array;
}

int plusOne(int number) {
  return number + 1;
}

int listSize(String theList) {
  // converts a string to list<String> and returns list length
  List<String> convertedList = theList.split(",");
  return convertedList.length;
}
