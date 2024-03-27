import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';

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
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const Text("{Next Game Date Time}"), //todo: here the data will come
          const Text("{Spots Available}"), //todo: herer the data will come
          LargeFlatButton(
            onPressed: () {},
            size: const Size(200, 100),
            fontColor: kPrimaryColor,
            label: 'Join Game',
            backgroundColor: Colors.white.withOpacity(0),
          ),
        ],
      ),
      // ),
    );
  }
}
