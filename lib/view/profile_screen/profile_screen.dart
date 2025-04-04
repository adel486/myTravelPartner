import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_travel_partner/controller/login_screen_controller.dart';
import 'package:my_travel_partner/controller/profile_screen_controller.dart';
import 'package:my_travel_partner/model/login_res_model.dart';
import 'package:my_travel_partner/services/userservice.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';
import 'package:my_travel_partner/view/Bottom_Nav_Screen/bottom_nav_screen.dart';
import 'package:my_travel_partner/view/My_trip_screen/my_trip_screen.dart';
import 'package:my_travel_partner/view/group_screen/group_screen.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/formFieldWidget.dart';
import 'package:my_travel_partner/view/profile_screen/widgets/textWidget.dart';
import 'package:my_travel_partner/view/Global_Widgets/dropDownWidget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LoginResModel? user;
  String name="";

  List<String> languageList = [
    "English",
    "Spanish",
    "French",
    "German",
    "Italian",
    "Chinese",
    "Japanese",
    "Hindi",
    "Arabic",
    "Russian",
  ];
  String? selectedLanguage;

  File? selectedProfileImage;
  File? selectedIdProofImage;
  String? selectedTravelType;
  Future<void> _pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedProfileImage = File(image.path);
      });
    }
  }

  Future<void> _pickIdProofImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedIdProofImage = File(image.path);
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController alternatePhoneNumberController =
      TextEditingController();
  final TextEditingController mybudgetController = TextEditingController();
  final TextEditingController prefferedGroupSizeController =
      TextEditingController();
  final TextEditingController languageDropDownController =
      TextEditingController();
  final TextEditingController ToDateController = TextEditingController();
  final TextEditingController FromDateController = TextEditingController();
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final profileProvider =
          Provider.of<ProfileScreenController>(context, listen: false);
      profileProvider.loadProfileData().then((_) {
        setState(() {
          nameController.text = profileProvider.name;
          emailController.text = profileProvider.email;
          phoneNumberController.text = profileProvider.phone;
        });
      });
      _isInit = false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    alternatePhoneNumberController.dispose();
    mybudgetController.dispose();
    prefferedGroupSizeController.dispose();
    languageDropDownController.dispose();
    ToDateController.dispose();
    FromDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateuser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileScreenController>(
      builder: (context, value, child) {
       
        return Scaffold(
          backgroundColor: ColorConstants.mainwhite,
          appBar: AppBar(
            title: Text('hai ${name}',
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
                    child: InkWell(
                      onTap: _pickProfileImage,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor:
                            ColorConstants.primaryRed.withValues(alpha: 0.4),
                        backgroundImage: selectedProfileImage != null
                            ? FileImage(selectedProfileImage!)
                            : null,
                        child: selectedProfileImage == null
                            ? Icon(Icons.person, size: 50, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Textwidget(name: 'Name'),
                  SizedBox(height: 5),
                  Formfieldwidget(
                    textInputType: TextInputType.text,
                    hintname: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(height: 10),
                  Textwidget(name: 'Email'),
                  SizedBox(height: 5),
                  Formfieldwidget(
                    textInputType: TextInputType.emailAddress,
                    hintname: 'Email',
                    controller: emailController,
                    isEmailField: true,
                  ),
                  SizedBox(height: 10),
                  Textwidget(name: 'Phone Number'),
                  SizedBox(height: 5),
                  Formfieldwidget(
                    textInputType: TextInputType.phone,
                    hintname: 'Phone Number',
                    controller: phoneNumberController,
                  ),
                  SizedBox(height: 10),
                  Textwidget(name: 'Alternative Phone Number'),
                  SizedBox(height: 5),
                  Formfieldwidget(
                    textInputType: TextInputType.phone,
                    hintname: 'Phone Number',
                    controller: alternatePhoneNumberController,
                  ),
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
                              hintname: 'In Rupees',
                              controller: mybudgetController,
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textwidget(name: 'Preferred group size'),
                            SizedBox(height: 5),
                            Formfieldwidget(
                              textInputType: TextInputType.number,
                              hintname: 'Group size',
                              controller: prefferedGroupSizeController,
                            )
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
                              items: [
                                'Car',
                                'Bike',
                                'AirBus',
                                'Train',
                                'Airways'
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textwidget(name: 'Language'),
                            SizedBox(height: 5),
                            // here onwards the dropdown fro the language starts
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color:
                                    ColorConstants.grey.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Language',
                                    style: GoogleFonts.b612Mono(
                                      fontSize: 14,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: languageList
                                      .map((lang) => DropdownMenuItem(
                                            value: lang,
                                            child: Text(
                                              lang,
                                              style: GoogleFonts.roboto(
                                                fontSize: 17,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLanguage = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 40,
                                    width: 175,
                                  ),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 200,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController:
                                        languageDropDownController,
                                    searchInnerWidgetHeight: 50,
                                    searchInnerWidget: Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        expands: true,
                                        maxLines: null,
                                        controller: languageDropDownController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          hintText: 'Search here...',
                                          hintStyle: GoogleFonts.cabinCondensed(
                                            fontSize: 15,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    searchMatchFn: (item, searchValue) {
                                      return item.value
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchValue.toLowerCase());
                                    },
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      languageDropDownController.clear();
                                    }
                                  },
                                ),
                              ),
                            ),

                            // Dropdown for language ends
                            // DropdownWidget(
                            //   items: [
                            //     'English',
                            //     'Malayalam',
                            //     'Tamil',
                            //     'Kannada',
                            //     'Telugu',
                            //     'Others'
                            //   ],
                            // ),
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
                        // from date
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: FromDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month),
                              hintText: "Enter From Date",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            onTap: () =>
                                _selectDate(context, FromDateController),
                          ),
                        ),
                        SizedBox(height: 5),
                        // To date
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: ToDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month),
                              hintText: "Enter To Date",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            onTap: () => _selectDate(context, ToDateController),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Textwidget(name: 'ID Proof'),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: _pickIdProofImage,
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              ColorConstants.primaryRed.withValues(alpha: 0.2),
                        ),
                        child: Center(
                          child: selectedIdProofImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                      File(selectedIdProofImage!.path),
                                      height: 160,
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth),
                                )
                              : Icon(Icons.image,
                                  size: 50, color: ColorConstants.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        String? accessToken = await context
                            .read<LoginScreenController>()
                            .getToken();

                        print({
                          "name": nameController.text,
                          "phone": phoneNumberController.text,
                          "email": emailController.text,
                          "alternativePhone":
                              alternatePhoneNumberController.text,
                          "travelType": selectedTravelType ?? "Bus",
                          "language": selectedLanguage ?? "English",
                          "groupSize": prefferedGroupSizeController.text,
                          "budget": mybudgetController.text,
                          "fromDate": FromDateController.text,
                          "toDate": ToDateController.text,
                          "accessToken": accessToken,
                          "image": selectedProfileImage,
                          "id_proof": selectedIdProofImage
                        });
                        print("Uploading image: ${selectedProfileImage?.path}");

                        // Handle the case where accessToken is null
                        if (accessToken == null || accessToken.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Authentication Error! Please log in again.")),
                          );
                          return;
                        }

                        bool success = await context
                            .read<ProfileScreenController>()
                            .UploadProfile(
                                name: nameController.text,
                                phone: phoneNumberController.text,
                                email: emailController.text,
                                alternativePhone:
                                    alternatePhoneNumberController.text,
                                travelType: selectedTravelType ?? 'unKonown',
                                language: selectedLanguage ?? 'unKnown',
                                budget: mybudgetController.text,
                                groupSize: prefferedGroupSizeController.text,
                                fromDate: FromDateController.text,
                                toDate: ToDateController.text,
                                accessToken: accessToken,
                                image: File(selectedProfileImage!.path),
                                idProof: File(selectedIdProofImage!.path));

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Profile updated successfully")),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Failed to Upload profile!")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.primaryRed,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text('Update',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: ColorConstants.mainwhite,
                              textStyle:
                                  Theme.of(context).textTheme.labelSmall)),
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
      },
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

  Future<void> updateuser() async {
    user = await UserService.getLoginResponse();
    if(user!=null){
       setState(() {
        name=user!.name!;
      });
    }
  }
}
