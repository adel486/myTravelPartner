import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:my_travel_partner/controller/group_screen_controller.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:my_travel_partner/controller/login_screen_controller.dart';
import 'package:my_travel_partner/controller/my_trip_screen_controller.dart';
import 'package:my_travel_partner/controller/plan_my_trip_screen_controller.dart';
import 'package:my_travel_partner/controller/sign_up_screen_controller.dart';
import 'package:my_travel_partner/view/login_screen/login_screen.dart';
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
          create: (context) => MyTripScreenController()..getTrips(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlanMyTripScreenController(),
        )
      ],
      child: MaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
        // here
        builder: FlutterSmartDialog.init(),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
