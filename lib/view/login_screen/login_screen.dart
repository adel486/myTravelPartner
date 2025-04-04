import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_travel_partner/controller/login_screen_controller.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/Bottom_Nav_Screen/bottom_nav_screen.dart';
import 'package:my_travel_partner/view/sign_up_screen/sign_up_screen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _LoginCard(),
        ),
      ),
    );
  }
}

class _LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorConstants.mainblack.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: ColorConstants.primaryRed.withValues(alpha: 0.3)),
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.mainblack,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          ColorConstants.mainwhite.withValues(alpha: 0.3),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: ColorConstants.mainwhite),
                      prefixIcon:
                          Icon(Icons.email, color: ColorConstants.mainwhite),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          ColorConstants.mainwhite.withValues(alpha: 0.3),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color:
                              ColorConstants.mainwhite.withValues(alpha: 0.4)),
                      prefixIcon: Icon(Icons.lock,
                          color:
                              ColorConstants.mainwhite.withValues(alpha: 0.4)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 4) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to forgot password screen
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: ColorConstants.mainwhite),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        bool? s = await context
                            .read<LoginScreenController>()
                            .login(
                                email: emailController.text,
                                password: passwordController.text);
                        if (s == true) {
                          String email = emailController.text;
                          await context
                              .read<LoginScreenController>()
                              .setEmail(email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login successful"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavScreen(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login failed"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ColorConstants.mainwhite.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: ColorConstants.mainwhite),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                              thickness: 1,
                              endIndent: 1,
                              indent: 1,
                              color: ColorConstants.primaryRed
                                  .withValues(alpha: 0.5))),
                      Text(
                        'Or',
                        style: TextStyle(
                            color: ColorConstants.mainwhite, fontSize: 17),
                      ),
                      Expanded(
                          child: Divider(
                              thickness: 1,
                              endIndent: 1,
                              indent: 1,
                              color: ColorConstants.primaryRed
                                  .withValues(alpha: 0.5))),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'login with',
                    style: TextStyle(
                        color: ColorConstants.mainwhite, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        size: 30,
                        color: ColorConstants.mainwhite.withValues(alpha: 0.3),
                      )),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              childBuilder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(color: ColorConstants.mainwhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
