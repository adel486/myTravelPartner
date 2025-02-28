import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/formFieldWidget.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/idProof.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/textWidget.dart';
import 'package:my_travel_partner/view/Global_Widgets/dropDownWidget.dart';

class Profile2 extends StatelessWidget {
  Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.acme(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: .6,
                textStyle: Theme.of(context).textTheme.titleLarge)),
        backgroundColor: Colors.red,
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
                  backgroundColor: Colors.red.shade400,
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
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('Update',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.white,
                          textStyle: Theme.of(context).textTheme.labelSmall)),
                ),
              ),
              Divider(height: 40),
              Text('Uploaded Travel Plans',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              buildCard('My Trips'),
              buildCard('My groups'),
              buildCard('Safety')
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title) {
    return Card(
      elevation: 4,
      color: Colors.red[50],
      child: ListTile(
        title: Text(title,
            style: GoogleFonts.roboto(fontSize: 16, color: Colors.black)),
        onTap: () {},
      ),
    );
  }
}
