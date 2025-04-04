import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Trip details screen",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          fit: BoxFit.fill,
                          "https://images.pexels.com/photos/31250218/pexels-photo-31250218/free-photo-of-elegant-haussmannian-architecture-in-sunlight.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 15),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              SizedBox(height: 15),
              Divider(),
              Text("Remaining seats :          10")
            ],
          ),
        ),
      ),
    );
  }
}
