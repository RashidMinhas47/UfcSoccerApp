import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchCustomButton extends StatelessWidget {
  const SwitchCustomButton({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(label, style: GoogleFonts.poppins()),
      value: false,
      onChanged: (bool value) {},
    );
  }
}
