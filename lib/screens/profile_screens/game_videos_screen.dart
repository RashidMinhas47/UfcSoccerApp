import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/widgets/list_of_videos.dart';
import 'package:ufc_soccer/widgets/player_stats.dart';
import 'package:ufc_soccer/widgets/user_card.dart';

class GameVideosScreen extends ConsumerWidget {
  static const String screen = '/GameVideosScreen';
  const GameVideosScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Game Videos",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: const Color.fromARGB(255, 221, 221, 221),
              ),
            ),
            Expanded(child: VideoListTiles())
          ],
        ));
  }
}
