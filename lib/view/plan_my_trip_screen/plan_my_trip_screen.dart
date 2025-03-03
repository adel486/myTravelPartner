import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_partner/controller/my_trip_screen_controller.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:provider/provider.dart';

class PlanMyTripScreen extends StatefulWidget {
  const PlanMyTripScreen({super.key});

  @override
  State<PlanMyTripScreen> createState() => _PlanMyTripScreenState();
}

class _PlanMyTripScreenState extends State<PlanMyTripScreen> {
  final List<String> travelTypes = ["Bike", "Car", "Bus", "Train"];
  String? selectedValue;
  DateTime selectedDate = DateTime.now();
  XFile? selectedImage;

  // Controllers
  final TextEditingController tripNameController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController groupSizeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = image;
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
          child: Column(
            children: [
              _buildTextField(tripNameController, "Enter trip name"),
              _buildTextField(placeNameController, "Enter location"),
              _buildTextField(desController, "Trip description", maxLines: 6),
              _buildDropdown(),
              _buildTextField(groupSizeController, "Preferred group size",
                  keyboardType: TextInputType.number),
              _buildTextField(budgetController, "Enter your budget",
                  keyboardType: TextInputType.number),
              _buildDateField(),
              _buildImagePicker(),
              const SizedBox(height: 20),
              _buildSubmitButton(),
            ],
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
          //Do something when selected item is changed.
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

  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: dateController,
        readOnly: true,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_month),
          hintText: "Select Date",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorConstants.primaryRed.withValues(alpha: 0.2),
          ),
          child: Center(
            child: selectedImage != null
                ? Image.file(File(selectedImage!.path),
                    height: 100, fit: BoxFit.cover)
                : Icon(Icons.image, size: 50, color: ColorConstants.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    final tripProvider =
        Provider.of<MyTripScreenController>(context, listen: false);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primaryRed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        tripProvider.addMyTrip(placeNameController.text,
            tripNameController.text, dateController.text);
        Navigator.pop(context);
      },
      child: Text("Submit",
          style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainblack)),
    );
  }
}
