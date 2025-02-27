import 'package:flutter/widgets.dart';
import 'package:my_travel_partner/view/dummyDb.dart';

class MyTripScreenController with ChangeNotifier {
  void addMyTrip(String placeName, String tripName, String date) {
    Dummydb.groupList
        .add({"placeName": placeName, "tripName": tripName, "date": date});
    notifyListeners();
  }
}
