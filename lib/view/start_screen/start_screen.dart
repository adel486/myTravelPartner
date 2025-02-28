import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:my_travel_partner/view/login_screen/login_screen.dart';
import 'package:my_travel_partner/view/sign_up_screen/sign_up_screen.dart';

import 'package:page_transition/page_transition.dart';

class Startscreen extends StatefulWidget {
  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
=======
import 'package:mytravellapp/screen/login_screen/login_screen.dart';
import 'package:mytravellapp/screen/signin_screen/signin_screen.dart';
import 'package:page_transition/page_transition.dart';

class Startscreen extends StatefulWidget {
  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen>
    {
>>>>>>> b01acdee33828a175146cc2249506f9b305fc6dc
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 100),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1738629532760-35a06d9fa9a3?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Text(
                'Start your Journey',
                style: GoogleFonts.raleway(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                'Login & Explore !',
                style: GoogleFonts.openSans(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 190),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
<<<<<<< HEAD
                          childBuilder: (context) => LoginScreen()));
=======
                          childBuilder: (context) => LoginPage()));
>>>>>>> b01acdee33828a175146cc2249506f9b305fc6dc
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
                ),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0.6),
                ),
              ),
              SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
<<<<<<< HEAD
                          childBuilder: (context) => SignUpScreen()));
=======
                          childBuilder: (context) => SigninPage()));
>>>>>>> b01acdee33828a175146cc2249506f9b305fc6dc
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                ),
                child: Text(
                  'SIGNUP',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
