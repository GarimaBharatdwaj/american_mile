import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/primary_button.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                      child: profileImage(
                        imageUrl:
                            "https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg",
                        circleRadius: 100.w,
                      ),
                    ),
                    Gap(20.h),
                    _profileComponent(
                      label: "Full Name",
                      value: "Chris Alex",
                      icon: ImagePaths.user,
                    ),
                    _profileComponent(
                      label: "Email Address",
                      value: "chrisalex@gmail.com",
                      icon: ImagePaths.sms,
                    ),
                    _profileComponent(
                      label: "Phone Number",
                      value: "+1 (908) 1234 567",
                      icon: ImagePaths.phone,
                    ),
                    Gap(36.h),
                    PrimaryButton(
                      buttonText: 'Update Profile',
                      onTap: () {
                        Get.toNamed(Routes.AUTO_POLICY);

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _profileComponent({
    required String label,
    required String value,
    required String icon,
  }) {
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
              Text(
                value,
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        Gap(15.h),
      ],
    );
  }
}
