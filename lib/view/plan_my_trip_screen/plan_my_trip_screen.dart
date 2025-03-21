import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_travel_partner/controller/login_screen_controller.dart';
import 'package:my_travel_partner/controller/plan_my_trip_screen_controller.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/Bottom_Nav_Screen/bottom_nav_screen.dart';
import 'package:provider/provider.dart';

class PlanMyTripScreen extends StatefulWidget {
  const PlanMyTripScreen({super.key});

  @override
  State<PlanMyTripScreen> createState() => _PlanMyTripScreenState();
}

class _PlanMyTripScreenState extends State<PlanMyTripScreen> {
  final List<String> travelTypes = ["Bike", "Car", "Bus", "Train"];
  String? selectedTravelType;
  String? selectedValue;
  DateTime selectedDate = DateTime.now();
  File? selectedImage;

  // Controllers
  final TextEditingController tripNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController groupSizeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController FromdateController = TextEditingController();
  final TextEditingController to_dateController = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd')
            .format(pickedDate); // Ensuring correct format
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorConstants.primaryRed,
          title: Text(
            "Plan My Trip",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: ColorConstants.mainblack,
                fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SingleChildScrollView(
          child: Consumer<PlanMyTripScreenController>(
            builder: (context, value, child) {
              return Column(
                children: [
                  _buildTextField(tripNameController, "Enter trip name"),
                  _buildTextField(locationController, "Enter location"),
                  _buildTextField(desController, "Trip description",
                      maxLines: 6),
                  _buildDropdown(),
                  _buildTextField(groupSizeController, "Preferred group size",
                      keyboardType: TextInputType.number),
                  _buildTextField(budgetController, "Enter your budget",
                      keyboardType: TextInputType.number),
                  _buildDateField("Select From Date", FromdateController, true),
                  _buildDateField("Select To Date", to_dateController, false),
                  _buildImagePicker(),
                  const SizedBox(height: 20),
                  _buildSubmitButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField2<String>(
        value: selectedTravelType,
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Add more decoration..
        ),
        hint: const Text(
          'Select travel type',
          style: TextStyle(fontSize: 14),
        ),
        items: travelTypes
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'select prefered travel type';
          }
          return null;
        },
        onChanged: (value) {
          print("selected:::::::::::::::::::$value");
          setState(() {
            selectedTravelType = value;
          });
          print(selectedTravelType);
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: ColorConstants.mainblack,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildDateField(
      String hint, TextEditingController controller, bool isFromDate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.calendar_month),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onTap: () => _selectDate(context, controller),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorConstants.primaryRed.withValues(alpha: 0.2),
          ),
          child: Center(
            child: selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(File(selectedImage!.path),
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.fitWidth),
                  )
                : Icon(Icons.image, size: 50, color: ColorConstants.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primaryRed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () async {
        String? accessToken =
            await context.read<LoginScreenController>().getToken();

        print({
          "tripName": tripNameController.text,
          "tripLocation": locationController.text,
          "tripDescription": desController.text,
          "travelType": selectedTravelType ?? "Bus",
          "preferredGroupSize": groupSizeController.text,
          "budget": budgetController.text,
          "fromDate": FromdateController.text,
          "toDate": to_dateController.text,
          "accessToken": accessToken,
          "image": selectedImage
        });
        print("Uploading image: ${selectedImage?.path}");

        // Handle the case where accessToken is null
        if (accessToken == null || accessToken.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Authentication Error! Please log in again.")),
          );
          return;
        }

        bool success = await context
            .read<PlanMyTripScreenController>()
            .uploadTrip(
                tripName: tripNameController.text,
                tripLocation: locationController.text,
                tripDescription: desController.text,
                travelType:
                    selectedTravelType ?? 'Unknown', // Prevent null error
                preferredGroupSize: groupSizeController.text,
                budget: budgetController.text,
                Fromdate: FromdateController.text,
                to_date: to_dateController.text,
                accessToken: accessToken,
                locationImage:
                    File(selectedImage!.path) // No more force unwrapping
                );

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Trip uploaded successfully")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to upload trip!")),
          );
        }
      },
      child: Text("Submit",
          style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainblack)),
    );
  }
}
