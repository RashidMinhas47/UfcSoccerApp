import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/game_setup_providers.dart';
import 'package:ufc_soccer/providers/text_controllers.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';
import 'package:ufc_soccer/widgets/text_field_with_border.dart';

import '../../widgets/app_bars.dart';

final urlControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

class ManageAppSettings extends ConsumerWidget {
  static const String screen = "/UpdateDropDownScreen";

  const ManageAppSettings({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final locationUrlPro = ref.read(locationCtrProvider);
    final gameInfoState = ref.read(gameInfoProvider.notifier);
    final gameAccessCodeProv = ref.read(gameAccessCodeProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.appBar("Game Admin", "Manage App Settings"),
      body: Padding(
        padding: kPadd20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFeildWithBorder(
                      controller: locationUrlPro, hintText: 'Enter Locations'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 34,
                    ))
              ],
            ),
            buildOptionTiles("First Option"),
            buildOptionTiles("Second Option"),
            Row(
              children: [
                Expanded(
                  child: TextFeildWithBorder(
                      controller: locationUrlPro, hintText: 'Enter Managers'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 34,
                    ))
              ],
            ),
            buildOptionTiles("First Option"),
            buildOptionTiles("Second Option"),
            Text(
              "Update access code required to create an account",
              style: GoogleFonts.poppins(fontSize: 18, color: kGrayColor),
            ),
            TextFeildWithBorder(
              paddH: 40,
              controller: gameAccessCodeProv,
              hintText: 'APP Access Code',
            ),
            LargeFlatButton(
              onPressed: () {},
              size: size,
              fontColor: kPrimaryColor,
              label: 'Update Player Stats',
              backgroundColor: Colors.white.withOpacity(0),
            ),
          ],
        ),
      ),
    );
  }

  Column buildOptionTiles(String label) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.compass_calibration,
            size: 14,
          ),
          title: Text(
            label,
            style: GoogleFonts.poppins(fontSize: 18),
          ),
        ),
        Divider(
          endIndent: 10,
          indent: 10,
          thickness: 1.4,
          color: Colors.grey.withOpacity(0.3),
        ),
      ],
    );
  }
}
