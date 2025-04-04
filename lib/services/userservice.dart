import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/login_res_model.dart';
  // Assuming your LoginResModel is in this file

class UserService {
  // Save the login response model (after a successful login)
  static Future<void> saveLoginResponse(LoginResModel loginResModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Converting LoginResModel to a JSON string to store in SharedPreferences
    String loginResJson = json.encode({
      'refresh': loginResModel.refresh,
      'access': loginResModel.access,
      'id': loginResModel.id,
      'name': loginResModel.name,
      'place': loginResModel.place,
      'email': loginResModel.email,
    });

    // Save the JSON string into SharedPreferences
    await prefs.setString('login_res', loginResJson);
  }

  // Retrieve the login response model from SharedPreferences
  static Future<LoginResModel?> getLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the login response is stored
    String? loginResJson = prefs.getString('login_res');

    // If not found, return null
    if (loginResJson == null) {
      return null;
    }

    // Parse the JSON string and return the LoginResModel
    Map<String, dynamic> jsonMap = json.decode(loginResJson);
    return LoginResModel.fromJson(jsonMap);
  }

  // Clear the login data from SharedPreferences (for logout)
  static Future<void> clearLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_res');
  }

  // Check if the user is logged in (by checking if login response exists)
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('login_res');
  }
}
