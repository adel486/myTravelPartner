import 'package:flutter/material.dart';

class myTripCard extends StatelessWidget {
  const myTripCard({
    super.key,
    required this.placeName,
    required this.tripName,
    required this.date,
  });
  final String tripName;
  final String placeName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffffffff)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=600")),
                    color: Colors.amber),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tripName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Place : $placeName",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "date : $date",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.blue),
            child: Text(
              "Chat now",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
