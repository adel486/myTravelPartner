import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/plan_my_trip_screen/plan_my_trip_screen.dart';
import 'package:my_travel_partner/view/widgets/my_group_card.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key}); // Remove required keyword

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanMyTripScreen(),
                ));
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          title: Text("My groups"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 800,
                  child: ListView.separated(
                      itemBuilder: (context, index) => myGroupCard(),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                      itemCount: 10),
                )
              ],
            ),
          ),
        ));
  }
}
