// // Model class to represent game data
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ufc_soccer/utils/firebase_const.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

class GameModel {
  String date;
  String name;
  String time;
  String location;
  String manager;
  int maxPlayer;
  bool remixVoting;
  int timeCountdown;

  GameModel({
    required this.date,
    required this.name,
    required this.time,
    required this.location,
    required this.manager,
    required this.maxPlayer,
    required this.remixVoting,
    required this.timeCountdown,
  });
}

// Provider for fetching game data from Firestore
final gameListProvider = StreamProvider<List<GameModel>>((ref) {
  final firestore = FirebaseFirestore.instance;
  // final admins = firestore.collection(ADMINUIDS);
  // String currentUid = '';
  // final uids = admins.snapshots().map((snapshot) {
  //   return snapshot.docs.map((doc) {
  //     final data = doc.data();
  //     currentUid = data[UID];
  //     return;
  //   });
  // });
  // final data = admins.

  final collection = firestore.collection(GAMES);
  return collection.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return GameModel(
        name: data[ADMINNAME] ?? "",
        date: data[DATE] ?? '',
        time: data[TIME] ?? '',
        location: data[LOCATION] ?? '',
        manager: data[MANAGERS] ?? '',
        maxPlayer: data[MAXPLAYER] ?? 0,
        remixVoting: data[REMIXVOTING] ?? false,
        timeCountdown: data[TIMECOUNTDOWN] ?? 0,
      );
    }).toList();
  });
});

// final gameListProvider = StreamProvider<List<GameModel>>((ref) {
//   final firestore = FirebaseFirestore.instance;
//   final auth = FirebaseAuth.instance;
//   final currentUser = auth.currentUser;

//   if (currentUser == null) {
//     // Return an empty list if the user is not logged in
//     return Stream.value([]);
//   }

//   final uid = currentUser.uid;
//   final userGamesCollection =
//       firestore.collection(AllGAMES).doc(uid).collection(GAMES);

//   return userGamesCollection.snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) {
//       final data = doc.data();
//       return GameModel(
//         date: data[DATE] ?? '',
//         time: data[TIME] ?? '',
//         location: data[LOCATION] ?? '',
//         manager: data[MANAGERS] ?? '',
//         maxPlayer: data[MAXPLAYER] ?? 0,
//         remixVoting: data[REMIXVOTING] ?? false,
//         timeCountdown: data[TIMECOUNTDOWN] ?? 0,
//       );
//     }).toList();
//   });
// });
