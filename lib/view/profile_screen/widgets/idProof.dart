import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_partner/utils/constants/color_constants.dart';

class IdProofUpload extends StatefulWidget {
  @override
  _IdProofUploadState createState() => _IdProofUploadState();
}

class _IdProofUploadState extends State<IdProofUpload> {
  TextEditingController controller = TextEditingController();
  File? selectedFile;

  Future<void> pickDocument() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedFile = File(pickedFile.path);
        controller.text =
            pickedFile.path.split('/').last; // Show only file name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
          color: ColorConstants.mainblack.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Upload ID Proof (Aadhaar, License)",
              suffixIcon: IconButton(
                icon: Icon(Icons.upload_file),
                onPressed: pickDocument,
              ),
            ),
          ),
          SizedBox(height: 10),
          if (selectedFile != null) // Show preview if file is selected
            Column(
              children: [
                Text("Preview:"),
                SizedBox(height: 5),
                Image.file(selectedFile!,
                    width: 150, height: 100, fit: BoxFit.cover),
              ],
            ),
        ],
      ),
    );
  }
}
