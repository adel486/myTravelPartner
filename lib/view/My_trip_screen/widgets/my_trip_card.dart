import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';

class myTripCard extends StatelessWidget {
  const myTripCard({
    super.key,
    required this.placeName,
    required this.tripName,
    required this.date,
    required this.imageurl,
  });
  final String tripName;
  final String placeName;
  final String date;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.borderGrey),
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.mainwhite),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                imageUrl: imageurl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => SizedBox(),
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
                    style: TextStyle(
                        color: ColorConstants.mainblack, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "date : $date",
                    style: TextStyle(
                        color: ColorConstants.mainblack, fontSize: 18),
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
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.blue),
            child: Text(
              "Chat now",
              style: TextStyle(color: ColorConstants.mainblack, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
