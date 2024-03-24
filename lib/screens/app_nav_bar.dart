import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ufc_soccer/providers/user_data.dart';
import 'package:ufc_soccer/screens/home_screen.dart';
import 'package:ufc_soccer/screens/profile_screen.dart';
import 'package:ufc_soccer/utils/image_urls.dart';

class AppNavBar extends ConsumerStatefulWidget {
  static const String screen = '/AppNavBar';
  const AppNavBar({super.key});

  @override
  ConsumerState<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends ConsumerState<AppNavBar> {
  List<Widget> screens = [ProfileScreen(), NextGameScreen(), NextGameScreen()];
  int currentIndex = 0;
  // @override
  // void initState() async {
  //   super.initState();
  //   await ref.read(userData).fetchUserData(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              label: 'Game',
              icon: SvgPicture.asset(
                AppSvg.footballIcon,
                height: 20,
              )),
          const BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person_rounded,
              )),
          BottomNavigationBarItem(
              label: "Videos",
              icon: SvgPicture.asset(
                AppSvg.youtubeIcon,
                height: 20,
              ))
        ],
      ),
    );
  }
}
