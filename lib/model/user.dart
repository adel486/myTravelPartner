
class User {
  String? status;
  String? msg;
  Data? data;
  Tokens? tokens;

  User({this.status, this.msg, this.data, this.tokens});

  User.fromJson(Map<String, dynamic> json) {
    if(json["Status"] is String) {
      status = json["Status"];
    }
    if(json["Msg"] is String) {
      msg = json["Msg"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["tokens"] is Map) {
      tokens = json["tokens"] == null ? null : Tokens.fromJson(json["tokens"]);
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map(User.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Status"] = status;
    _data["Msg"] = msg;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    if(tokens != null) {
      _data["tokens"] = tokens?.toJson();
    }
    return _data;
  }
}

class Tokens {
  String? access;
  String? refresh;

  Tokens({this.access, this.refresh});

  Tokens.fromJson(Map<String, dynamic> json) {
    if(json["access"] is String) {
      access = json["access"];
    }
    if(json["refresh"] is String) {
      refresh = json["refresh"];
    }
  }

  static List<Tokens> fromList(List<Map<String, dynamic>> list) {
    return list.map(Tokens.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access"] = access;
    _data["refresh"] = refresh;
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  int? phone;
  String? email;
  dynamic image;
  dynamic alternativePhone;
  dynamic travelType;
  dynamic language;
  dynamic idProof;
  dynamic budget;
  dynamic fromDate;
  dynamic toDate;
  dynamic groupSize;

  Data({this.id, this.name, this.phone, this.email, this.image, this.alternativePhone, this.travelType, this.language, this.idProof, this.budget, this.fromDate, this.toDate, this.groupSize});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is int) {
      phone = json["phone"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    image = json["image"];
    alternativePhone = json["alternative_phone"];
    travelType = json["travel_type"];
    language = json["language"];
    idProof = json["id_proof"];
    budget = json["budget"];
    fromDate = json["from_date"];
    toDate = json["to_date"];
    groupSize = json["group_size"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["email"] = email;
    _data["image"] = image;
    _data["alternative_phone"] = alternativePhone;
    _data["travel_type"] = travelType;
    _data["language"] = language;
    _data["id_proof"] = idProof;
    _data["budget"] = budget;
    _data["from_date"] = fromDate;
    _data["to_date"] = toDate;
    _data["group_size"] = groupSize;
    return _data;
  }
}