import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_travel_partner/controller/sign_up_screen_controller.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/login_screen/login_screen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SigninCard(),
        ),
      ),
    );
  }
}

class SigninCard extends StatefulWidget {
  @override
  SigninCardState createState() => SigninCardState();
}

class SigninCardState extends State<SigninCard> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  // bool rememberMe = false;
  // bool isLoading = false;

  // void login() async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     // Simulate a network call
  //     await Future.delayed(Duration(seconds: 2));

  //     setState(() {
  //       isLoading = false;
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Login Successful!')),
  //     );
  //   }
  // }

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstants.mainwhite.withValues(alpha: 0.3),
                    hintText: 'Name',
                    hintStyle: TextStyle(color: ColorConstants.mainwhite),
                    prefixIcon:
                        Icon(Icons.person, color: ColorConstants.mainwhite),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstants.mainwhite.withValues(alpha: 0.3),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: ColorConstants.mainblack),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
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
                  controller: phoneController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstants.mainwhite.withValues(alpha: 0.3),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: ColorConstants.mainwhite),
                    prefixIcon: Icon(Icons.contacts_outlined,
                        color: ColorConstants.mainwhite),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
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
                    fillColor: ColorConstants.mainwhite.withValues(alpha: 0.3),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: ColorConstants.mainwhite),
                    prefixIcon:
                        Icon(Icons.lock, color: ColorConstants.mainwhite),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: cpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstants.mainwhite.withValues(alpha: 0.3),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: ColorConstants.mainwhite),
                    prefixIcon:
                        Icon(Icons.lock, color: ColorConstants.mainwhite),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (passwordController.text != value) {
                      return 'Must be same as password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      bool? status = await context
                          .read<SignUpScreenController>()
                          .register(
                              email: emailController.text,
                              name: nameController.text,
                              passWord: passwordController.text,
                              phone: phoneController.text);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      if (status == true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Registration Successfull",
                          ),
                          backgroundColor: Colors.green,
                        ));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Registration failed",
                          ),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  //     () async {
                  //   if (formKey.currentState!.validate()) {
                  //     try {
                  //       bool? status = await context
                  //           .read<SignUpScreenController>()
                  //           .register(
                  //             email: emailController.text.trim(),
                  //             name: nameController.text.trim(),
                  //             password: passwordController.text.trim(),
                  //             phone: phoneController.text.trim(),
                  //           );

                  //       ScaffoldMessenger.of(context).clearSnackBars();

                  //       if (status == true) {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text("Registration Successful"),
                  //             backgroundColor: Colors.green,
                  //           ),
                  //         );

                  //         Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LoginScreen(),
                  //           ),
                  //         );
                  //       } else {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text(
                  //                 "Registration failed. Please try again."),
                  //             backgroundColor: Colors.red,
                  //           ),
                  //         );
                  //       }
                  //     } catch (e) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text("An error occurred: ${e.toString()}"),
                  //           backgroundColor: Colors.red,
                  //         ),
                  //       );
                  //     }
                  //   }
                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ColorConstants.mainwhite.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(color: ColorConstants.mainwhite),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.roboto(
                          fontSize: 15, color: ColorConstants.mainwhite),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                childBuilder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: ColorConstants.mainwhite),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
