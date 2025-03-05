import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_travel_partner/model/login_res_model.dart';
import 'package:my_travel_partner/view/Bottom_Nav_Screen/bottom_nav_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController with ChangeNotifier {
  bool isLoading = false;
  login(String email, String password, BuildContext context) async {
    // Url setUp
    final url = Uri.parse('https://freeapi.luminartechnohub.com/login');
    isLoading = true;
    notifyListeners();

    try {
      // Making api call
      final response = await http.post(
        url,
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        // Convert data
        LoginResModel loginModel = loginResModelFromJson(response.body);

        // Token store
        if (loginModel.access != null && loginModel.access!.isNotEmpty) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access', loginModel.access.toString());
          await prefs.setString('refresh', loginModel.refresh.toString());
        }

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login failed")));
    }
    isLoading = false;
    notifyListeners();
  }
}
