import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:spotlyt_task/controller/Auth_Controller/auth_controller.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimentions.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';

class TextfieldSection extends StatefulWidget {
  TextfieldSection({super.key});

  @override
  State<TextfieldSection> createState() => _TextfieldSectionState();
}

class _TextfieldSectionState extends State<TextfieldSection> {
  final AuthController _authController = Get.put(AuthController());

  bool _isChecked = false;
  bool isCheckboxError = false;

  ///================toggle obscure===============>
  RxBool isObscure = true.obs;
  RxBool isObscures = true.obs;

  toggleIsObscure() {
    isObscure.value = !isObscure.value;
  }

  toggleReIsObscures() {
    isObscures.value = !isObscures.value;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 24.h),
              //===============================> Full Name Text-field <===============================
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                contenpaddingVertical: 14.h,
                controller: _authController.fullNameCtrl,
                prefixIcon: _customIcons(AppIcons.person),
                hintText: AppString.fullName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              //===============================> Email Text-field <===============================
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                contenpaddingVertical: 14.h,
                controller: _authController.emailCtrl,
                prefixIcon: _customIcons(AppIcons.mail),
                hintText: AppString.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your user email";
                  } else if (!emailValidate.hasMatch(value)) {
                    return "Invalid email!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              //===============================> Password Text-field <===============================
              Obx(
                () => CustomTextField(
                  contenpaddingHorizontal: 16.w,
                  contenpaddingVertical: 14.h,
                  isObscureText: isObscure.value,
                  controller: _authController.passwordCtrl,
                  prefixIcon: _customIcons(AppIcons.lockClosed),
                  sufixicons: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: GestureDetector(
                      onTap: () {
                        toggleIsObscure();
                      },
                      child: SvgPicture.asset(
                        isObscure.value ? AppIcons.eyeOff : AppIcons.eye,
                        color: AppColors.primaryColor,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                  hintText: AppString.createPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    } else if (!_validatePassword(value)) {
                      return "Insecure password detected.";
                    }
                    return null;
                  },
                ),
              ),
              //===============================> Re-Enter Password Text-field <===============================
              SizedBox(height: 16.h),
              Obx(
                () => CustomTextField(
                  contenpaddingHorizontal: 16.w,
                  contenpaddingVertical: 14.h,
                  isObscureText: isObscures.value,
                  controller: _authController.conPasswordCtrl,
                  prefixIcon: _customIcons(AppIcons.lockClosed),
                  sufixicons: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: GestureDetector(
                      onTap: () {
                        toggleReIsObscures();
                      },
                      child: SvgPicture.asset(
                        isObscures.value ? AppIcons.eyeOff : AppIcons.eye,
                        color: AppColors.primaryColor,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                  hintText: AppString.reenterPassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter again your user password";
                    } else if (value == _authController.passwordCtrl) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 14.h),
              _checkbox(),
              //===============================> Sign Up Button <===============================
              SizedBox(height: 44.h),
              CustomButton(
                  title: AppString.signUps,
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      if (_isChecked) {
                        _authController.handleSignUp();
                      } else {
                        setState(() {
                          isCheckboxError = true;
                        });
                      }
                    }
                  }),



              SizedBox(height: 64.h),
              //===============================> Already have an account Section <===============================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppString.alreadyHave,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signInScreen);
                    },
                    child: CustomText(
                      color: AppColors.primaryColor,
                      text: AppString.signIn,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        )
      ],
    );
  }

  //===============================> Custom Icons Method <===============================
  _customIcons(
    String icon,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: SvgPicture.asset(
        icon,
        color: AppColors.primaryColor,
        height: 24.h,
        width: 24.w,
      ),
    );
  }

  //===============================> Checkbox Method <===============================
  _checkbox() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: AppColors.primaryColor,
          isError: isCheckboxError,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: RichText(
            maxLines: 5,
            text: TextSpan(
              style: TextStyle(
                fontSize: 14.h,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
              //===============================> By Creating An Account TextSpan Section <===============================
              children: <TextSpan>[
                TextSpan(
                  text: AppString.byCreating,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.fontSizeDefault,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontFamily: "Lato/R 14",
                  ),
                ),
                TextSpan(
                    text: AppString.termsOfServices,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                      fontSize: Dimensions.fontSizeDefault,
                      color: AppColors.primaryColor,
                      fontFamily: "Lato/R 14",
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //==========================> on tap here <==========================
                        Get.toNamed(AppRoutes.termsConditionScreen);
                      }),
                const TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.fontSizeDefault,
                    color: Colors.black,
                    fontFamily: "Lato/R 14",
                  ),
                ),
                TextSpan(
                    text: AppString.privacyPolicy,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeDefault,
                      color: AppColors.primaryColor,
                      fontFamily: "Lato/R 14",
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //==========================> on tap here <==========================
                        Get.toNamed(AppRoutes.privacyPolicyScreen);
                      }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static RegExp emailValidate =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool _validatePassword(String value) {
    // RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    RegExp regex = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$');
    // RegExp regex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return regex.hasMatch(value);
  }
}
