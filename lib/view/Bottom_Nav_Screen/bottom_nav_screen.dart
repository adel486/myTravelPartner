import 'package:flutter/material.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/group_screen/group_screen.dart';
import 'package:my_travel_partner/view/home_screen/home_screen.dart';
import 'package:my_travel_partner/view/profile_screen/profile_screen.dart';
import 'package:my_travel_partner/view/sos_screen/sos_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  List<Widget> myScreens = [
    HomeScreen(),
    GroupScreen(),
    SosScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],
      backgroundColor: ColorConstants.mainwhite,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: ColorConstants.primaryRed,
          unselectedItemColor: ColorConstants.primaryRed.withValues(alpha: 0.3),
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "groups"),
            BottomNavigationBarItem(icon: Icon(Icons.sos), label: "sos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded), label: "profile")
          ]),
    );
  }
}
