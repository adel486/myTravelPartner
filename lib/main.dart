import 'package:flutter/material.dart';
import 'package:my_travel_partner/controller/group_screen_controller.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:my_travel_partner/controller/my_trip_screen_controller.dart';
import 'package:my_travel_partner/view/Bottom_Nav_Screen/bottom_nav_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GroupScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyTripScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavScreen(),
      ),
    );
  }
}
