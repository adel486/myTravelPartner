import 'package:flutter/material.dart';
import 'package:my_travel_partner/model/login_res_model.dart';
import 'package:my_travel_partner/services/api_services.dart';
import 'package:my_travel_partner/services/userservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController with ChangeNotifier {
  ApiServices apiServices = ApiServices();
  UserService userService=UserService();
  Future<bool?> login({required String email, required String password}) async {
    LoginResModel? resModel = await apiServices.onLogin(email, password);
    notifyListeners();
    if (resModel != null) {
      await UserService.saveLoginResponse(resModel);
      return true;
  }
  return false;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access');
  }

  // To set email and save it in the shared prefrenece to visible the email in the profile screen.

  String _email = "";

  String get email => _email;

  Future<void> setEmail(String newEmail) async {
    _email = newEmail;
    notifyListeners(); // Notify UI about the change
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'user_email', newEmail); // Save email in SharedPreferences
  }

  Future<void> loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = prefs.getString('user_email') ??
        ""; // Load email from SharedPreferences
    notifyListeners();
  }
}
