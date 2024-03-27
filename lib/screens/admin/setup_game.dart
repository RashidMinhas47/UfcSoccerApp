import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/utils/constants.dart';
import 'package:ufc_soccer/widgets/app_bars.dart';
import 'package:ufc_soccer/widgets/custom_switch_btn.dart';
import 'package:ufc_soccer/widgets/date_time_buttons.dart';

class GameSetupScreen extends StatelessWidget {
  static const String screen = "/GameSetupScreen";

  const GameSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  items:
                      ['Option 1', 'Option 2', 'Option 3'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Manager',
                  hintStyle: GoogleFonts.poppins(),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Manager',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                  items:
                      ['Option 1', 'Option 2', 'Option 3'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Max Player',
                  hintStyle: GoogleFonts.poppins(),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Max Player',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                  items:
                      ['Option 1', 'Option 2', 'Option 3'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: GoogleFonts.poppins()),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              ),
            ),
            const SwitchCustomButton(
              label: 'Remix Voting',
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enter Remix Time Countdown',
                  style: GoogleFonts.poppins()),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Setup Game', style: GoogleFonts.poppins()),
            ),
          ],
        ),
      ),
    );
  }
}
