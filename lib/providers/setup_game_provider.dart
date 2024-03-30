import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

final setupGameProvider = ChangeNotifierProvider((ref) => SetupGameProvider());

class SetupGameProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? date;
  String? time;
  String? location;
  String? manager;
  // int? maxPlayers;
  bool? remixVoting;
  int? timePeriod;
  String? _selectedLocation;
  String? _selectedManager;
  int? _maxPlayers;
  int? _remixCountdown;
  bool remixVote = false;
  String? get selectedLoctaion => _selectedLocation;
  String? get selectedManager => _selectedManager;
  int? get maxPlayer => _maxPlayers;
  int? get remixCountdown => _remixCountdown;

  void setLocation(value) {
    _selectedLocation = value;
    notifyListeners();
  }

  void setManager(value) {
    _selectedManager = value;
    notifyListeners();
  }

  void setMaxPlayer(value) {
    _maxPlayers = value;
    notifyListeners();
  }

  void setVoteCondition(bool value) {
    remixVote = !remixVote;
    notifyListeners();
  }

  void setData({
    required String date,
    required String time,
    required String location,
    required String manager,
    required int maxPlayers,
    required bool remixVoting,
    required int timePeriod,
    required BuildContext context,
  }) async {
    this.date = date;
    this.time = time;
    this.location = location;
    this.manager = manager;
    _maxPlayers = maxPlayer;
    this.remixVoting = remixVoting;
    this.timePeriod = timePeriod;

    try {
      if (date != null
          // &&
          // time != null &&
          // location != null &&
          // manager != null &&
          // maxPlayer != null &&
          // remixVote != null &&
          // timePeriod != null
          ) {
        await _firestore.collection(GAMES).add({
          DATE: date,
          TIME: time,
          LOCATIONS: location,
          MANAGERS: manager,
          MAXPLAYER: maxPlayer,
          REMIXVOTING: remixVote,
          TIMEPERIOD: timePeriod,
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Your Data is uploaded")));
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Your Missing Some fields")));
      }
      notifyListeners();
    } catch (error) {
      print('Error sending data to Firestore: $error');
    }
  }
}
