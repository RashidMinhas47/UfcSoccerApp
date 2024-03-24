import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/screens/profile_screens/edit_profile_screen.dart';
import 'package:ufc_soccer/utils/image_urls.dart';

class UserProfileCard extends ConsumerWidget {
  const UserProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      leading: CircleAvatar(child: SvgPicture.asset(AppSvg.userIcon)),
      title: Text(
        "${ref.read(userData).userName()}[${ref.read(userData).jersyNumber}]",
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          Text(
            ref.read(userData).nickname,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
          Text(
            "${ref.read(userData).positions.join(', ')}",
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ],
      ),
      trailing: IconButton(
          onPressed: () =>
              Navigator.pushNamed(context, EditProfileScreen.screen),
          icon: Icon(Icons.edit),
          color: Colors.black),
    );
  }
}

class UserProfileCardWithoutAction extends ConsumerWidget {
  const UserProfileCardWithoutAction({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      leading: CircleAvatar(child: SvgPicture.asset(AppSvg.userIcon)),
      title: Text(
        "${ref.read(userData).userName()}[${ref.read(userData).jersyNumber}]",
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          Text(
            ref.read(userData).nickname,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
          Text(
            "${ref.read(userData).positions.join(', ')}",
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
