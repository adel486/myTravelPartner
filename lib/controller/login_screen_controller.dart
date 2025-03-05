import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_travel_partner/view/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController with ChangeNotifier {
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNzQyOTE2LCJpYXQiOjE3NDExNTA5MTYsImp0aSI6IjliNDdhOWE2YmQwMjQ0NzQ4NGY4ZWFkYjFjYTYzNjkxIiwidXNlcl9pZCI6MzUzLCJpZCI6MzUzLCJuYW1lIjoiQWRlbCBhYmR1bGxhIiwicGxhY2UiOiJUaHJpc3N1ciIsImVtYWlsIjoiYWRlbGFiZHVsbGFAZ21haWwuY29tIn0.M7tYP_wDXxmwzQ8-3CcHo-GoRyywKskKL0VE3AW6dAs";
  bool isLoading = false;
  login(String email, String password, BuildContext context) async {
    final url = Uri.parse('https://freeapi.luminartechnohub.com/login');
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(url,
          body: jsonEncode(
            {"email": email, "password": password},
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String token = data['access'];

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
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
