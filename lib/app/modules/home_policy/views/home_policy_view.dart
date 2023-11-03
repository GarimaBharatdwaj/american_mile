import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/request_change.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/secondry_button.dart';
import '../../../../core/utils/divider.dart';
import '../../../../core/utils/index.dart';
import '../controllers/home_policy_controller.dart';

class HomePolicyView extends GetView<HomePolicyController> {
  const HomePolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.background,
          body: controller.isLoading.value == true
              ? showProgressIndicator()
              : SingleChildScrollView(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      const MyAppBar(
                        title: 'Home Policy',
                      ),
                      Gap(40.h),
                      Padding(
                        padding: EdgeInsets.only(right: 80.w),
                        child: ShadowContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Named Insured",
                                style: Get.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Gap(6.h),
                              Text(
                                "Named Insured",
                                style: Get.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Gap(6.h),
                              Text(
                                controller.homeDetails!['named_insureds'],
                                style: Get.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(40.h),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.h,
                          bottom: 20.h,
                          left: 20.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.r,
                          ),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 10.w,
                              offset: Offset(
                                0,
                                3.h,
                              ),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Addresses",
                                  style: Get.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                const RequestChange(),
                              ],
                            ),
                            Text(
                              "RESIDENTIAL",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(8.h),
                            Text(
                              controller.homeDetails!['address'],
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(40.h),
                      ShadowContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mortgage",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                            Gap(6.h),
                            Text(
                              "The Party to a mortgage who makes the loan, usually\na lender or bank.",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(16.h),
                            Text("LENDER", style: Get.textTheme.bodyMedium),
                            Gap(6.h),
                            Text(
                              "${controller.homeDetails!['mortgagee']['name']}\nLoan #${controller.homeDetails!['mortgagee']['loan']}",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.type.value = 0;
                            },
                            child: Text(
                              "CURRENT DETAILS",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: controller.type.value == 0
                                    ? AppColors.primaryDark
                                    : AppColors.textLight,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.type.value = 1;
                            },
                            child: Text(
                              "POLICY DOCUMENTS",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: controller.type.value == 1
                                    ? AppColors.primaryDark
                                    : AppColors.textLight,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(40.h),
                      if (controller.type.value == 0)
                        if (controller.homeDetails!['home_policies'].isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShadowContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.homeDetails!['home_policies']
                                          [0]['name'],
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Gap(8.h),
                                    Text(
                                      "EFFECTIVE DATE",
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Gap(8.h),
                                    Text(
                                      controller.homeDetails!['home_policies']
                                          [0]['description'],
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Gap(8.h),
                                    Text(
                                      "NEXT RENEWAL DATE",
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Gap(8.h),
                                    Text(
                                      controller.homeDetails!['home_policies']
                                          [0]['renewal_date'],
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Gap(8.h),
                                    Text(
                                      "CURRENT PREMIUM",
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Gap(4.h),
                                    Text(
                                      "\$${controller.homeDetails!['home_policies'][0]['total_premium_usd']}",
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Gap(8.h),
                                    Text(
                                      'Additional fees may apply \nplease review your policy\ndocuments for details',
                                      textAlign: TextAlign.center,
                                      style: Get.textTheme.bodySmall?.copyWith(
                                        color: AppColors.textLight,
                                      ),
                                    ),
                                    Gap(20.h),
                                    SecondryButton(
                                      onTap: () {
                                        controller.type.value = 1;
                                      },
                                      buttonText: 'Policy Documents',
                                    ),
                                    Gap(20.h),
                                  ],
                                ),
                              ),
                              Gap(40.h),
                              ...List.generate(
                                  controller.homeDetails!['coverages'].length,
                                  (index) {
                                var coverage =
                                    controller.homeDetails!['coverages'][index];
                                return ShadowContainer(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coverage['full_address'],
                                      style: Get.textTheme.titleMedium
                                          ?.copyWith(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primaryDark),
                                    ),
                                    Gap(8.h),
                                    Image.asset(
                                      ImagePaths.house,
                                    ),
                                    Gap(8.h),
                                    _houseItem(
                                      key: "PACKAGE-COVE-PERSONAL LIABILITY",
                                      value: "\$1,000,000",
                                    ),
                                    _houseItem(
                                      key: "PACKAGE - COVF-GUEST MEDICAL",
                                      value: "\$1,000",
                                    ),
                                    _houseItem(
                                      key: "LOSS OF USE",
                                      value: "10%",
                                    ),
                                    _houseItem(
                                      key: "ALE TERM",
                                      value: "24 MONTHS",
                                    ),
                                    _houseItem(
                                      key: "IDENTITY FRAUD EXPENSE",
                                      value: "\$28,500",
                                    ),
                                    _houseItem(
                                      key: "SEWER & DRAIN DAMAGE-HIGHER LIMITS",
                                      value: "\$25,000",
                                    ),
                                    _houseItem(
                                      key: "FENCES",
                                      value: "COVERED",
                                    ),
                                    _houseItem(
                                      key: "PERSONAL PROP",
                                      value: "40%",
                                    ),
                                    _houseItem(
                                      key: "CONTENTS REPLACEMENT COST",
                                      value: "YES",
                                    ),
                                    _houseItem(
                                      key: "SEP STRUCTURES",
                                      value: "59%",
                                    ),
                                    _houseItem(
                                      key: "PACKAGE - CVGA-DWELLING",
                                      value: "\$609,000",
                                    ),
                                    _houseItem(
                                      key:
                                          "SPECIAL LIMITS ON PERSONAL PROPERTY",
                                      value: "COVERED",
                                    ),
                                    _houseItem(
                                      key: "EXTENDED REPLACEMENT COST",
                                      value: "150%",
                                    ),
                                    _houseItem(
                                      key: "SERVICE LINE",
                                      value: "\$10,000",
                                    ),
                                    _houseItem(
                                      key: "LIMITED PLUMBING SYSTEM REPAIR",
                                      value: "\$1,000",
                                    ),
                                    _houseItem(
                                      key: "PERSONALS INJURY",
                                      value: "COVERED",
                                    ),
                                    _houseItem(
                                      key: "RESIDENCE GLASS",
                                      value: "COVERED",
                                    ),
                                    _houseItem(
                                      key: "EXTENDED ACCES",
                                      value: "COVERED",
                                    ),
                                    Gap(12.h),
                                    SecondryButton(
                                        onTap: () {},
                                        buttonText: "Request Change"),
                                  ],
                                ));
                              }),
                            ],
                          ),
                      if (controller.type.value == 1) _policyDocuments(context),
                      Gap(22.h),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  _houseItem({
    required String key,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: Get.textTheme.titleMedium?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(12.h),
        Text(
          value,
          style: Get.textTheme.titleMedium?.copyWith(
            fontSize: 14.sp,
          ),
        ),
        Gap(12.h),
      ],
    );
  }

  _policyDocuments(BuildContext context) {
    return Column(
      children:
          List.generate(controller.homeDetails!['documents'].length, (index) {
        var doc = controller.homeDetails!['documents'][index];
        return Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: ShadowContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.r,
                        ),
                        color: AppColors.textLight,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            ImagePaths.pdf,
                            height: 18.w,
                            width: 14.w,
                          ),
                          Gap(4.h),
                          Text(
                            "Document",
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: AppColors.white,
                              fontSize: 8.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "DATE POSTED",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          doc['date_added'],
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Gap(8.h),
                Text(
                  doc['document_type'],
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(8.h),
                Text(
                  doc['title'],
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
