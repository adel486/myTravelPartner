import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_travel_partner/services/api_services.dart';

class PlanMyTripScreenController with ChangeNotifier {
  ApiServices apiServices = ApiServices();

  Future<bool> uploadTrip({
    required String tripName,
    required String tripLocation,
    required String tripDescription,
    required String travelType,
    required String preferredGroupSize,
    required String budget,
    required String Fromdate,
    required String to_date,
    File? locationImage,
    required String accessToken,
  }) async {
    bool success = await apiServices.createTrip(
        tripName: tripName,
        tripLocation: tripLocation,
        tripDescription: tripDescription,
        travelType: travelType,
        preferredGroupSize: preferredGroupSize,
        budget: budget,
        fromDate: Fromdate,
        toDate: to_date,
        accessToken: accessToken,
        locationImage: locationImage);

    return success;
  }
// ========================================================================================================
//  Date time functionality

  // DateTime? _fromDate;
  // DateTime? _toDate;

  // DateTime? get fromDate => _fromDate;
  // DateTime? get toDate => _toDate;

  // void setFromDate(DateTime date) {
  //   _fromDate = date;
  //   notifyListeners();
  // }

  // void setToDate(DateTime date) {
  //   if (_fromDate != null && date.isBefore(_fromDate!)) {
  //     return; // Prevent setting To Date before From Date
  //   }
  //   _toDate = date;
  //   notifyListeners();
  // }
}
