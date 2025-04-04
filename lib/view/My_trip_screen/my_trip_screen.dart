import 'package:flutter/material.dart';
import 'package:my_travel_partner/controller/my_trip_screen_controller.dart';
import 'package:my_travel_partner/services/api_environment.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/My_trip_screen/widgets/my_trip_card.dart';
import 'package:my_travel_partner/view/plan_my_trip_screen/plan_my_trip_screen.dart';

import 'package:provider/provider.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  void initState() {
    super.initState();
    // Fetch trips when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await Provider.of<MyTripScreenController>(context, listen: false)
          .getMyTrip();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlanMyTripScreen()));
          }),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My trip screen",
          style: TextStyle(
              color: ColorConstants.mainblack,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: Consumer<MyTripScreenController>(builder: (context, value, child) {
        if (value.trips == null) {
          return Center(child: Text("No trips available."));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
              itemBuilder: (context, index) {
                print("Image URL: ${value.trips![index].image}");
                return myTripCard(
                  imageurl: value.trips![index].image != null
                      ? "${ApiEnvironment.dev.baseUrl}/${value.trips![index].image}"
                      : "https://images.pexels.com/photos/30953505/pexels-photo-30953505/free-photo-of-charming-street-scene-in-tokyo-s-urban-area.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                  tripName: value.trips![index].tripName ?? " NO trip name",
                  placeName: value.trips![index].location ?? "No location",
                  date: value.trips![index].fromDate?.toString() ?? "No date",
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
              itemCount: value.trips!.length),
        );
      }),
    );
  }
}
