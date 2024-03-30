// Model class to represent home screen data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

class HomeData {
  String date;
  String time;
  String location;
  String manager;
  int maxPlayer;
  bool remixVoting;
  int timeCountdown;

  HomeData({
    required this.date,
    required this.time,
    required this.location,
    required this.manager,
    required this.maxPlayer,
    required this.remixVoting,
    required this.timeCountdown,
  });
}

class HomeDataProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  HomeData _homeData = HomeData(
    date: '',
    time: '',
    location: '',
    manager: '',
    maxPlayer: 0,
    remixVoting: false,
    timeCountdown: 0,
  );

  // Function to update home screen data
  void updateHomeData(HomeData newData) {
    _homeData = newData;
    notifyListeners();
  }

  // Function to retrieve home screen data
  HomeData getHomeData() => _homeData;

  // Function to fetch data from Firestore
  Future<void> fetchGameDataFromFirestore() async {
    try {
      // Fetch data from Firestore collection
      var snapshot = await _firestore.collection(GAMES).get();
      if (snapshot.docs.isNotEmpty) {
        // Extract data from the first document
        var data = snapshot.docs.first.data();
        // Create a new HomeData object from the retrieved data
        HomeData newData = HomeData(
          date: data['date'] ?? '',
          time: data['time'] ?? '',
          location: data['location'] ?? '',
          manager: data['manager'] ?? '',
          maxPlayer: data['maxPlayer'] ?? 0,
          remixVoting: data['remixVoting'] ?? false,
          timeCountdown: data['timeCountdown'] ?? 0,
        );
        // Update the home screen data
        updateHomeData(newData);
      }
    } catch (error) {
      print('Error fetching game data from Firestore: $error');
    }
  }
}
