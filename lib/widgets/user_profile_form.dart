import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/manage_app_provider.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';

class UserProfileForm extends ConsumerWidget {
  // final TextEditingController? controller;

  const UserProfileForm({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final editProfilePro = ref.watch(userDataProvider);
    final nickName = ref.watch(nickNameCtr);
    final jersyCtr = ref.watch(jersyController);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nickname',
            style: GoogleFonts.poppins(fontSize: 20),
          ),
          TextFormField(
            controller: nickName,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Choose  a Nickname',
                hintStyle: GoogleFonts.poppins(fontSize: 18)),
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
          ),
          Text(
            'Jersy Number',
            style: GoogleFonts.poppins(fontSize: 20),
          ),
          TextFormField(
            controller: jersyCtr,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Enter  a Jersy Number',
                hintStyle: GoogleFonts.poppins(fontSize: 18)),
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
          ),

          const Divider(),
          const SizedBox(height: 20),
          Text(
            'Positions',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          for (int i = 0; i < editProfilePro.postionsList.length; i++)
            ListTile(
              leading: Checkbox(
                value: editProfilePro.postionsList[i][VALUE],
                onChanged: (bool? value) {
                  editProfilePro.togglePosition(i);
                },
              ),
              title: Text(
                editProfilePro.postionsList[i][POSITIONS],
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ),
            ),

          // ListTile(
          //   leading: Checkbox(
          //     value: false,
          //     onChanged: (bool? value) {},
          //   ),
          //   title: Text(
          //     'Striker',
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Checkbox(
          //     value: false,
          //     onChanged: (bool? value) {},
          //   ),
          //   title: Text(
          //     'Mid Field',
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Checkbox(
          //     value: false,
          //     onChanged: (bool? value) {},
          //   ),
          //   title: Text(
          //     'Defense',
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Checkbox(
          //     value: false,
          //     onChanged: (bool? value) {},
          //   ),
          //   title: Text(
          //     'Goalie',
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
