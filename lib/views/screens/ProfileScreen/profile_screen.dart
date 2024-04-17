import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../widgets/genarel_error_screen.dart';
import '../../widgets/no_internet_screen.dart';
import 'InnerWidgets/aleart_dialog.dart';
import 'InnerWidgets/custom_list_tile_widget.dart';
import 'InnerWidgets/top_profile_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    print(
        "=====================================================role : ${_profileController.profileModel.value.role}");
    _profileController.profileModel;
    var profileData = _profileController.profileModel.value;

    return Scaffold(body: Obx(() {
      switch (_profileController.rxRequestStatus.value) {
        case Status.loading:
          return const CustomLoader();
        case Status.internetError:
          return NoInternetScreen(onTap: () async {
            await PrefsHelper.remove(AppConstants.isLogged);
            await PrefsHelper.remove(AppConstants.role);
            await PrefsHelper.remove(AppConstants.isLogged);
            await PrefsHelper.remove(AppConstants.bearerToken);
            Get.offAllNamed(AppRoutes.signInScreen);
            _profileController.getProfileData();
          });
        case Status.error:
          return GeneralErrorScreen(onTap: () async {
            await PrefsHelper.remove(AppConstants.isLogged);
            await PrefsHelper.remove(AppConstants.role);
            await PrefsHelper.remove(AppConstants.isLogged);
            await PrefsHelper.remove(AppConstants.bearerToken);
            Get.offAllNamed(AppRoutes.signInScreen);
            _profileController.getProfileData();
          });
        case Status.completed:
          return SingleChildScrollView(
            child: Column(
              children: [
                ///------------------------------top profile card------------------------------------>
                TopProfileCard(
                    height:
                        _profileController.profileModel.value.role != "employee"
                            ? null
                            : 310.h,
                    profileName:
                        _profileController.profileModel.value.fullName ??
                            "Name",
                    profileUrl:
                        _profileController.profileModel.value.image?.url,
                    badge: _profileController.profileModel.value.nidStatus),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                  child: Column(
                    children: [
                      ///--------------------------personal information---------------------------->
                      CustomListTileWidget(
                        ontap: () {
                          Get.toNamed(AppRoutes.personalInformationScreen);
                        },
                        title: AppString.personalInformation,
                        icon: AppIcons.profile,
                      ),

                      ///==================== If This is Tasker show 2 filled verify and wallet================>
                      _profileController.profileModel.value.role != "employee"
                          ? const SizedBox()
                          : Column(
                              children: [
                                ///--------------------------Get Verified ---------------------------->
                                ///============user already verify NID then show a Badge beside of profile name===============>

                                Obx(() {
                                  switch (_profileController
                                      .profileModel.value.nidStatus) {
                                    case "approved":
                                      return const SizedBox();
                                    case "pending":
                                      return const SizedBox();
                                    default:
                                      return CustomListTileWidget(
                                        ontap: () {
                                          Get.toNamed(AppRoutes.verifyScreen,
                                              arguments: profileData);
                                        },
                                        title: AppString.getVerfied,
                                        icon: AppIcons.veryfy,
                                      );
                                  }
                                }),

                                ///--------------------------Wallet ---------------------------->
                                CustomListTileWidget(
                                  ontap: () {
                                    Get.toNamed(AppRoutes.taskerWalletScreen);
                                  },
                                  title: AppString.wallet,
                                  icon: AppIcons.wallet,
                                ),
                              ],
                            ),

                      ///--------------------------setting ---------------------------->

                      CustomListTileWidget(
                        ontap: () {
                          Get.toNamed(AppRoutes.settingsScreen);
                        },
                        title: AppString.settings,
                        icon: AppIcons.setting,
                      ),

                      ///--------------------------Invite & Earn---------------------------->

                      _profileController.profileModel.value.role == "employee"
                          ? CustomListTileWidget(
                              ontap: () {
                                Get.toNamed(AppRoutes.inviteEarnScreen);
                              },
                              title: AppString.inviteAndEarn,
                              icon: AppIcons.share,
                            )
                          : const SizedBox(),

                      ///--------------------------log out---------------------------->
                      CustomListTileWidget(
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return LogoutDialog();
                              });
                        },
                        title: AppString.logOut,
                        icon: AppIcons.logout,
                      ),

                      _profileController.profileModel.value.role != "employee"
                          ? const SizedBox()
                          : SizedBox(
                              height: 60.h,
                            )
                    ],
                  ),
                ),
              ],
            ),
          );
      }
    }));
  }
}
