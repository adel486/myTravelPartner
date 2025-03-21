import 'package:flutter/material.dart';
import 'package:my_travel_partner/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController with ChangeNotifier {
  ApiServices apiServices = ApiServices();
  Future<bool?> login({required String email, required String password}) async {
    bool? status = await apiServices.onLogin(email, password);
    notifyListeners();
    if (status == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access');
  }
}
