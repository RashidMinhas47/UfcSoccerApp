import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/screens/profile_screens/game_videos_screen.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';

import 'package:ufc_soccer/widgets/list_of_videos.dart';
import 'package:ufc_soccer/widgets/player_stats.dart';
import 'package:ufc_soccer/widgets/sign_up_button.dart';
import 'package:ufc_soccer/widgets/user_card.dart';
import 'package:ufc_soccer/widgets/user_profile_form.dart';

class EditProfileScreen extends ConsumerWidget {
  static const String screen = '/EditProfileScreen';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const UserProfileCardWithoutAction(),
          UserProfileForm(),
          LargeFlatButton(
            backgroundColor: kPrimaryColor,
            size: size,
            onPressed: () {},
            label: 'Update',
            fontColor: kWhiteColor,
          )
        ],
      ),
    );
  }
}
