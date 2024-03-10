import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nidNumberController = TextEditingController();
  final _locationController = TextEditingController();

  Uint8List? _image;
  File? selectedIMage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomText(
          text: AppString.updateProfile,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          fontName: 'Lato',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 22.h),
            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                      radius: 60.r, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                    radius: 60.r,
                    backgroundImage: const AssetImage(AppImages.profileImg),
                  ),
                  Positioned(
                      bottom: 12.h,
                      right: 0.w,
                      child: GestureDetector(
                          onTap: () {
                            showImagePickerOption(context);
                          },
                          child: SvgPicture.asset(AppIcons.profileEdit)))
                ],
              ),
            ),
            //======================================> Text From Field Section <===============================================
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _nameController,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your name',
              prefixIcon: _prefixIcon(AppIcons.person),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your email',
              prefixIcon: _prefixIcon(AppIcons.mail),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _phoneNumberController,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: '(406) 555-0120',
              prefixIcon: _prefixIcon(AppIcons.phone),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _dateOfBirthController,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your date of birth',
              prefixIcon: _prefixIcon(AppIcons.calendar),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _nidNumberController,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'NID Number',
              prefixIcon: _prefixIcon(AppIcons.creditCard),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _locationController,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: "Enter your location",
              prefixIcon: _prefixIcon(
                AppIcons.location,
              ),
            ),
            const Spacer(),
            CustomButton(title: AppString.updateProfile, onpress: () {}),
            SizedBox(height: 69.h),
          ],
        ),
      ),
    );
  }

  _prefixIcon(String icon) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 16.w),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.contain,
        color: AppColors.primaryColor,
      ),
    );
  }

  //==================================> ShowImagePickerOption Function <===============================

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.scaffoldBg,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50.w,
                              color: AppColors.primaryColor,
                            ),
                            CustomText(text: 'Gallery')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 50.w,
                                color: AppColors.primaryColor
                            ),
                            CustomText(text: 'Camera')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //==================================> Gallery <===============================
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // Navigator.of(context).pop();
  }
}