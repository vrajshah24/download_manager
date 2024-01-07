import 'package:download_manager/Database/local/MySharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:download_manager/Global%20Components/colors.dart';
import 'package:download_manager/Screens/home_page.dart';
import 'package:download_manager/Screens/profile_page.dart';

class NavBarMainHome extends StatefulWidget {
  const NavBarMainHome({super.key});

  @override
  State<NavBarMainHome> createState() => _NavBarMainHomeState();
}

class _NavBarMainHomeState extends State<NavBarMainHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(), ProfilePage()];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0x141f212b), offset: Offset(0, -5), blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndex,
            useLegacyColorScheme: false,
            elevation: 10,
            backgroundColor: Colors.white,
            // Label Style
            selectedLabelStyle: TextStyle(
                color: subPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 14),
            unselectedLabelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w900, fontSize: 14),

            // Icon Style
            iconSize: 28,
            unselectedIconTheme:
                const IconThemeData(color: Colors.grey, fill: 0.5),
            selectedIconTheme:
                IconThemeData(size: 35, color: subPrimaryColor, fill: 1.0),
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: "Home"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: "Profile"),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
