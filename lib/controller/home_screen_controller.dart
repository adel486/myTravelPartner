import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/dummyDb.dart';

class HomeScreenController with ChangeNotifier {
  // final String imageUrl;
  // final String tripName;
  // final String seats;
  // final String date;

  final Map<String, int> _joinedTrips = {};

  // void joinTrips(
  //     {required String imageUrl,
  //     required String tripName,
  //     required String seats,
  //     required String date}) {
  //   Dummydb.UpcomingTripList.add({
  //     "imageUrl": imageUrl,
  //     "tripName": tripName,
  //     "seats": seats,
  //     "date": date
  //   });
  //   notifyListeners();
  // }

  // void unJoinTrips(
  //     {required int index,
  //     required String imageUrl,
  //     required String tripName,
  //     required String seats,
  //     required String date}) {
  //       int index = Dummydb.UpcomingTripList.indexWhere((test) => test["tripName"] == tripName);

  //   Dummydb.UpcomingTripList.removeAt(index);

  //   notifyListeners();
  // }

  void toggleJoinTripIngroup({
    required String imageUrl,
    required String tripName,
    required String seats,
    required String date,
  }) {
    // Check if the trip already exists in the list
    int index = Dummydb.UpcomingTripList.indexWhere(
        (trep) => trep["tripName"] == tripName);

    if (index != -1) {
      // If trip exists, remove it (Unjoin)
      Dummydb.UpcomingTripList.removeAt(index);
    } else {
      // If trip doesn't exist, add it (Join)
      Dummydb.UpcomingTripList.add({
        "imageUrl": imageUrl,
        "tripName": tripName,
        "seats": seats,
        "date": date,
      });
    }

    notifyListeners(); // Notify UI to update
  }

  bool isTripJoined(String tripName) {
    return _joinedTrips.containsKey(tripName);
  }

  int getAvailableSeats(String tripName, int initialSeats) {
    return _joinedTrips[tripName] ?? initialSeats;
  }

  void toggleJoinTripInCard(
      {required String tripName, required int initialSeats}) {
    if (_joinedTrips.containsKey(tripName)) {
      _joinedTrips.remove(tripName); // Unjoin and restore seat
    } else {
      if (initialSeats > 0) {
        _joinedTrips[tripName] = initialSeats - 1; // Reduce available seats
      }
    }
    notifyListeners(); // Notify UI to update
  }
}
