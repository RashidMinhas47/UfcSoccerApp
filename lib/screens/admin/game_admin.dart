import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/screens/profile_screens/edit_profile_screen.dart';
import 'package:ufc_soccer/screens/profile_screens/game_videos_screen.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

import 'package:ufc_soccer/widgets/list_of_videos.dart';
import 'package:ufc_soccer/widgets/player_stats.dart';
import 'package:ufc_soccer/widgets/sign_up_button.dart';
import 'package:ufc_soccer/widgets/user_card.dart';
import 'package:ufc_soccer/widgets/user_profile_form.dart';

class GameAdmin extends ConsumerWidget {
  static const String screen = '/GameAdmin';
  const GameAdmin({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Game Admin",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              for (int i = 0; i < 4; i)
                CustomLargeButton(
                  backgroundColor: kWhiteColor.withOpacity(0.0),
                  onPressed: () {},
                  size: size,
                  label: adminButtons[i][TITLE],
                  fontColor: kBlackColor,
                )
            ],
          ),
        ));
  }
}

List<Map<String, dynamic>> adminButtons = [
  {
    TITLE: 'Setup Match',
  },
  {
    TITLE: 'Game Info',
  },
  {
    TITLE: 'Update Player Stats',
  },
  {
    TITLE: 'Manage App Settings',
  }
];
