import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

final setupGameProvider = ChangeNotifierProvider((ref) => SetupGameProvider());

class SetupGameProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // String? date;
  // String? time;
  // String? location;
  // String? manager;
  // int? maxPlayers;
  bool remixVoting = false;
  int? timeCountdown;
  int? maxPlayers;
  bool isLoading = false;
  bool gameCompletionStatus = false;
  List<String> voteers = [];
  List<String> joinedPalyers = [];

  void setMaxPlayers(String value) {
    maxPlayers = int.parse(value);
    notifyListeners();
  }

  void setTimeCountdown(value) {
    timeCountdown = int.parse(value);
  }

  void setVotingCondition(bool value) {
    remixVoting = !remixVoting;
    notifyListeners();
  }

  Future<void> setupGame(BuildContext context,
      {required String date,
      required String time,
      required String location,
      required String manager,
      required int maxPlayers,
      required bool remixVoting,
      required int timeCountdown}) async {
    try {
      isLoading = true;
      final auth = FirebaseAuth.instance;
      User user = auth.currentUser!;
      notifyListeners();

      if (remixVoting) {
        await _firestore.collection(ADMINUIDS).add({
          UID: user.uid,
          FULLNAME: user.displayName,
          EMAIL: user.email,
        });
        // final totalPlayers = await _firestore.collection(USERS)
        // try {
        // Fetch all documents from the USERS collection
        final QuerySnapshot querySnapshot =
            await _firestore.collection(USERS).get();

        // Extract the fullName property from each document and store in a list
        List<String> playerNames =
            querySnapshot.docs.map((doc) => doc[FULLNAME] as String).toList();

        // Now 'fullNames' contains all the fullName values from the USERS collection
        print('Full Names: $playerNames');
// } catch (error) {
//   print('Error retrieving full names: $error');
// }
        await _firestore.collection(GAMES).add({
          ADMINNAME: user.displayName,
          IMAGEURL: "",
          DATE: date,
          TIME: time,
          LOCATION: location,
          MANAGERS: manager,
          MAXPLAYER: maxPlayers,
          REMIXVOTING: remixVoting,
          TIMECOUNTDOWN: timeCountdown,
          GAMESTATUS: gameCompletionStatus,
          JOINEDPLAYERS: joinedPalyers,
          VOTERS: voteers,
          TOTALPLAYERS: playerNames,
        });
      } else {
        final QuerySnapshot querySnapshot =
            await _firestore.collection(USERS).get();

        // Extract the fullName property from each document and store in a list
        List<String> playerNames =
            querySnapshot.docs.map((doc) => doc[FULLNAME] as String).toList();

        // Now 'fullNames' contains all the fullName values from the USERS collection
        print('Full Names: $playerNames');
        await _firestore.collection(GAMES).add({
          ADMINNAME: user.displayName,
          DATE: date,
          TIME: time,
          LOCATION: location,
          MANAGERS: manager,
          MAXPLAYER: maxPlayers,
          REMIXVOTING: remixVoting,
          TIMECOUNTDOWN: timeCountdown,
          GAMESTATUS: gameCompletionStatus,
          JOINEDPLAYERS: joinedPalyers,
          TOTALPLAYERS: playerNames,
        });
      }
      print('New game setup successful!');
      isLoading = false;
      Navigator.pop(context);
    } catch (error) {
      print('Error setting up new game: $error');
    }
  }
}
