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
                      image: ImagePaths.arrow,
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
                      _rowWidget(
                        context,
                        text1: 'EMAIL INFROMATION',
                        text2: 'COMMUNICATION EMAIL',
                        email: 'adambrettrobbins@gmail.com',
                      ),
                      Gap(32.w),
                      _rowWidget(
                        context,
                        text1: 'YOUR ACCOUNT',
                        text2: 'USERNAME',
                        email: 'adambrettrobbins@gmail.com',
                      ),
                      Gap(32.w),
                      _rowWidget(
                        context,
                        text1: 'PASSWORD',
                        text2: 'CURRENT PASSWORD',
                        email: 'adambrettrobbins@gmail.com',
                      ),
                    ],
                  ),
                ),
                Gap(40.h),
                ShadowContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email preferences",
                          style: Get.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Gap(6.h),
                      Text(
                          "CHOOSE TO RECEIVE AN EMAIL\nNOTICE FOR YOUR BILLING\nACCOUNT(S).",
                          style: Get.textTheme.titleMedium),
                      Gap(6.h),
                      Text(
                        "AUTO POLICY",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "#52520-66-55",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text("2 Autos on Policy",
                          style: Get.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Gap(8.h),
                      Text(
                        "HOME POLICY",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "#52520-66-55",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text("9926 N 16th PIE",
                          style: Get.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Gap(8.h),
                      Text(
                        "BILLING ACCOUNT ",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "#0525999243",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                          "THIS BILLING ACCOUNT IS NOT ELIGIBLE TO RECEIVE EMAIL NOTICES.",
                          style: Get.textTheme.titleMedium),
                      Gap(18.h),
                    ],
                  ),
                ),
                Gap(40.h),
                ShadowContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Policy nicknames",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "AUTO POLICY",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "#52520-66-55",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(16.h),
                      Text(
                        "2 Autos on Policy",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "HOME POLICY",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "#52520-66-55",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(16.h),
                      Text(
                        "9926 N 16th PIE",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "LIFE POLICY",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "#52520-66-55",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(16.h),
                      Text(
                        "Simple Whole Life -",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(6.h),
                      Text(
                        "Adam Robbins",
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
                Gap(40.h),
              ],
            ),
          )),
    );
  }

  _rowWidget(
    BuildContext context, {
    required String text1,
    required String text2,
    required String email,
  }) {
    return ShadowContainer(
      width: context.width * .75,
      child: Column(
        children: [
          Gap(10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1, style: Get.textTheme.titleMedium),
                Gap(8.h),
                Text(text2, style: Get.textTheme.titleMedium),
                Gap(8.h),
                Text(email,
                    style: Get.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Gap(16.h),
          RectSmallButton(
            buttonText: "Edit",
            onTap: () {},
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}
