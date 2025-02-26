import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/dummyDb.dart';
import 'package:my_travel_partner/view/widgets/upComingTripCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Map<String, String>> joinedTrips = [];
  // void joinTrips(Map<String, String> trip) {
  //   setState(() {
  //     if (joinedTrips.contains(trip)) {
  //       joinedTrips.add(trip);
  //     }
  //   });
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("Joined $trip['tripName']")));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel Slider
              AspectRatio(
                aspectRatio: 7 / 5,
                child: CarouselSlider(
                  items: List.generate(
                    Dummydb.carouselImages.length,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: Dummydb.carouselImages[index],
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => SizedBox(),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 250,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Upcoming Trips Title
              Text(
                "Upcoming trips",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // Upcoming Trips List
              ListView.separated(
                shrinkWrap: true, // Makes ListView take only needed space
                physics:
                    NeverScrollableScrollPhysics(), // Disables ListView's own scrolling
                itemBuilder: (context, index) => upComingTripCard(
                  tripName: Dummydb.tripDetails[index]['Trip name'],
                  seats: Dummydb.tripDetails[index]['seats'].toString(),
                  date: Dummydb.tripDetails[index]['date'],
                  imageUrl: Dummydb.tripDetails[index]['imageUrl'],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: Dummydb.carouselImages.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
