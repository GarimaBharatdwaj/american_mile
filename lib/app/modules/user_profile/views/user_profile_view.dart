import 'dart:developer';
import 'dart:io';

import 'package:american_mile/app/ui/widgets/view_picture.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/utils/divider.dart';
import 'package:american_mile/core/utils/form_validation.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../../../../core/utils/text_capitalization_formatter.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 1), () {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
      ));
    });

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? showProgressIndicator()
              : SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Column(
                        children: [
                          MyAppBar(
                            title: "Profile",
                            onTap: () {
                              Get.back(result: controller.isBack);
                            },
                          ),
                          Gap(10.h),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(20.h),
                                  Center(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        if (controller
                                            .profileImagePath.value.isNotEmpty)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            child: Image.file(
                                              File(controller
                                                  .profileImagePath.value),
                                              height: 110.w,
                                              width: 110.w,
                                            ),
                                          ),
                                        if (controller
                                            .profileImagePath.value.isEmpty)
                                          controller.userData != null &&
                                                  controller
                                                          .userData!['image'] !=
                                                      null &&
                                                  controller
                                                          .userData!['image'] !=
                                                      ""
                                              ? profileImage(
                                                  onTap: () {
                                                    if (controller.args ==
                                                        false) {
                                                      Get.to(() => ViewPicture(
                                                            imageUrl: controller
                                                                    .userData![
                                                                'image'],
                                                          ));
                                                    }
                                                  },
                                                  imageUrl: controller
                                                                  .userData !=
                                                              null &&
                                                          controller.userData![
                                                                  'image'] !=
                                                              null &&
                                                          controller.userData![
                                                                  'image'] !=
                                                              ""
                                                      ? controller
                                                          .userData!['image']
                                                      : "https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg",
                                                  circleRadius: 110.w,
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red),
                                                ),
                                        if (controller.edit.isTrue)
                                          Container(
                                            padding: EdgeInsets.all(12.w),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.black.withOpacity(
                                                .2,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                controller
                                                    .onProfileImageTap(context);
                                              },
                                              child: Icon(
                                                Icons.camera_alt_outlined,
                                                color: AppColors.white,
                                                size: 25.w,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Gap(20.h),
                                  _profileComponent(
                                    context,
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    validator: (value) =>
                                        FormValidation.nameValidator(
                                            controller.fullName.text,
                                            tag: 'Please Enter Full Name',
                                            isMandatory: true),
                                    label: "Full Name",
                                    readOnly: controller.edit.value == false,
                                    value: controller.fullName,
                                    keyboardType: TextInputType.name,
                                    icon: ImagePaths.user,
                                  ),
                                  _profileComponent(
                                    context,
                                    label: "Email Address",
                                    value: controller.email,
                                    readOnly: true,
                                    keyboardType: TextInputType.emailAddress,
                                    icon: ImagePaths.sms,
                                  ),
                                  _profileComponent(
                                    context,
                                    label: "Phone Number",
                                    value: controller.phone,
                                    readOnly: true,
                                    keyboardType: TextInputType.number,
                                    icon: ImagePaths.phone,
                                  ),
                                  Gap(36.h),
                                  PrimaryButton(
                                    buttonText: controller.edit.isFalse
                                        ? "Edit Profile"
                                        : 'Update Profile',
                                    onTap: () {
                                      log("Garima ");
                                      log(controller.profileImagePath
                                          .toString());
                                      if (controller.edit.isTrue) {
                                        controller.validateMethode();
                                      } else {
                                        controller.edit.value = true;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  _profileComponent(
    BuildContext context, {
    required String label,
    required TextEditingController value,
    required String icon,
    final String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    bool readOnly = false,
    TextInputType? keyboardType,
  }) {
    return FormField<String>(
      validator: validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Get.textTheme.titleMedium?.copyWith(
                color: AppColors.textLight,
                fontSize: 14.sp,
              ),
            ),
            Gap(15.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.textLight.withOpacity(.6),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    height: 27.w,
                    width: 27.w,
                  ),
                  Gap(15.w),
                  Expanded(
                    child: TextField(
                      controller: value,
                      keyboardType: keyboardType,
                      inputFormatters: inputFormatters,
                      decoration: const InputDecoration.collapsed(hintText: ""),
                      readOnly: readOnly,
                    ),
                  ),
                ],
              ),
            ),
            Gap(15.h),
            if (state.hasError)
              Text(
                state.errorText ?? "",
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).errorColor,
                ),
              ),
            if (state.hasError) Gap(15.h),
          ],
        );
      },
    );
  }
}
