import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/auth_providers.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';
import 'package:ufc_soccer/widgets/list_tile_with_border.dart';
import 'package:ufc_soccer/widgets/players_list_table.dart';

class VoteForNextGame extends ConsumerWidget {
  static const String screen = '/VoteForNextGame';
  const VoteForNextGame({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text(
        //       "Next Game",
        //       style: GoogleFonts.inter(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 30,
        //       ),
        //     ),
        //     centerTitle: true,
        //     actions: [
        //       IconButton(
        //           onPressed: () {
        //             ref.read(signInProvider).signOutUser(context);
        //           },
        //           icon: const Icon(Icons.settings))
        //     ],
        //   ),
        //   body:
        Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NextGameDetailTile(),
              const PlayersListTable(),
              // const PlayersListTable(),
              Text(
                'Remix Team {Vote countdown time}', //Todo: here the total time of the Remix Team Will be available for voters
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LargeFlatButton(
                      onPressed: () {},
                      size: Size(120, 60),
                      fontColor: kPrimaryColor,
                      label: "Yes",
                      backgroundColor: Colors.transparent),
                  const SizedBox(width: 20),
                  LargeFlatButton(
                      onPressed: () {},
                      size: const Size(120, 60),
                      fontColor: kPrimaryColor,
                      label: "No",
                      backgroundColor: Colors.transparent),
                ],
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
