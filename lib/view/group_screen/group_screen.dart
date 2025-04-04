import 'package:flutter/material.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:my_travel_partner/view/dummyDb.dart';
import 'package:my_travel_partner/view/group_screen/widgets/my_group_card.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key}); // Remove required keyword

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My groups"),
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.separated(
                itemBuilder: (context, index) => MyGroupCard(
                      imageUrl: value.allTrips![index].image ?? "",
                      tripName: value.allTrips![index].tripName ?? "",
                      fromDate: value.allTrips![index].fromDate ?? "",
                      toDate: value.allTrips![index].toDate ?? "",
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                itemCount: Dummydb.UpcomingTripList.length),
          );
        },
      ),
    );
  }
}
