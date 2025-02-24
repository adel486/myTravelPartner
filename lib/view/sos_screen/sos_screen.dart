import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: Colors.red,
          title: Text(
            "SoS",
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
                      backgroundColor: Colors.red,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(50),
                      elevation: 10,
                    ),
                    child: Text(
                      "SOS",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                  _quickActionButton(
                      Colors.blue, Icons.local_hospital, "Medical help"),
                  _quickActionButton(
                      Colors.indigo, Icons.local_police, "Poloice"),
                  _quickActionButton(
                      Colors.green, Icons.support_agent, "Assistance"),
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
      icon: Icon(Icons.call, color: Colors.white),
      label: Text("Call Emergency", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
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
        child: Icon(icon, size: 28, color: Colors.white),
      ),
      SizedBox(height: 8),
      Text(label, style: TextStyle(fontSize: 14)),
    ],
  );
}
