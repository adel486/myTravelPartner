import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:my_travel_partner/model/mytrips/Data.dart';
import 'package:my_travel_partner/services/api_services.dart';

class MyTripScreenController with ChangeNotifier {
  // void addMyTrip(String placeName, String tripName, String date) {
  //   Dummydb.groupList
  //       .add({"placeName": placeName, "tripName": tripName, "date": date});
  //   notifyListeners();
  // }

  // Fetch trips from API
  List<Data>? trips = []; // Initialize as empty list
  

  final ApiServices apiService = ApiServices();

  Future<void> getTrips() async {
    SmartDialog.showLoading();
    try {
      trips = await apiService.fetchTrips();
      notifyListeners(); // Notify UI to rebuild
    } catch (e) {
      print("Error fetching trips: $e");
    } finally {
      SmartDialog.dismiss();
      notifyListeners();
    }
  }
}
