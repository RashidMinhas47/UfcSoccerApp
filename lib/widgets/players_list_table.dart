import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/players_list_provider.dart';
import 'package:ufc_soccer/utils/constants.dart';

class PlayersListTable extends ConsumerWidget {
  const PlayersListTable({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final playersPro = ref.watch(playersListProvider);
    playersPro.fetchPlayers();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 499,
      child: ListView.builder(
        itemCount: playersPro.teamAPlayers.length, // Example number of rows
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.4)), // Divider above row
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: const BoxDecoration(color: kPrimaryColor),
                    child: const Icon(
                      Icons.check,
                      size: 8,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      playersPro.teamAPlayers[index], // Example team name
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      playersPro.teamBPlayers[index], // Example team name
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
          ],
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context, ref) {
  //   final playersProvider = ref.watch(playersListProvider.notifier);

  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  //     margin: EdgeInsets.symmetric(horizontal: 30),
  //     height: 400,
  //     width: double.maxFinite,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Flexible(
  //           child: SizedBox(
  //             width: 20,
  //             child: ListView.builder(
  //                 itemCount: playersProvider.teamAPlayers.length,
  //                 itemBuilder: (context, index) => Container(
  //                       padding: const EdgeInsets.all(2.0),
  //                       margin: const EdgeInsets.symmetric(vertical: 8.0),
  //                       decoration: const BoxDecoration(color: kPrimaryColor),
  //                       child: const Icon(
  //                         Icons.check,
  //                         size: 12,
  //                         color: kWhiteColor,
  //                       ),
  //                     )
  //                 // Checkbox(
  //                 //   value: true,
  //                 //   onChanged: (value) {},
  //                 //   splashRadius: 0,
  //                 // ),
  //                 ),
  //           ),
  //         ),
  //         Flexible(
  //           child: Column(
  //             children: [
  //               _buildTeamHeader("Team A"),
  //               Expanded(
  //                 child: ListView.builder(
  //                   padding: EdgeInsets.only(top: 10),
  //                   itemCount: playersProvider.teamAPlayers.length,
  //                   itemBuilder: (context, index) {
  //                     return Padding(
  //                       padding: const EdgeInsets.symmetric(vertical: 4.0),
  //                       child: Text(
  //                         playersProvider.teamAPlayers[index],
  //                         textAlign: TextAlign.center,
  //                         style: GoogleFonts.poppins(fontSize: 14),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Flexible(
  //           child: Column(
  //             children: [
  //               _buildTeamHeader("Team B"),
  //               Expanded(
  //                 child: ListView.builder(
  //                   padding: const EdgeInsets.only(top: 10),
  //                   itemCount: playersProvider.teamAPlayers.length,
  //                   itemBuilder: (context, index) {
  //                     return Padding(
  //                       padding: const EdgeInsets.symmetric(vertical: 4),
  //                       child: Text(
  //                         playersProvider.teamBPlayers[index],
  //                         textAlign: TextAlign.center,
  //                         style: GoogleFonts.poppins(fontSize: 14),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTeamHeader(String teamName) => Container(
  //       color: kGrayColor,
  //   padding: const EdgeInsets.all(8),
  //   child: Row(
  //     children: [
  //       Text(
  //         teamName,
  //         textAlign: TextAlign.center,
  //         style: GoogleFonts.poppins(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 18,
  //         ),
  //       ),
  //     ],
  //   ),
  // );
