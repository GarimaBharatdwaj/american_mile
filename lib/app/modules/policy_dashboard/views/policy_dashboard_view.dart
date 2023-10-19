import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/utils/divider.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/policy_dashboard_controller.dart';

class PolicyDashboardView extends GetView<PolicyDashboardController> {
  const PolicyDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: controller.isLoading.value == true ||
                  controller.isProfileLoading.value == true
              ? showProgressIndicator()
              : SingleChildScrollView(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RRectIcon(
                            image: ImagePaths.menu,
                            onTap: () {
                              // controller.scaffoldkey.currentState!.openDrawer();
                            },
                          ),
                          Expanded(
                            child: Text(
                              "Policy Dashboard",
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
                      Gap(30.h),
                      ...List.generate(
                          controller.policies!['data']['auto_policies'].length,
                          (index) {
                        var policy = controller.policies!['data']
                            ['auto_policies'][index];
                        return Column(
                          children: [
                            _policyItem(
                              onTap: () {
                                Get.toNamed(
                                  Routes.AUTO_POLICY,
                                  arguments: policy['id'].toString(),
                                );
                              },
                              policyName: "AUTO ON POLICY",
                              colors: [
                                AppColors.autoPolicyLightColor,
                                AppColors.autoPolicyDarkColor
                              ],
                              policy: policy,
                            ),
                            Gap(30.h),
                          ],
                        );
                      }),
                      ...List.generate(
                          controller.policies!['data']['home_policies'].length,
                          (index) {
                        var policy = controller.policies!['data']
                            ['home_policies'][index];
                        return Column(
                          children: [
                            _policyItem(
                              onTap: () {
                                Get.toNamed(
                                  Routes.HOME_POLICY,
                                  arguments: policy['id'].toString(),
                                );
                              },
                              policyName: "HOME POLICY",
                              colors: [
                                AppColors.homePolicyLightColor,
                                AppColors.homePolicyDarkColor
                              ],
                              policy: policy,
                            ),
                            Gap(30.h),
                          ],
                        );
                      }),
                      ...List.generate(
                          controller.policies!['data']['life_policies'].length,
                          (index) {
                        var policy = controller.policies!['data']
                            ['life_policies'][index];
                        return Column(
                          children: [
                            _policyItem(
                              onTap: () {
                                Get.toNamed(
                                  Routes.LIFE_POLICY,
                                  arguments: policy['id'].toString(),
                                );
                              },
                              policyName: "LIFE POLICY",
                              colors: [
                                AppColors.lifePolicyLightColor,
                                AppColors.lifePolicyDarkColor
                              ],
                              policy: policy,
                              isAuto: false,
                            ),
                            Gap(30.h),
                          ],
                        );
                      }),
                      Gap(20.h),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  _policyItem({
    required String policyName,
    required List<Color> colors,
    required Map<String, dynamic> policy,
    required void Function() onTap,
    bool isAuto = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ShadowContainer(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35.w,
                  width: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: LinearGradient(
                      colors: colors,
                    ),
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: Text(
                    policyName,
                    style: Get.textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Gap(25.w),
                    Text(
                      "PAYMENT DUE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      "\$${policy['total_premium_usd']}",
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  policy['name'],
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                if (isAuto)
                  Text(
                    "MONTHLY AUTOMATIC",
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
              ],
            ),
            Gap(10.h),
            Text(
              "EFFECTIVE DATE",
              style: Get.textTheme.titleMedium?.copyWith(
                fontSize: 12.sp,
              ),
            ),
            Gap(8.h),
            Text(
              policy['description'],
              style: Get.textTheme.titleMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(10.h),
            Text(
              "DUE DATE",
              style: Get.textTheme.titleMedium?.copyWith(
                fontSize: 12.sp,
              ),
            ),
            Gap(8.h),
            Text(
              policy['renewal_date'],
              style: Get.textTheme.titleMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(15.h),
          ],
        ),
      ),
    );
  }

  _drawerItem({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.w,
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25.w,
            ),
            Gap(15.w),
            Text(
              title,
              style: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
