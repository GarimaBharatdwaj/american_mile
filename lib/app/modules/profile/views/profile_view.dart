import 'package:american_mile/core/components/small_button.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
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
                        AppStrings.myProfile,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: RRectIcon(
                        image: ImagePaths.menu,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                Gap(40.h),
                ShadowContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("MOBILE PHONE #",
                              style: Get.textTheme.titleMedium),
                        ],
                      ),
                      Gap(6.h),
                      Text(
                        "480-678-7444",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(12.h),
                      Text("HOME PHONE #", style: Get.textTheme.titleMedium),
                      Gap(6.h),
                      Text(
                        "480-678-7444",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "✓ PREFERRED NUMBER",
                        style: Get.textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text("WORK PHONE #", style: Get.textTheme.titleMedium),
                      Gap(6.h),
                      Text(
                        "480-678-7444",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(16.h),
                      RectSmallButton(
                        buttonText: "Edit",
                        onTap: () {},
                      ),
                      Gap(32.h),
                    ],
                  ),
                ),
                Gap(40.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ShadowContainer(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('EMAIL INFROMATION',
                                    style: Get.textTheme.titleMedium),
                                Gap(8.h),
                                Text('COMMUNICATION EMAIL',
                                    style: Get.textTheme.titleMedium),
                                Gap(8.h),
                                Text('adambrettrobbins@gmail.com',
                                    style: Get.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Gap(16.h),
                            RectSmallButton(
                              buttonText: "Edit",
                              onTap: () {},
                            ),
                            Gap(32.h),
                          ],
                        ),
                      ),
                      Gap(32.w),
                      ShadowContainer(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('YOUR ACCOUNT',
                                    style: Get.textTheme.titleMedium),
                                Gap(8.h),
                                Text('USERNAME',
                                    style: Get.textTheme.titleMedium),
                                Gap(8.h),
                                Text('adambrettrobbins@gmail.com',
                                    style: Get.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Gap(16.h),
                            RectSmallButton(
                              buttonText: "Edit",
                              onTap: () {},
                            ),
                            Gap(32.h),
                          ],
                        ),
                      ),
                      Gap(32.w),
                      ShadowContainer(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PASSWORD',
                                    style: Get.textTheme.titleMedium),
                                Gap(8.h),
                                Text('CURRENT PASSWORD',
                                    style: Get.textTheme.titleMedium),
                                Gap(8.h),
                                Text('adambrettrobbins@gmail.com',
                                    style: Get.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Gap(16.h),
                            RectSmallButton(
                              buttonText: "Edit",
                              onTap: () {},
                            ),
                            Gap(32.h),
                          ],
                        ),
                      ),
                      Gap(32.w),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
