import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.tripName, 
      this.location, 
      this.description, 
      this.travelType, 
      this.groupSize, 
      this.budget, 
      this.fromDate, 
      this.toDate, 
      this.image, 
      this.user,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    tripName = json['trip_name'];
    location = json['location'];
    description = json['description'];
    travelType = json['travel_type'];
    groupSize = json['group_size'];
    budget = json['budget'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    image = json['image'];
    user = json['user'];
  }
  num? id;
  String? tripName;
  String? location;
  String? description;
  String? travelType;
  num? groupSize;
  num? budget;
  String? fromDate;
  String? toDate;
  String? image;
  num? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_name'] = tripName;
    map['location'] = location;
    map['description'] = description;
    map['travel_type'] = travelType;
    map['group_size'] = groupSize;
    map['budget'] = budget;
    map['from_date'] = fromDate;
    map['to_date'] = toDate;
    map['image'] = image;
    map['user'] = user;
    return map;
  }

}