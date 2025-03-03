import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _Controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _Controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        lowerBound: 0.8,
        upperBound: 1.2)
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_Controller);
    super.initState();
  }

  @override
  void dispose() {
    _Controller.dispose();
    super.dispose();
  }

  void _onSosPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("SOS Alert Sent! ")),
    );
    // Add actual emergency call or notification logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorConstants.primaryRed,
          title: Text(
            "SoS",
            style: GoogleFonts.roboto(
                color: ColorConstants.mainwhite,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: ElevatedButton(
                    onPressed: _onSosPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.primaryRed,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(50),
                      elevation: 10,
                    ),
                    child: Text(
                      "SOS",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.mainwhite),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              _emergencyContactButton(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _quickActionButton(ColorConstants.blue, Icons.local_hospital,
                      "Medical help"),
                  _quickActionButton(
                      ColorConstants.indigo, Icons.local_police, "Poloice"),
                  _quickActionButton(
                      ColorConstants.green, Icons.support_agent, "Assistance"),
                ],
              )
            ],
          ),
        ));
  }
}

Widget _emergencyContactButton() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.call, color: ColorConstants.mainwhite),
      label: Text("Call Emergency",
          style: TextStyle(color: ColorConstants.mainwhite)),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primaryRed,
        minimumSize: Size(double.infinity, 50),
      ),
    ),
  );
}

Widget _quickActionButton(Color color, IconData icon, String label) {
  return Column(
    children: [
      FloatingActionButton(
        backgroundColor: color,
        onPressed: () {}, // Implement corresponding action
        child: Icon(icon, size: 28, color: ColorConstants.mainwhite),
      ),
      SizedBox(height: 8),
      Text(label, style: TextStyle(fontSize: 14)),
    ],
  );
}
