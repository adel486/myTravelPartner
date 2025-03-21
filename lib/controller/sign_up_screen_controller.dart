import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_travel_partner/services/api_services.dart';

class SignUpScreenController with ChangeNotifier {
  ApiServices apiServices = ApiServices();
  Future<bool?> register(
      {required String name,
      required String phone,
      required String email,
      required String passWord}) async {
    bool? s = await apiServices.onRegister(name, phone, email, passWord);
    notifyListeners();
    if (s == true) {
      return true;
    } else {
      return false;
    }
  }
}
