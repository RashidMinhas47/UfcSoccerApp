import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ufc_soccer/screens/app_nav_bar.dart';
import 'package:ufc_soccer/screens/authentication_screen.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

final userDataProvider = ChangeNotifierProvider((ref) => UserDataProvider());
final nickNameCtr = ChangeNotifierProvider((ref) => TextEditingController());
final jersyController =
    ChangeNotifierProvider((ref) => TextEditingController());

class UserDataProvider with ChangeNotifier {
  UserDataProvider() {
    fetchUserData();
  }
  bool userUpdation = false;
  String _nickname = '';
  List<String> _positions = [];
  String _imageUrl = '';
  String _fullName = '';
  int _jersyNumber = 0;

  List<Map<String, dynamic>> _postionsData = [
    {
      POSITIONS: "Forward",
      VALUE: false,
    },
    {
      POSITIONS: "Striker",
      VALUE: false,
    },
    {
      POSITIONS: "Mid Field",
      VALUE: false,
    },
    {
      POSITIONS: "Defense",
      VALUE: false,
    },
    {
      POSITIONS: "Goalie",
      VALUE: false,
    },
  ];
  List<Map<String, dynamic>> get postionsList => _postionsData;

  String userName() {
    final userName = _fullName;
    notifyListeners();
    return userName;
  }

  String get nickname => _nickname;
  List<String> get positions => _positions;
  String get imageUrl => _imageUrl;
  String get fullName => _fullName;
  int get jersyNumber => _jersyNumber;
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
  Future<void> fetchUserData() async {
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
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text("Welcome")));
          notifyListeners();
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text("Something Wrong with your connection")));
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
    required int jersyNumber,
    required BuildContext context,
  }) async {
    try {
      userUpdation = true;
      notifyListeners();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection(USERS)
            .doc(user.uid)
            .update({
          NICKNAME: nickname,
          POSITIONS: positions,
          IMAGEURL: imageUrl,
          JERSYNUMBER: jersyNumber
          // FULLNAME: fullName,
        });

        // Update local data
        _nickname = nickname;
        _positions = positions;
        _imageUrl = imageUrl;
        _fullName = fullName;
        notifyListeners();
      }
      userUpdation = false;
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      userUpdation = false;
      notifyListeners();
      print('Error updating user profile: $e');
    }
  } // String userName() {

  void updateNickname(String newNickname) {
    _nickname = newNickname;
    notifyListeners();
  }

  void updateJerseyNumber(int newJerseyNumber) {
    _jersyNumber = newJerseyNumber;
    notifyListeners();
  }

  List<String> getSelectedPositions() {
    List<String> selectedPositions = [];
    for (var position in _postionsData) {
      if (position[VALUE]) {
        selectedPositions.add(position[POSITIONS]);
      }
    }
    notifyListeners();
    return selectedPositions;
  }

  void togglePosition(int index) {
    _postionsData[index][VALUE] = !_postionsData[index][VALUE];
    notifyListeners();
  }

  // void updateProfile() async {
  //   try {
  //     // Update user data in Firestore
  //     await _cloudFirestore
  //         .collection(USERS)
  //         .doc(_auth.currentUser!.uid)
  //         .update({
  //       NICKNAME: nickname,
  //       JERSYNUMBER: _jersyNumber,
  //       POSITIONS: getSelectedPositions(),
  //     });
  //     print('User data updated successfully!');
  //   } catch (error) {
  //     print('Error updating user data: $error');
  //   }
  // }
}
