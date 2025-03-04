import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';

class Formfieldwidget extends StatelessWidget {
  final TextInputType textInputType;
  final String hintname;
  const Formfieldwidget(
      {super.key, required this.textInputType, required this.hintname});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: ColorConstants.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: hintname,
            hintStyle: GoogleFonts.roboto(
                fontSize: 17, color: ColorConstants.mainblack),
            border: InputBorder.none),
        style:
            GoogleFonts.roboto(fontSize: 17, color: ColorConstants.mainwhite),
      ),
    );
  }
}
