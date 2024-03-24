import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nickname',
            style: GoogleFonts.poppins(fontSize: 20),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Choose  a Nickname',
                hintStyle: GoogleFonts.poppins(fontSize: 18)),
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
          ),
          Divider(),
          SizedBox(height: 20),
          Text(
            'Positions',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text(
              'Forward',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text(
              'Striker',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text(
              'Mid Field',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text(
              'Defense',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text(
              'Goalie',
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
