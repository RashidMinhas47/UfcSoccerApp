import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ufc_soccer/screens/home_screen.dart';
import 'package:ufc_soccer/utils/image_urls.dart';

class AppNavBar extends StatefulWidget {
  static const String screen = '/AppNavBar';
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  List<Widget> screens = [NextGameScreen(), NextGameScreen(), NextGameScreen()];
  int currentIndex = 0;
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
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              label: 'Game',
              icon: SvgPicture.asset(
                AppSvg.footballIcon,
                height: 20,
              )),
          BottomNavigationBarItem(
              label: "Profile",
              icon: SvgPicture.asset(
                AppSvg.footballIcon,
                height: 20,
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
