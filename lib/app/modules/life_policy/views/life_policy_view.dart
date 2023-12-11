import 'package:american_mile/core/utils/divider.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/life_policy_controller.dart';

class LifePolicyView extends GetView<LifePolicyController> {
  const LifePolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        body: controller.isLoading.isTrue
            ? showProgressIndicator()
            : SingleChildScrollView(
                padding: EdgeInsets.all(15.w),
                child: Column(children: [
                  const MyAppBar(
                    title: 'Life Policy',
                  ),
                  Gap(40.h),
                  ShadowContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Named Insured",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 21.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          "NAMED INSURED",
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        Gap(16.h),
                        Text(
                          controller.lifeDetails!['named_insureds']['name'],
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 21.sp,
                          ),
                        ),
                        Text(
                          controller.lifeDetails!['named_insureds']['address'],
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                            height: 1.4,
                          ),
                        ),
                        Gap(16.h),
                        Text(
                          "DATE OF BIRTH",
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(4.h),
                        Text(
                          controller.lifeDetails!['named_insureds']['dob'],
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
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
                          "Beneficiary Information",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 21.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          "NAMED INSURED",
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          controller.lifeDetails!['beneficiary_Info']
                                  ['beneficiary_paragraph']
                              .toString()
                              .toUpperCase(),
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            height: 1.4,
                          ),
                        ),
                        Gap(40.h),
                        Text(
                          "BENEFICIARY",
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(3.h),
                        Text(
                          controller.lifeDetails!['beneficiary_Info']
                              ['beneficiary'],
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
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
                          "Payor information",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 21.sp,
                          ),
                        ),
                        Gap(10.h),
                        Text(
                          "AN INDIVIDUAL AUTHORIZED TO MAKE PAYMENTS\nND MAKE CERTAIN LIMITED CHANGES TO BILLING.",
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            height: 1.4,
                          ),
                        ),
                        Gap(30.h),
                        Text(
                          "PAYOR",
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          controller.lifeDetails!['payor_info']['payor_name'],
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          controller.lifeDetails!['payor_info']
                              ['payor_address'],
                          style: Get.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.type.value = 0;
                          },
                          child: Text(
                            "DETAILS",
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
                            "DOCUMENTS",
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
                  ),
                  controller.type.value == 0 ? details() : documents(),
                  Gap(20.h),

                  /// PrimaryButton(
                  //   buttonText: "Flow",
                  //   onTap: () {
                  //     Get.toNamed(Routes.MY_FAMILY);
                  //   },
                  /// ),
                ]),
              ),
      ),
    );
  }

  ShadowContainer documents() => ShadowContainer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.lifeDetails!['policy_doc']['head'],
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          Gap(8.h),
          Text(
            controller.lifeDetails!['policy_doc']['text'],
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              height: 1.3,
            ),
          ),
        ],
      ));

  Column details() {
    return Column(
      children: [
        ShadowContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CURRENT POLICY",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              Gap(8.h),
              Text(
                controller.lifeDetails!['life_policy_data'][0]['name'],
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(8.h),
              Text(
                "THE INFORMATION CONTAINED HEREIN IS\nPROVIDED AS A GUIDE ONLY AND IS SUBJECT\nTO THE ACTUAL PROVISIONS CONTAINED IN\nYOUR POLICY OR CONTRACT.",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  height: 1.3,
                ),
              ),
              Gap(12.h),
              _policyItem(
                  key: 'PLAN DESCRIPTION',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['plan_desc']),
              _policyItem(
                  key: 'POLICY ISSUE DATE',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['policy_issue_date']),
              _policyItem(
                  key: 'POLICY STATUS',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['policy_status']),
              _policyItem(
                  key: 'MATURITY DATE',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['maturity_date']),
              Text(
                "THE DATE ON WHICH A POLICY REACHES THE END\nOF ITS TERM WHILE THE INSURED IS STILL LIVING.",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 10.sp,
                  height: 1.3,
                ),
              ),
              Gap(12.h),
              _policyItem(
                  key: 'INSURED STATUS',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['insured_status']),
              _policyItem(
                  key: 'FACE AMOUNT',
                  value:
                      '\$${controller.lifeDetails!['life_policy_data'][0]['face_amt']}'),
              _policyItem(
                  key: 'INSURED ISSUE AGE',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['insured_issue_age']),
              _policyItem(
                  key: 'POLICY TYPE',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['policy_type']),
              _policyItem(
                  key: 'PAID UP DATE',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['paidup_date']),
              _policyItem(
                  key: 'EXCESS CREDIT OPTION',
                  value: controller.lifeDetails!['life_policy_data'][0]
                      ['excess_credit_option']),
              Text(
                "EXCESS CREDITS ARE NAN GUARANTEED AMOUNTS OF MONEY\nTHAT MAY BE PAID AT THE DISCRETION OF FAMERS LIFE.",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 10.sp,
                  height: 1.3,
                ),
              ),
              Gap(12.h),
            ],
          ),
        ),
        Gap(40.h),
        ShadowContainer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "COVERAGE",
              style: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            Gap(8.h),
            Text(
              controller.lifeDetails!['coverage']['coverage_paragraph']
                  .toString()
                  .toUpperCase(),
              style: Get.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            Gap(12.h),
            Row(
              children: [
                profileImage(
                  imageUrl: controller.lifeDetails!['coverage']['image_url'],
                  circleRadius: 100.w,
                  imageSize: 80.w,
                ),
                Gap(20.w),
                Text(
                  controller.lifeDetails!['coverage']['name'],
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            Gap(12.h),
            _policyItem(
                key: 'WAIVER OF PREMIUM',
                value:
                    '\$${controller.lifeDetails!['coverage']['waiver_premimum']}'),
            _policyItem(
                key: 'ACCIDENTAL DEATH BENEFIT',
                value:
                    '\$${controller.lifeDetails!['coverage']['accidental_benefit']}'),
          ],
        )),
        Gap(40.h),
        ShadowContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BILLING INFORMATION",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 21.sp,
                ),
              ),
              Gap(12.h),
              Text(
                "BANK",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(12.h),
              Text(
                controller.lifeDetails!['billing_info']['bank_name'],
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              Gap(12.h),
              Text(
                "PREMIUM",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(12.h),
              Text(
                "${controller.lifeDetails!['billing_info']['premium']}",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              Gap(12.h),
              Text(
                "PAYMENT METHOD",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(12.h),
              Text(
                controller.lifeDetails!['billing_info']['payment_method'],
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              Gap(12.h),
              Text(
                "PAYMENT FREQUENCY",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(12.h),
              Text(
                controller.lifeDetails!['billing_info']['payment_frequency'],
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              Gap(8.h),
              Text(
                controller.lifeDetails!['billing_info']['payment_paragraph']
                    .toString()
                    .toUpperCase(),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.textBlackColor,
                ),
              ),
              Gap(8.h),
              Text(
                "PREMIUM DRAFT DAY",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(12.h),
              Text(
                controller.lifeDetails!['billing_info']['premium_draft_day']
                    .toString()
                    .toUpperCase(),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              Gap(8.h),
              Text(
                controller.lifeDetails!['billing_info']['draft_paragraph']
                    .toString()
                    .toUpperCase(),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.textBlackColor,
                ),
              ),
              Gap(8.h),
            ],
          ),
        ),
      ],
    );
  }

  _policyItem({
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
}
