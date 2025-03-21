import 'dart:convert';
import 'dart:io';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:my_travel_partner/model/login_res_model.dart';
import 'package:my_travel_partner/model/mytrip_res_model.dart';
import 'package:my_travel_partner/model/mytrips/Data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static const String baseUrl = "http://192.168.1.40:8000";
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access');
  }

// =============================================================================================================
// Registartion(POST)
  Future<bool?> onRegister(
      String name, String phone, String email, String password) async {
    final url = Uri.parse("$baseUrl/registration/");
    var headers = {
      "accept": "application/json",
      "Content-Type": "application/json"
    };
    var body = jsonEncode({
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    });
    print("headers:$headers:::body::$body,url::$url");
    try {
      SmartDialog.showLoading();
      final response = await http.post(url, headers: headers, body: body);
      SmartDialog.dismiss();
      print(response.body);
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      SmartDialog.dismiss();
      print(e.toString());
      return false;
    }
  }
// =========================================================================================================

  // Login Functionality(POST)

  Future<bool?> onLogin(String email, String password) async {
    final url = Uri.parse("$baseUrl/login/");
    var headers = {
      "accept": "application/json",
      "Content-Type": "application/json"
    };
    var body = jsonEncode({
      "email": email,
      "password": password,
    });
    print("headers:$headers:::body::$body,url::$url");
    try {
      SmartDialog.showLoading();
      final response = await http.post(url, headers: headers, body: body);
      SmartDialog.dismiss();
      if (response.statusCode == 200) {
        print(response.body);
        LoginResModel loginModel = loginResModelFromJson(response.body);

        if (loginModel.access != null && loginModel.access!.isNotEmpty) {
          String accessToken = loginModel.access.toString();
          String refreshToken = loginModel.refresh.toString();

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access', accessToken);
          await prefs.setString('refresh', refreshToken);

          return true;
        }
      } else {
        print("Login failed: ${response.body}");
        return false;
      }
    } catch (e) {
      print(e.toString());
      SmartDialog.dismiss();
      return false;
    }
    return false;
  }
// ================================================================================================================

  // Plan my trip(Multi part POST)

  Future<bool> createTrip({
    required String tripName,
    required String tripLocation,
    required String tripDescription,
    required String travelType,
    required String preferredGroupSize,
    required String budget,
    required String fromDate, // Changed from "Fromdate" for consistent naming
    required String toDate, // Changed from "to_date" for consistent naming
    File? locationImage,
    required String accessToken,
  }) async {
    print("Initiating Create Trip multipart request...");

    var headers = {
      "accept": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    try {
      var uri = Uri.parse("$baseUrl/trip-create/");

      // Show loading indicator
      SmartDialog.showLoading(msg: "Creating trip...");

      var request = http.MultipartRequest("POST", uri)..headers.addAll(headers);

      // Add form fields
      request.fields['trip_name'] = tripName;
      request.fields['location'] = tripLocation;
      request.fields['description'] = tripDescription;
      request.fields['travel_type'] = travelType;
      request.fields['group_size'] = preferredGroupSize;
      request.fields['budget'] = budget;
      request.fields['from_date'] = fromDate;
      request.fields['to_date'] = toDate;

      // Attach image if available
      if (locationImage != null) {
        final mimeType = lookupMimeType(locationImage.path) ?? 'image/jpeg';
        print("📷 Attaching image of type: $mimeType");

        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            locationImage.path,
            contentType: MediaType.parse(mimeType),
          ),
        );
      }

      print("Sending request with fields: ${request.fields}");

      // Send request and await response
      final streamedResponse = await request.send();
      final responseBody = await streamedResponse.stream.bytesToString();

      // Always dismiss loading dialog, regardless of outcome
      SmartDialog.dismiss();

      if (streamedResponse.statusCode >= 200 &&
          streamedResponse.statusCode < 300) {
        print("Trip created successfully: $responseBody");
        return true;
      } else {
        print(
            "Failed to create trip. Status: ${streamedResponse.statusCode}, Response: $responseBody");
        return false;
      }
    } catch (e, stackTrace) {
      print("Error creating trip: $e");
      print("Stack trace: $stackTrace");
      SmartDialog.dismiss();
      return false;
    }
  }
  // =====================================================================================================

  // To List myTrip in my trip screen (Get)
  Future<List<Data>?> fetchTrips() async {
    final url = Uri.parse("$baseUrl/my-trips/");
    String? accessToken = await getToken();

    if (accessToken == null || accessToken.isEmpty) {
      throw Exception("User is not authenticated. Access token is missing.");
    }

    var headers = {
      "accept": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    try {
      print("Fetching trips from: $url");
      final response = await http.get(url, headers: headers);

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonData = json.decode(response.body);
        var res=MytripsResModelDart.fromJson(jsonData);
        var list=res.data;
        return list;

       
        } else {
          throw Exception(
              "Invalid response format: 'data' key missing or null");
        }
      
    } catch (e) {
      print("Error fetching trips: $e");
      throw Exception("Error fetching trips: $e");
    }
  }
}
