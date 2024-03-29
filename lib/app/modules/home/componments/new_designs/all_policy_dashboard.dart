import 'package:american_mile/app/modules/home/controllers/home_controller.dart';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/common_lib.dart';
import '../../../../../core/utils/app_colors.dart';

///
///
///
/// Changes in auto policy design
///
///
///

class AllPolicyDashboard extends StatelessWidget {
  AllPolicyDashboard({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return controller.policies == null
        ? SizedBox(
            height: MediaQuery.of(context).size.height - 150.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No policy is currently available; please proceed by importing one.",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleMedium?.copyWith(
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryDark),
                ),
                Gap(20.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.INSURANCE_PROVIDER);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0.9),
                          AppColors.primary.withOpacity(0.8),
                          AppColors.primary.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: IntrinsicWidth(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_rounded,
                              size: 32.h,
                              color: AppColors.white,
                            ),
                            Text(
                              "  Import Policy  ",
                              style: Get.textTheme.labelLarge?.copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.white,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Gap(10.h),
                ...List.generate(
                    controller.policies?['data']['auto_policies'].length,
                    (index) {
                  var policy =
                      controller.policies?['data']['auto_policies'][index];
                  return Column(
                    children: [
                      _policyItem(
                        context,
                        onTap: () {
                          Get.toNamed(
                            Routes.AUTO_POLICY,
                            arguments: policy['id'].toString(),
                          );
                        },
                        policyName: "AUTO POLICY",
                        colors: [
                          AppColors.autoPolicyLightColor,
                          AppColors.autoPolicyDarkColor
                        ],
                        policy: policy,
                      ),
                      Gap(10.h),
                    ],
                  );
                }),
                ...List.generate(
                    controller.policies!['data']['home_policies'].length,
                    (index) {
                  var policy =
                      controller.policies!['data']['home_policies'][index];

                  return Column(
                    children: [
                      _policyItem(context, onTap: () {
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
                          shadowColor: AppColors.homePolicyDarkColor),
                      Gap(10.h),
                    ],
                  );
                }),
                ...List.generate(
                    controller.policies!['data']['life_policies'].length,
                    (index) {
                  var policy =
                      controller.policies!['data']['life_policies'][index];

                  return Column(
                    children: [
                      _policyItem(
                        context,
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
                        shadowColor: AppColors.lifePolicyDarkColor,
                        policy: policy,
                      ),
                      Gap(10.h),
                    ],
                  );
                }),
                Gap(10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.INSURANCE_PROVIDER);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary.withOpacity(0.9),
                              AppColors.primary.withOpacity(0.8),
                              AppColors.primary.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: IntrinsicWidth(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_rounded,
                                  size: 30.h,
                                  color: AppColors.white,
                                ),
                                Text(
                                  " Import Another Policy ",
                                  style: Get.textTheme.labelLarge?.copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Poppins"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  _policyItem(
    BuildContext context, {
    required String policyName,
    required List<Color> colors,
    required Map<String, dynamic> policy,
    required void Function() onTap,
    bool isAuto = true,
    Color? shadowColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: shadowColor ?? AppColors.autoPolicyDarkColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: LinearGradient(
                        colors: colors,
                      ),
                    ),
                    child: Icon(
                      policyName == "AUTO POLICY"
                          ? Icons.drive_eta
                          : policyName == "HOME POLICY"
                              ? Icons.home_rounded
                              : Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Gap(10.w),
                  Expanded(
                    child: Text(
                      policyName,
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: shadowColor ?? AppColors.autoPolicyDarkColor,
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
                            fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                      Gap(4.h),
                      Text(
                        "\$${policy['total_premium_usd']}",
                        style: Get.textTheme.titleSmall?.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: shadowColor ?? AppColors.autoPolicyDarkColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(4.h),
            Padding(
              padding: EdgeInsets.only(right: 15.w, left: 15.w),
              child: Row(
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
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...[
                        Text(
                          "EFFECTIVE DATE",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          policy['description'],
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(10.h),
                        Text(
                          "DUE DATE",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          policy['renewal_date'],
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  height: 45.w,
                  width: 60.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    gradient: LinearGradient(
                      colors: colors,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Gap(15.h),
            if (policyName != "LIFE POLICY")
              GestureDetector(
                onTap: () {
                  deleteItemDialog(
                      context: context,
                      onTap: () {
                        controller.deleteAPI(
                            apiName: policyName == "AUTO POLICY"
                                ? 'delete-auto-policy'
                                : 'delete-home-policy',
                            id: policy['id']);
                      });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 22.h,
                      ),
                      const Text(" Delete Policy")
                    ],
                  ),
                ),
              ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }

  myPrint() {
    print("\n\n\n\n\n\n\n\n\n hhhhhhhhhhh \n\n\n\n\n\n\n\n");
  }
}
