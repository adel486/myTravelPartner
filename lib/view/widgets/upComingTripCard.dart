import 'package:flutter/material.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

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
    return Consumer<HomeScreenController>(
      builder: (context, homeProvider, child) {
        // check join state
        bool isJoined = homeProvider.isTripJoined(tripName);
        // check available seats
        int availableSeats =
            homeProvider.getAvailableSeats(tripName, int.parse(seats));
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              color: Color(0xFFFFFF),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageUrl))),
              ),
              Center(
                child: Text(
                  tripName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Seats : $availableSeats",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Date : $date",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Center(
                child: InkWell(
                  onTap: () {
                    homeProvider.toggleJoinTripInCard(
                        tripName: tripName, initialSeats: int.parse(seats));
                    homeProvider.toggleJoinTripIngroup(
                        imageUrl: imageUrl,
                        tripName: tripName,
                        seats: seats,
                        date: date);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: isJoined
                            ? Colors.greenAccent.shade200
                            : Colors.redAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      isJoined ? "joined" : "Join",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),

          // =========================================================================
          // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          // decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey.shade200),
          //     borderRadius: BorderRadius.circular(15),
          //     color: Colors.white),
          // child: Row(
          //   children: [
          //     Container(
          //       height: 90,
          //       width: 90,
          //       decoration: BoxDecoration(
          //           image: DecorationImage(
          //               image: NetworkImage(imageUrl), fit: BoxFit.cover),
          //           color: Colors.blue,
          //           borderRadius: BorderRadius.circular(15)),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             children: [
          //               Text(
          //                 tripName,
          //                 style: TextStyle(
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black),
          //               ),
          //               SizedBox(width: 75),
          //               Text(
          //                 date,
          //                 style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold),
          //               )
          //             ],
          //           ),
          //           SizedBox(height: 12),
          //           Row(
          //             children: [
          //               Text(
          //                 "seats : $availableSeats",
          //                 style: TextStyle(color: Colors.black, fontSize: 18),
          //               ),
          //               SizedBox(width: 80),
          //               InkWell(
          //                 onTap: () {
          //                   homeProvider.toggleJoinTripIngroup(
          //                       imageUrl: imageUrl,
          //                       tripName: tripName,
          //                       seats: seats,
          //                       date: date);

          //                   homeProvider.toggleJoinTripInCard(
          //                       tripName: tripName,
          //                       initialSeats: int.parse(seats));
          //                 },
          //                 child: Container(
          //                   alignment: Alignment.center,
          //                   height: 30,
          //                   width: 80,
          //                   decoration: BoxDecoration(
          //                       color: isJoined
          //                           ? Colors.greenAccent.shade200
          //                           : Colors.redAccent,
          //                       borderRadius: BorderRadius.circular(15)),
          //                   child: Text(
          //                     isJoined ? "joined" : "Join",
          //                     style:
          //                         TextStyle(color: Colors.black, fontSize: 18),
          //                   ),
          //                 ),
          //               )
          //             ],
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}
