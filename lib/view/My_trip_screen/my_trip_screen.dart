import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/dummyDb.dart';
import 'package:my_travel_partner/view/plan_my_trip_screen/plan_my_trip_screen.dart';
import 'package:my_travel_partner/view/widgets/my_group_card.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

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
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
            itemBuilder: (context, index) => myGroupCard(
                  tripName: Dummydb.groupList[index]["tripName"],
                  placeName: Dummydb.groupList[index]["placeName"],
                  date: Dummydb.groupList[index]["date"],
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
            itemCount: Dummydb.groupList.length),
      ),
    );
  }
}
