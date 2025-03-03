import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/My_trip_screen/my_trip_screen.dart';
import 'package:my_travel_partner/view/group_screen/group_screen.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/formFieldWidget.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/idProof.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/textWidget.dart';
import 'package:my_travel_partner/view/Global_Widgets/dropDownWidget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.acme(
                color: ColorConstants.mainwhite,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: .6,
                textStyle: Theme.of(context).textTheme.titleLarge)),
        backgroundColor: ColorConstants.primaryRed,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      ColorConstants.primaryRed.withValues(alpha: 0.4),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Textwidget(name: 'Name'),
              SizedBox(height: 5),
              Formfieldwidget(
                  textInputType: TextInputType.text, hintname: 'Name'),
              SizedBox(height: 10),
              Textwidget(name: 'Email'),
              SizedBox(height: 5),
              Formfieldwidget(
                  textInputType: TextInputType.emailAddress, hintname: 'Email'),
              SizedBox(height: 10),
              Textwidget(name: 'Phone Number'),
              SizedBox(height: 5),
              Formfieldwidget(
                  textInputType: TextInputType.phone, hintname: 'Phone Number'),
              SizedBox(height: 10),
              Textwidget(name: 'Alternative Phone Number'),
              SizedBox(height: 5),
              Formfieldwidget(
                  textInputType: TextInputType.phone, hintname: 'Phone Number'),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(name: 'My Budget'),
                        SizedBox(height: 5),
                        Formfieldwidget(
                            textInputType: TextInputType.number,
                            hintname: 'In Rupees')
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(name: 'Preferred group size'),
                        SizedBox(height: 5),
                        Formfieldwidget(
                            textInputType: TextInputType.number,
                            hintname: 'Group size')
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(name: 'Travel type'),
                        SizedBox(height: 5),
                        DropdownWidget(
                          items: ['Car', 'Bike', 'AirBus', 'Train', 'Airways'],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(name: 'Language'),
                        SizedBox(height: 5),
                        DropdownWidget(
                          items: [
                            'English',
                            'Malayalam',
                            'Tamil',
                            'Kannada',
                            'Telugu',
                            'Others'
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textwidget(name: 'Available date'),
                    SizedBox(height: 5),
                    Formfieldwidget(
                        textInputType: TextInputType.datetime, hintname: 'Date')
                  ],
                ),
              ),
              SizedBox(height: 10),
              Textwidget(name: 'ID Proof'),
              SizedBox(height: 5),
              IdProofUpload(),
              SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryRed,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('Update',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: ColorConstants.mainwhite,
                          textStyle: Theme.of(context).textTheme.labelSmall)),
                ),
              ),
              Divider(height: 40),
              Text('Uploaded Travel Plans',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              buildCard('My Trips', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyTripScreen(),
                    ));
              }),
              buildCard('My groups', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupScreen(),
                    ));
              }),
              buildCard('Safety', () {
                // Navigate to safty screen
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, VoidCallback ontap) {
    return Card(
      elevation: 4,
      color: ColorConstants.mainwhite,
      child: ListTile(
        title: Text(title,
            style: GoogleFonts.roboto(fontSize: 16, color: Colors.black)),
        onTap: ontap,
      ),
    );
  }
}
