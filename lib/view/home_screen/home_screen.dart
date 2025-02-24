import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_travel_partner/view/dummyDb.dart';
import 'package:my_travel_partner/view/widgets/upComingTripCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: 7 / 5,
                child: CarouselSlider(
                    items: List.generate(
                        Dummydb.carouselImages.length,
                        (index) => Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CachedNetworkImage(
                                  imageUrl: Dummydb.carouselImages[index],
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorListener: (value) {
                                    print("image loading failed");
                                    print(value);
                                  },
                                  errorWidget: (context, url, error) =>
                                      SizedBox(),
                                ),
                              ),
                            )),
                    options: CarouselOptions(
                        height: 200,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 7 / 2,
                        viewportFraction: 0.9)),
              ),
            ),
            Text(
              "Upcoming trips",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                    itemBuilder: (context, index) => upComingTripCard(
                          tripName: "Munnar",
                          seats: "5",
                          date: "15-10-2025",
                          imageUrl: Dummydb.carouselImages[index],
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemCount: Dummydb.carouselImages.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
