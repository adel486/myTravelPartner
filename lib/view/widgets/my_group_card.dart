import 'package:flutter/material.dart';

class myGroupCard extends StatelessWidget {
  const myGroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/709552/pexels-photo-709552.jpeg?auto=compress&cs=tinysrgb&w=600",
                      )),
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Place :",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(width: 65),
                  Text(
                    "Date :",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Text(
                "People :",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    "slots :",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red),
                    child: Text(
                      "Chat Now",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
