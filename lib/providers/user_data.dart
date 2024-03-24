import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ufc_soccer/screens/app_nav_bar.dart';
import 'package:ufc_soccer/screens/authentication_screen.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

final userData = ChangeNotifierProvider((ref) => UserData());

class UserData with ChangeNotifier {
  final _cloudFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String _nickname = '';
  late List<String> _positions = [];
  late String _imageUrl = '';
  late String _fullName = '';
  late String _jersyNumber;

  String userName() {
    final userName = _fullName;
    notifyListeners();
    return userName;
  }

  String get nickname => _nickname;
  List<String> get positions => _positions;
  String get imageUrl => _imageUrl;
  String get fullName => _fullName;
  String get jersyNumber => _jersyNumber;
  Future<void> checkAuthenticationStatus(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is logged in, navigate to HomeScreen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, AppNavBar.screen);
      });
    } else {
      // User is not logged in, navigate to SignUpScreen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, AuthScreen.screen);
      });
    }
    notifyListeners();
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> userData =
            await FirebaseFirestore.instance
                .collection(USERS)
                .doc(user.uid)
                .get();

        if (userData.exists) {
          _nickname = userData[NICKNAME];
          _positions = List<String>.from(userData[POSITIONS]);
          _imageUrl = userData[IMAGEURL];
          _fullName = userData[FULLNAME];
          _jersyNumber = userData[JERSYNUMBER];
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("YOU'VE GOT THE DATA")));
          notifyListeners();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("YOU'VE GOT Error DATA")));
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Update user profile data
  Future<void> updateUserProfile({
    required String nickname,
    required List<String> positions,
    required String imageUrl,
    required String fullName,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection(USERS)
            .doc(user.uid)
            .update({
          NICKNAME: nickname,
          POSITIONS: positions,
          IMAGEURL: imageUrl,
          FULLNAME: fullName,
        });

        // Update local data
        _nickname = nickname;
        _positions = positions;
        _imageUrl = imageUrl;
        _fullName = fullName;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating user profile: $e');
    }
  } // String userName() {
  //   final userName = _auth.currentUser!.displayName;
  //   notifyListeners();
  //   return userName!;
  // }
}
