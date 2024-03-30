import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';

import 'package:ufc_soccer/widgets/user_card.dart';
import 'package:ufc_soccer/widgets/user_profile_form.dart';

class EditProfileScreen extends ConsumerWidget {
  static const String screen = '/EditProfileScreen';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final editProfilePro = ref.watch(userDataProvider);
    final jersyCtr = ref.watch(jersyController);
    final nickName = ref.watch(nickNameCtr);
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
      body: editProfilePro.userUpdation
          ? prograssWidget
          : SingleChildScrollView(
              child: Column(
                children: [
                  UserProfileCardWithoutAction(
                    label:
                        "${editProfilePro.userName()}[${editProfilePro.jersyNumber}]",
                    subtitle: ref.read(userDataProvider).nickname,
                    subtitle2: ref.read(userDataProvider).positions.join(', '),
                  ),
                  const UserProfileForm(),
                  LargeFlatButton(
                    backgroundColor: kPrimaryColor,
                    size: size,
                    onPressed: () {
                      if (nickName.text != null ||
                          nickName.text.isEmpty && jersyCtr.text != null ||
                          jersyCtr.text.isEmpty) {
                        editProfilePro.updateNickname(nickName.text);
                        editProfilePro
                            .updateJerseyNumber(int.parse(jersyCtr.text));
                        editProfilePro.updateUserProfile(
                            context: context,
                            nickname: editProfilePro.nickname,
                            jersyNumber: int.parse(jersyCtr.text),
                            positions: editProfilePro.getSelectedPositions(),
                            imageUrl: '',
                            fullName: 'fullName');
                      }

                      // editProfilePro.updateJerseyNumber(newJerseyNumber)
                    },
                    label: 'Update',
                    fontColor: kWhiteColor,
                  )
                ],
              ),
            ),
    );
  }
}

const prograssWidget = Center(
  child: CircularProgressIndicator(),
);
