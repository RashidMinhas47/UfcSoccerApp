import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/home_screen_porvider.dart';
import 'package:ufc_soccer/providers/joining_&_leaving_provider.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/utils/firebase_const.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';
import 'package:ufc_soccer/widgets/game_list.dart';

class LeaveGameScreen extends ConsumerWidget {
  static const String screen = '/LeaveGameScreen';
  const LeaveGameScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return
        // Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Next Game",
        //     style: GoogleFonts.inter(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 30,
        //     ),
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           ref.read(signInProvider).signOutUser(context);
        //         },
        //         icon: const Icon(Icons.settings))
        //   ],
        // ),
        // body:
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: const BoxDecoration(color: kGrayColor),
                    child: const Icon(
                      Icons.image,
                      size: 140,
                    ),
                  ),
                ),
                Text(
                  "Sign Up For a Game",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const Text(
                    "{Next Game Date Time}"), //todo: here the data will come
                const Text(
                    "{Spots Available}"), //todo: herer the data will come
                LargeFlatButton(
                  onPressed: () {},
                  size: const Size(200, 100),
                  fontColor: kPrimaryColor,
                  label: 'Leave Game',
                  backgroundColor: Colors.white.withOpacity(0),
                ),
              ],
            )

            // ),
            );
  }
}

class JoinGameScreen extends ConsumerWidget {
  static const String screen = '/JoinGameScreen';
  const JoinGameScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final gamePro = ref.watch(homeScreenProvider);

    return
        // Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Next Game",
        //     style: GoogleFonts.inter(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 30,
        //     ),
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           ref.read(signInProvider).signOutUser(context);
        //         },
        //         icon: const Icon(Icons.settings))
        //   ],
        // ),
        // body:
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer(
        builder: (context, ref, child) {
          final gameList =
              ref.watch(gameListProvider); // Access the gameListProvider

          return gameList.when(
            data: (games) {
              return ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(game.name,
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                      ),

                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: const BoxDecoration(color: kGrayColor),
                          child: const Icon(
                            Icons.image,
                            size: 140,
                          ),
                        ),
                      ),
                      Text(
                        "Sign Up For a Game",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                          "Date: ${game.date} Time: ${game.time}"), //todo: here the data will come
                      Text(
                          "Available Spots: ${game.maxPlayer.toString()}"), //todo: herer the data will come
                      LargeFlatButton(
                        onPressed: () async {
                          try {
                            final _firestore = FirebaseFirestore.instance;

                            // Retrieve the document ID (gameId) of the current game
                            String gameId =
                                ''; // Initialize with an empty string
                            QuerySnapshot querySnapshot = await _firestore
                                .collection(GAMES)
                                .where(TOTALPLAYERS, arrayContains: game.name)
                                .get();
                            for (int i = 0;
                                i < querySnapshot.docs.length;
                                i++) {
                              if (querySnapshot.docs.isNotEmpty) {
                                gameId = querySnapshot.docs[index].id;
                              }

                              // Update the MAXPLAYER property and add the user's name to JOINEDPLAYERS list
                              if (gameId.isNotEmpty) {
                                await _firestore
                                    .collection(GAMES)
                                    .doc(gameId)
                                    .update({
                                  MAXPLAYER: game.maxPlayer -
                                      1, // Decrement the maxPlayer count
                                  JOINEDPLAYERS: FieldValue.arrayUnion([
                                    (ref
                                        .watch(userDataProvider.notifier)
                                        .fullName)
                                  ]), // Add player's name to JOINEDPLAYERS
                                });
                              }
                            }
                          } catch (error) {
                            print('Error joining game: $error');
                          }
                        },
                        size: const Size(200, 100),
                        fontColor: kPrimaryColor,
                        label: 'Join Game',
                        backgroundColor: Colors.white.withOpacity(0),
                      ),
                    ],
                  );
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          );
        },
      ),
    );
  }
}
