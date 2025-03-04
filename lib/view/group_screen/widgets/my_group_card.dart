import 'package:flutter/material.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';

class myGroupCard extends StatelessWidget {
  const myGroupCard({
    super.key,
    required this.imageUrl,
    required this.tripName,
    required this.date,
  });
  final String imageUrl;
  final String tripName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.borderGrey),
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.mainwhite),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    color: ColorConstants.mainwhite,
                    borderRadius: BorderRadius.circular(15)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          tripName,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.mainblack),
                        ),
                        SizedBox(width: 75),
                        Text(
                          date,
                          style: TextStyle(
                              color: ColorConstants.mainblack,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.primaryRed.withValues(alpha: 0.8)),
            child: Text(
              "Chat now",
              style: TextStyle(
                  color: ColorConstants.mainwhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
