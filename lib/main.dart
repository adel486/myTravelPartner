import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:my_travel_partner/controller/group_screen_controller.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:my_travel_partner/controller/login_screen_controller.dart';
import 'package:my_travel_partner/controller/my_trip_screen_controller.dart';
import 'package:my_travel_partner/controller/plan_my_trip_screen_controller.dart';
import 'package:my_travel_partner/controller/profile_screen_controller.dart';
import 'package:my_travel_partner/controller/sign_up_screen_controller.dart';
import 'package:my_travel_partner/services/userservice.dart';
import 'package:my_travel_partner/view/Bottom_Nav_Screen/bottom_nav_screen.dart';
import 'package:my_travel_partner/view/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget home = LoginScreen();
  @override
  void initState() {
    
    super.initState();
    checklogin();
  }

  Future<void> checklogin() async {
    bool s = await UserService.isLoggedIn();
    if (s == true) {
      home = BottomNavScreen();
    } else {
      home = LoginScreen();
    }
    setState(() {});
  }

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
          create: (context) => MyTripScreenController()..getMyTrip(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlanMyTripScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileScreenController(),
        )
      ],
      child: MaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
        // here
        builder: FlutterSmartDialog.init(),
        debugShowCheckedModeBanner: false,
        home: home,
      ),
    );
  }
}
