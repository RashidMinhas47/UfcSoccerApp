import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/screens/profile_screens/game_videos_screen.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/utils/image_urls.dart';
import 'package:ufc_soccer/widgets/list_of_videos.dart';
import 'package:ufc_soccer/widgets/player_stats.dart';
import 'package:ufc_soccer/widgets/user_card.dart';

class ProfileScreen extends ConsumerWidget {
  static const String screen = '/ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Player Profile",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const UserProfileCard(),
            const PlayerStatsCard(),
            Expanded(
                child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, GameVideosScreen.screen),
                    child: const VideoListTiles()))
          ],
        ));
  }
}
