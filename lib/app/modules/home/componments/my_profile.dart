import 'dart:io';
import 'package:flutter/services.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/divider.dart';
import '../../../../core/utils/form_validation.dart';
import '../../../../core/utils/index.dart';
import '../../../../core/utils/text_capitalization_formatter.dart';
import '../../../ui/widgets/view_picture.dart';
import '../controllers/home_controller.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? showProgressIndicator()
          : Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Gap(20.h),
                  ShadowContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20.h),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (controller.profileImagePath.value.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.file(
                                    File(controller.profileImagePath.value),
                                    height: 110.w,
                                    width: 110.w,
                                  ),
                                ),
                              if (controller.profileImagePath.value.isEmpty)
                                profileImage(
                                  onTap: () {
                                    Get.to(() => ViewPicture(
                                          imageUrl:
                                              controller.userData!['image'],
                                        ));
                                  },
                                  imageUrl: controller.userData != null &&
                                          controller.userData!['image'] !=
                                              null &&
                                          controller.userData!['image'] != ""
                                      ? controller.userData!['image']
                                      : "https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg",
                                  circleRadius: 110.w,
                                ),
                              if (controller.edit.isTrue)
                                Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.black.withOpacity(
                                      .2,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      controller.onProfileImageTap(context);
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
                          validator: (value) => FormValidation.nameValidator(
                              controller.fullName.text,
                              tag: 'Please Enter Full Name',
                              isMandatory: true),
                          readOnly: controller.edit.value == false,
                          label: "Full Name",
                          value: controller.fullName,
                          keyboardType: TextInputType.name,
                          icon: ImagePaths.user,
                        ),
                        _profileComponent(
                          context,
                          validator: (value) =>
                              FormValidation.emailValidatorRegistration(
                            controller.email.text,
                          ),
                          readOnly: true,
                          label: "Email Address",
                          value: controller.email,
                          keyboardType: TextInputType.emailAddress,
                          icon: ImagePaths.sms,
                        ),
                        _profileComponent(
                          context,
                          label: "Phone Number",
                          readOnly: true,
                          value: controller.phone,
                          keyboardType: TextInputType.number,
                          icon: ImagePaths.phone,
                        ),
                        Gap(36.h),
                        PrimaryButton(
                          buttonText: controller.edit.isFalse
                              ? "Edit Profile"
                              : 'Update Profile',
                          onTap: () {
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
                ],
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
