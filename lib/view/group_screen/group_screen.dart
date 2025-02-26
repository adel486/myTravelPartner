import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/dummyDb.dart';
import 'package:my_travel_partner/view/widgets/upComingTripCard.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key}); // Remove required keyword

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My groups"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // ignore: unnecessary_null_comparison
        child: ListView.separated(
            itemBuilder: (context, index) => upComingTripCard(
                imageUrl: Dummydb.UpcomingTripList[index]['imageUrl'],
                tripName: Dummydb.UpcomingTripList[index]['tripName'],
                seats: Dummydb.UpcomingTripList[index]['seats'],
                date: Dummydb.UpcomingTripList[index]['date']),
            separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
            itemCount: Dummydb.UpcomingTripList.length),
      ),
    );
  }
}
