import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_travel_partner/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

class UpComingTripCard extends StatelessWidget {
  const UpComingTripCard({
    super.key,
    required this.imageUrl,
    required this.tripName,
    required this.seats,
    required this.fromDate,
    required this.toDate,
  });

  final String imageUrl;
  final String tripName;
  final String seats;
  final String fromDate;
  final String toDate; 

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(
      builder: (context, homeProvider, child) {
        bool isJoined = homeProvider.isTripJoined(tripName);
        int availableSeats =
            homeProvider.getAvailableSeats(tripName, int.parse(seats));

        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: 
         
                CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          imageUrl: imageUrl,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => SizedBox(),
                        ),
              ),

              const SizedBox(height: 8),

              // Trip Name
              Center(
                child: Text(
                  tripName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 5),

              // Seats & Dates
              Text(
                "Seats: $availableSeats",
                style: const TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "From: $fromDate",
                style: const TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "To: $toDate",
                style: const TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 10),

              // Join Button
              Center(
                child: InkWell(
                  onTap: () {
                    homeProvider.toggleJoinTripInCard(
                      tripName: tripName,
                      initialSeats: int.parse(seats),
                    );
                    homeProvider.toggleJoinTripIngroup(
                      imageUrl: imageUrl,
                      tripName: tripName,
                      seats: seats,
                      fromDate: fromDate,
                      toDate: toDate,
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isJoined
                          ? Colors.greenAccent.shade200
                          : Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isJoined ? "Joined" : "Join",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
