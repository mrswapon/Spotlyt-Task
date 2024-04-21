import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/services/api_constants.dart';
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
  final _profileController = Get.put(ProfileController());
  DateTime _selectedDate = DateTime.now();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nidNumberController = TextEditingController();
  final _locationController = TextEditingController();
  final dateCtrl = TextEditingController();
  var parameter = Get.parameters;
  Uint8List? _image;
  File? selectedIMage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _nameController.text =
          parameter['name']! == "null" ? "" : parameter['name']!;
      _emailController.text = parameter['email']!;
      _phoneNumberController.text =
          parameter['phone']! == 'null' ? "" : parameter['phone']!;
      _nidNumberController.text =
          parameter['nidNo']! == 'null' ? "" : parameter['nidNo']!;
      dateCtrl.text =
          parameter['dateOfBirth'] == 'null' ? "" : parameter['dateOfBirth']!;
      _locationController.text =
          parameter['address']! == 'null' ? "" : parameter['address']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var profileData = _profileController.profileModel.value;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.updateProfile,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 750.h,
              ),
              child: Padding(
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
                                  radius: 60.r,
                                  backgroundImage: MemoryImage(_image!))
                              : CircleAvatar(
                                  radius: 60.r,
                                  backgroundImage: NetworkImage(
                                      '${ApiConstants.imageBaseUrl}${parameter['image']}'),
                                ),
                          Positioned(
                              bottom: 12.h,
                              right: 0.w,
                              child: GestureDetector(
                                  onTap: () {
                                    showImagePickerOption(context);
                                  },
                                  child:
                                      SvgPicture.asset(AppIcons.profileEdit)))
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

                    ///=========================phone number================>
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                      contenpaddingHorizontal: 12.w,
                      contenpaddingVertical: 16.h,
                      hintText: '(000) 000-0000',
                      prefixIcon: _prefixIcon(AppIcons.phone),
                    ),
                    SizedBox(height: 16.h),

                    ///=======================data picker===========================>
                    CustomTextField(
                      onTap: () {
                        _selectDate(context);
                      },
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      controller: dateCtrl,
                      contenpaddingHorizontal: 12.w,
                      contenpaddingVertical: 16.h,
                      hintText: 'Enter your date of birth',
                      /*ontapPrefix: () {
                        _selectDate(context);
                      },*/
                      prefixIcon: _prefixIcon(
                        AppIcons.calendar,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    ///========================location========================>?
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

                    ///--------------------------update profile button----------------------->
                    CustomButton(
                        title: AppString.updateProfile,
                        onpress: () {
                          _profileController.editProfile(
                              _nameController.text,
                              _phoneNumberController.text,
                              _nidNumberController.text,
                              _locationController.text,
                              selectedIMage,
                              dateCtrl.text);
                        }),
                    SizedBox(height: 69.h),
                  ],
                ),
              ),
            ),
          );
        },
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

  ///==================================> ShowImagePickerOption Function <===============================

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
                            Icon(Icons.camera_alt,
                                size: 50.w, color: AppColors.primaryColor),
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

  ///----------------------------------calender-------------------------------->
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        dateCtrl.text = DateFormat('MM/dd/yyyy').format(_selectedDate);
        /*dateCtrl.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";*/
        // date = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
      print('Selected date: ${dateCtrl.text}');
    }
  }
}
