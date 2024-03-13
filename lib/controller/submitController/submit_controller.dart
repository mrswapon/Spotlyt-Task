import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SubmitController extends GetxController {
  TextEditingController nameController = TextEditingController();
  Uint8List? image;
  File? selectedImage;

  //==================================> Gallery <===============================
  Future pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    selectedImage = File(returnImage.path);
    image = File(returnImage.path).readAsBytesSync();
    update();
    //Get.back(); //close the model sheet
  }
}