import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_travel_partner/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenController with ChangeNotifier {
  ApiServices apiServices = ApiServices();

  Future<bool> UploadProfile({
    required String name,
    required String phone,
    required String email,
    required String alternativePhone,
    File? image,
    required String travelType,
    required String language,
    File? idProof,
    required String budget,
    required String groupSize,
    required String fromDate,
    required String toDate,
    required String accessToken,
  }) async {
    bool success = await apiServices.postProfileDetails(
        name: name,
        phone: phone,
        email: email,
        alternativePhone: alternativePhone,
        travelType: travelType,
        language: language,
        budget: budget,
        groupSize: groupSize,
        fromDate: fromDate,
        toDate: toDate,
        accessToken: accessToken);
    return success;
  }

// =======================================================================================================
// Functionality to dsiplay the login details in the profile screen
  String name = "";
  String email = "";
  String phone = "";

  ProfileProvider() {
    loadProfileData(); // Load profile data when Provider initializes
  }

  // ✅ Load profile data from SharedPreferences
  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('username') ?? "No Name";
    email = prefs.getString('email') ?? "No Email";
    phone = prefs.getString('phone_number').toString() ?? "No Phone";

    print("Loaded -> Name: $name, Email: $email, Phone: $phone");
    notifyListeners();
  }
}
