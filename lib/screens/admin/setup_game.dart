import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/admin_provider.dart';
import 'package:ufc_soccer/providers/date_time_provider.dart';
import 'package:ufc_soccer/providers/setup_game_provider.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/app_bars.dart';
import 'package:ufc_soccer/widgets/custom_large_btn.dart';
import 'package:ufc_soccer/widgets/custom_switch_btn.dart';
import 'package:ufc_soccer/widgets/date_time_buttons.dart';

class GameSetupScreen extends ConsumerWidget {
  static const String screen = "/GameSetupScreen";

  const GameSetupScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final setGamePro = ref.watch(setupGameProvider);
    final dateTimePro = ref.watch(dateTimeProvider);
    final adminPro = ref.watch(adminProvider);
    String? selectedLocation;
    String? selectedManager;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBars.appBar('Game Admin', "Setup Game"),
      body: Padding(
        padding: kPadd20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DateTimeButtons(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Location',
                  hintStyle: GoogleFonts.poppins(),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Location',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                  items: adminPro.locations.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    selectedLocation = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Manager',
                  hintStyle: GoogleFonts.poppins(),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Manager',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                  items: adminPro.managers.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    selectedManager = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Max Player',
                  hintStyle: GoogleFonts.poppins(),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Max Player',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                  items: List.generate(99, (index) => index.toString())
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setGamePro.setManager(value);
                  },
                ),
              ),
            ),
            SwitchCustomButton(
              label: 'Remix Voting',
              value: setGamePro.remixVote,
              onChanged: (value) {
                setGamePro.setVoteCondition(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Remix Time Countdown',
                  hintStyle: GoogleFonts.poppins(),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enter Remix Time Countdown',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                  items: List.generate(99, (index) => index.toString())
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setGamePro.setManager(value);
                  },
                ),
              ),
            ),
            LargeFlatButton(
                onPressed: () {
                  setGamePro.setData(
                      context: context,
                      location: setGamePro.selectedLoctaion!,
                      manager: setGamePro.selectedManager!,
                      maxPlayers: setGamePro.maxPlayer!,
                      remixVoting: setGamePro.remixVote,
                      timePeriod: setGamePro.remixCountdown!,
                      date: dateFormator(
                        dateTimePro.selectedDate!.day,
                        dateTimePro.selectedDate!.month,
                        dateTimePro.selectedDate!.year,
                      ),
                      // "${}}/${}/${}",
                      time: timeFormator(
                          dateTimePro.selectedTime!.format(context),
                          dateTimePro.selectedTime!.period
                              .toString()
                              .toUpperCase())
                      // "${dateTimePro.selectedTime!.format(context)} ${dateTimePro.selectedTime!.period.toString().toUpperCase()}",
                      );
                },
                size: Size(200, 70),
                fontColor: kPrimaryColor,
                label: 'Setup Game',
                backgroundColor: Colors.white.withOpacity(0)),
          ],
        ),
      ),
    );
  }

  dateFormator(day, month, year) {
    return '$day/$month/$year';
  }

  timeFormator(time, period) {
    return '$time $period';
  }
}

// List<int> generateList = List.generate(30, (index) {
  
// });