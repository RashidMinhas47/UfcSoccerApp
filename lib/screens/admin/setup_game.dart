// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DateProvider extends ChangeNotifier {
//   DateTime? _selectedDate;

//   DateTime? get selectedDate => _selectedDate;

//   void setDate(DateTime date) {
//     _selectedDate = date;
//     notifyListeners();
//   }
// }

// final dateProvider =
//     ChangeNotifierProvider<DateProvider>((ref) => DateProvider());

// class GameSetupScreen extends ConsumerWidget {
//   static const String screen = "/GameSetupScreen";

//   @override
//   Widget build(BuildContext context, ref) {
//     final selectedDate = ref.watch(dateProvider).selectedDate;

//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: TextButton(
//                 onPressed: () {
//                   _selectDate(context, ref.read(dateProvider));
//                 },
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                       EdgeInsets.all(15)),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       side: BorderSide(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       selectedDate == null
//                           ? 'Select Date'
//                           : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
//                       style: GoogleFonts.poppins(),
//                     ),
//                     Icon(Icons.calendar_today),
//                   ],
//                 ),
//               ),
//             ),
//             // Repeat the same pattern for other buttons
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Enter Remix Time Countdown',
//                   style: GoogleFonts.poppins()),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Setup Game', style: GoogleFonts.poppins()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(
//       BuildContext context, DateProvider dateProvider) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: dateProvider.selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       dateProvider.setDate(picked);
//     }
//   }
// }

///////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GameSetupScreen extends StatefulWidget {
//   static const String screen = "/GameSetupScreen";

//   @override
//   _GameSetupScreenState createState() => _GameSetupScreenState();
// }

// class _GameSetupScreenState extends State<GameSetupScreen> {
//   DateTime? selectedDate; // Corrected the type of selectedDate

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: TextButton(
//                 onPressed: () {
//                   _selectDate(context);
//                 },
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                       EdgeInsets.all(15)),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       side: BorderSide(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       selectedDate == null
//                           ? 'Select Date'
//                           : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
//                       style: GoogleFonts.poppins(),
//                     ),
//                     Icon(Icons.calendar_today),
//                   ],
//                 ),
//               ),
//             ),
//             // Repeat the same pattern for other buttons
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Enter Remix Time Countdown',
//                   style: GoogleFonts.poppins()),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Setup Game', style: GoogleFonts.poppins()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/widgets/date_time_buttons.dart';

class GameSetupScreen extends StatelessWidget {
  static const String screen = "/GameSetupScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Setup Game",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DateTimeButtons(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
             SwitchListTile(
              title: Text('Remix Voting', style: GoogleFonts.poppins()),
              value: false,
              onChanged: (bool value) {},
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
