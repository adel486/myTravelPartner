// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

class LoginResModel {
  String? refresh;
  String? access;
  int? id;
  String? name;
  String? place;
  String? email;

  LoginResModel({
    this.refresh,
    this.access,
    this.id,
    this.name,
    this.place,
    this.email,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        name: json["name"],
        place: json["place"],
        email: json["email"],
      );
}
