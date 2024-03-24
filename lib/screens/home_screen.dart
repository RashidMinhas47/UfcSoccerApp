import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/auth_providers.dart';
import 'package:ufc_soccer/screens/auth_check_screen.dart';

class NextGameScreen extends ConsumerWidget {
  static const String screen = '/NextGameScreen';
  const NextGameScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Next Game",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(signInProvider).signOutUser(context);
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          children: [],
        ));
  }
}
