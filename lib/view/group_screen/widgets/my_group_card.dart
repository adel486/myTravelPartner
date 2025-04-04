import 'package:flutter/material.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';

class MyGroupCard extends StatelessWidget {
  const MyGroupCard({
    super.key,
    required this.imageUrl,
    required this.tripName,
    required this.fromDate,
    required this.toDate,
  });

  final String imageUrl;
  final String tripName;
  final String fromDate;
  final String toDate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.borderGrey),
            borderRadius: BorderRadius.circular(15),
            color: ColorConstants.mainwhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      height: constraints.maxWidth * 0.25,
                      width: constraints.maxWidth * 0.25,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 50),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tripName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.mainblack,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 5,
                          children: [
                            Text(
                              "From: $fromDate",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorConstants.mainblack,
                              ),
                            ),
                            Text(
                              "To: $toDate",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorConstants.mainblack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Chat now",
                    style: TextStyle(
                      color: ColorConstants.mainwhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}