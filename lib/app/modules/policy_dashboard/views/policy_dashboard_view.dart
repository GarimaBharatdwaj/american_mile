import 'package:american_mile/core/components/primary_button.dart';
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
        () => controller.isLoading.value == true
            ? showProgressIndicator()
            : Scaffold(
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
                      Gap(30.h),
                      _policyItem(
                        policyName: "AUTO ON POLICY",
                        colors: [
                          AppColors.autoPolicyLightColor,
                          AppColors.autoPolicyDarkColor
                        ],
                      ),
                      Gap(30.h),
                      _policyItem(
                        policyName: "HOME POLICY",
                        colors: [
                          AppColors.homePolicyLightColor,
                          AppColors.homePolicyDarkColor
                        ],
                      ),
                      Gap(30.h),
                      _policyItem(
                        policyName: "BUSINESS POLICY",
                        colors: [
                          AppColors.businessPolicyDarkColor,
                          AppColors.businessPolicyLightColor
                        ],
                      ),
                      Gap(30.h),
                      _policyItem(
                        policyName: "LIFE POLICY",
                        colors: [
                          AppColors.lifePolicyLightColor,
                          AppColors.lifePolicyDarkColor
                        ],
                      ),
                      Gap(30.h),
                      _policyItem(
                        policyName: "PET POLICY",
                        colors: [
                          AppColors.petPolicyLightColor,
                          AppColors.petPolicyDarkColor
                        ],
                      ),
                      Gap(20.h),
                      PrimaryButton(
                        buttonText: "Flow",
                        onTap: () {
                          Get.toNamed(Routes.MANUAL_VEHICAL_DETAILS);
                        },
                      )
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
  }) {
    return ShadowContainer(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10.h),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              ImagePaths.more,
              width: 30.w,
              color: AppColors.textLight,
            ),
          ),
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
                    "\$95.595",
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
            children: [
              Text(
                "AUTO POLICY ",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: Text(
                  "#53520-65-55",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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
            "03/11/2023 - 09/11/2023",
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
            "09/11/2023",
            style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
