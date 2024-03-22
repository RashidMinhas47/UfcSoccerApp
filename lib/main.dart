import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ufc_soccer/screens/app_nav_bar.dart';
import 'package:ufc_soccer/screens/home_screen.dart';
import 'firebase_options.dart';
import 'screens/authentication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavBar.screen,
      routes: {
        AuthScreen.screen: (context) => const AuthScreen(),
        AppNavBar.screen: (context) => const AppNavBar(),
        NextGameScreen.screen: (context) => const NextGameScreen(),
      },
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ufc_soccer/firebase_options.dart';
// import 'package:ufc_soccer/utils/const_widgets.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     home: AdminLoginPage(),
//   ));
// }

// class AdminLoginPage extends StatefulWidget {
//   @override
//   _AdminLoginPageState createState() => _AdminLoginPageState();
// }

// class _AdminLoginPageState extends State<AdminLoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String _errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 12),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: () {
//                 _signInWithEmailAndPassword();
//               },
//               child: Text('Sign In'),
//             ),
//             SizedBox(height: 12),
//             Text(
//               _errorMessage,
//               style: TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _signInWithEmailAndPassword() async {
//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       if (userCredential.user != null) {
//         // Check if the user is admin (You might have your own criteria to determine admin privilege)
//         // For example, you might store admin users' UIDs in Firestore or Firebase Realtime Database
//         String adminUID = '35Q1ASR4JZdDeh8KhZlG0awx7222';
//         if (userCredential.user!.uid == adminUID) {
//           // Navigate to admin dashboard or perform admin actions
//           // Navigator.pushReplacementNamed(context, '/admin_dashboard');
//           AppSnackBar.snackBar(context, "You are Admin");
//         } else {
//           setState(() {
//             _errorMessage = 'You are not authorized as an admin.';
//           });
//         }
//       } else {
//         setState(() {
//           _errorMessage = 'Sign in failed. Please check your credentials.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Error: $e';
//       });
//     }
//   }

// }
