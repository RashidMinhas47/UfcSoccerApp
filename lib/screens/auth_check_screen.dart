import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/screens/app_nav_bar.dart';
import 'package:ufc_soccer/screens/authentication_screen.dart';
import 'package:ufc_soccer/screens/home/home_screen.dart';

class AuthCheckScreen extends ConsumerStatefulWidget {
  static const String screen = '/AuthCheckScreen';
  const AuthCheckScreen({super.key});

  @override
  _AuthCheckScreenState createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends ConsumerState<AuthCheckScreen> {
  // @override
  // void initState() async {
  //   super.initState();
  //   await ref.read(userData).fetchUserData(context);
  //   await ref.read(userData).checkAuthenticationStatus(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.read(userData).checkAuthenticationStatus(context),
        builder: (context, snapshot) => FutureBuilder(
          future: ref.read(userData).fetchUserData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const AppNavBar();
            } else {
              return const AuthScreen();
            }
          },
        ),
      ),
    );
  }
}
