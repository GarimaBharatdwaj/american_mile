import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/utils/divider.dart';
import 'package:american_mile/core/utils/form_validation.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                          Row(
                            children: [
                              RRectIcon(
                                image: ImagePaths.menu,
                                onTap: () {},
                              ),
                              Expanded(
                                child: Text(
                                  "Profile",
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              RRectIcon(
                                image: ImagePaths.menu,
                                onTap: () {},
                              ),
                            ],
                          ),
                          Gap(40.h),
                          ShadowContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(20.h),
                                Center(
                                  child: Stack(
                                    children: [
                                      profileImage(
                                        imageUrl: controller.userData != null &&
                                                controller.userData!['image'] !=
                                                    null &&
                                                controller.userData!['image'] !=
                                                    ""
                                            ? controller.userData!['image']
                                            : "https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg",
                                        circleRadius: 100.w,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(4.w),
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              shape: BoxShape.circle),
                                          child: InkWell(
                                            onTap: () {
                                              controller
                                                  .onProfileImageTap(context);
                                            },
                                            child: Icon(
                                              Icons.edit_outlined,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(20.h),
                                // _profileComponent(
                                //   context,
                                //   validator: (value) =>
                                //       FormValidation.nameValidator(value,
                                //           tag: 'Enter Full Name',
                                //           isMandatory: true),
                                //   label: "Full Name",
                                //   value: controller.fullName,
                                //   icon: ImagePaths.user,
                                // ),
                                // _profileComponent(
                                //   context,
                                //   validator: (value) =>
                                //       FormValidation.emailValidatorRegistration(
                                //     value,
                                //   ),
                                //   label: "Email Address",
                                //   value: controller.email,
                                //   icon: ImagePaths.sms,
                                // ),
                                _profileComponent(
                                  context,
                                  validator: (value) =>
                                      FormValidation.phoneValidator(
                                    value,
                                  ),
                                  label: "Phone Number",
                                  value: controller.phone,
                                  icon: ImagePaths.phone,
                                ),
                                Gap(36.h),
                                PrimaryButton(
                                  buttonText: 'Update Profile',
                                  onTap: () {
                                    controller.validateMethode();
                                  },
                                ),
                              ],
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

  _profileComponent(BuildContext context,
      {required String label,
      required TextEditingController value,
      required String icon,
      final String? Function(String?)? validator}) {
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
                      decoration: const InputDecoration.collapsed(hintText: ""),
                    ),
                  ),
                ],
              ),
            ),
            Gap(15.h),
            // if (state.hasError)
              Text(
                state.errorText??"Test",
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).errorColor,
                ),
              ),
          ],
        );
      },
    );
  }
}
