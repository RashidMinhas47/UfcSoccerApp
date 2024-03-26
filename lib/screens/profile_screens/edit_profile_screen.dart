import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/screens/profile_screens/game_videos_screen.dart';
import 'package:ufc_soccer/utils/constants.dart';

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
          CustomLargeButton(
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

class CustomLargeButton extends StatelessWidget {
  const CustomLargeButton(
      {super.key,
      required this.onPressed,
      required this.size,
      required this.fontColor,
      required this.label,
      this.paddH = 0,
      this.paddV = 0,
      required this.backgroundColor});

  final Size size;
  final Color fontColor;
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final double paddH;
  final double paddV;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddH, vertical: paddV),
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            fixedSize: Size(size.width * 0.9, 20 * 2.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey)),
            backgroundColor: Color(0xFF12BCE3).withOpacity(0),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16 * 1,
              fontWeight: FontWeight.w500,
              height: 1.2125 * 1 / 1,
              color: fontColor,
            ),
          )),
    );
  }
}
