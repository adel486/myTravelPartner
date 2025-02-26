import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/dummyDb.dart';

class upComingTripCard extends StatelessWidget {
  const upComingTripCard({
    super.key,
    required this.imageUrl,
    required this.tripName,
    required this.seats,
    required this.date,
  });
  final String imageUrl;
  final String tripName;
  final String seats;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      tripName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(width: 75),
                    Text(
                      date,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "seats : $seats",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(width: 80),
                    InkWell(
                      onTap: () {
                        Dummydb.UpcomingTripList.add({
                          "imageUrl": "$imageUrl",
                          "tripName": "$tripName",
                          "date": "$date",
                          "seats": "$seats"
                        });

                        print("list Added");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Join",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
