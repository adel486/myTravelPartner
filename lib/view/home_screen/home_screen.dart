import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:my_travel_partner/services/api_environment.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/dummyDb.dart';
import 'package:my_travel_partner/view/home_screen/widgets/up_coming_trip_Card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await Provider.of<HomeScreenController>(context, listen: false)
          .getAllTrips();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainwhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryRed,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: ColorConstants.mainblack,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Carousel Slider
                  CarouselSlider(
                    items: List.generate(
                      Dummydb.carouselImages.length,
                      (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          imageUrl: Dummydb.carouselImages[index],
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => SizedBox(),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Upcoming Trips Title
                  Text(
                    "Upcoming trips",
                    style: TextStyle(
                      color: ColorConstants.mainblack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Upcoming Trips List
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 340, // Increased height for new text
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true, // Makes ListView take only needed space
                    physics:
                        NeverScrollableScrollPhysics(), // Disables ListView's own scrolling
                    itemBuilder: (context, index) {
                      return UpComingTripCard(
                          tripName:
                              value.allTrips![index].tripName ?? "No trip name",
                          seats: value.allTrips![index].groupSize.toString(),
                          fromDate: value.allTrips![index].fromDate.toString(),
                          toDate: value.allTrips![index].toDate.toString(),
                          imageUrl: value.allTrips![index].image != null
                              ? "${ApiEnvironment.dev.baseUrl}/${value.allTrips![index].image}"
                              : "https://images.pexels.com/photos/17795207/pexels-photo-17795207/free-photo-of-turtle-on-a-tropical-reef.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load");
                    },
                    itemCount: value.allTrips!.length,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
