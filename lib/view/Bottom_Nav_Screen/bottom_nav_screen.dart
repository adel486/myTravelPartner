import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/My_trip_screen/my_trip_screen.dart';
import 'package:my_travel_partner/view/group_screen/group_screen.dart';
import 'package:my_travel_partner/view/home_screen/home_screen.dart';
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
    MyTripScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.red.shade200,
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
