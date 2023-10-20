import 'package:american_mile/app/modules/home/controllers/home_controller.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';

class PolicyHomeDashboard extends StatelessWidget {
  PolicyHomeDashboard({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(30.h),
        ...List.generate(controller.policies!['data']['auto_policies'].length,
            (index) {
          var policy = controller.policies!['data']['auto_policies'][index];
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
        ...List.generate(controller.policies!['data']['home_policies'].length,
            (index) {
          var policy = controller.policies!['data']['home_policies'][index];
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
        ...List.generate(controller.policies!['data']['life_policies'].length,
            (index) {
          var policy = controller.policies!['data']['life_policies'][index];
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
}
