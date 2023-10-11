import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/life_policy_controller.dart';

class LifePolicyView extends GetView<LifePolicyController> {
  const LifePolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
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
                  Gap(24.h),
                  Text(
                    "Adam Robbins",
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 21.sp,
                    ),
                  ),
                  Gap(6.h),
                  Text(
                    "5000 LAUREL CANYON BLVD # 302\nVALLEY VILLAGE, CA 91607-3155",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      height: 1.4,
                    ),
                  ),
                  Gap(32.h),
                  Text(
                    "DATE OF BIRTH",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    "10/23/1985",
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
                    "PLEASE CONTACT YOUR AGENT OR THE FARMERS\nNEW WORLD LIFE CONTACT CENTER AT -800-238\n-9671 TO CHANGE THE BENEFICIARY INFORMATION\nOBTAINED ON THIS PAGE AND ON FILE WITH THE\nCOMPANY.",
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
                  Gap(6.h),
                  Text(
                    "HAYDEN LUCAS",
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
                    "ADAM ROBBINS",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(6.h),
                  Text(
                    "5000 LAUREL CANYON BLVD # 302\nVALLEY VILLAGE, CA 91607",
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
                  Text(
                    "DETAILS",
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: AppColors.primaryDark,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    "DOCUMENTS",
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: AppColors.textLight,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
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
                    "LIFE POLICY #00946-79-94",
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
                      key: 'PLAN DESCRIPTION', value: 'SIMPLE WHOLE LIFE'),
                  _policyItem(key: 'POLICY ISSUE DATE', value: '01/03/2012'),
                  _policyItem(key: 'POLICY STATUS', value: 'ACTIVE'),
                  _policyItem(key: 'MATURITY DATE', value: '01/03/2017'),
                  Text(
                    "THE DATE ON WHICH A POLICY REACHES THE END\nOF ITS TERM WHILE THE INSURED IS STILL LIVING.",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 10.sp,
                      height: 1.3,
                    ),
                  ),
                  Gap(12.h),
                  _policyItem(key: 'INSURED STATUS', value: 'NON - NICOTINE'),
                  _policyItem(key: 'FACE AMOUNT', value: '\$100,000.00'),
                  _policyItem(key: 'INSURED ISSUE AGE', value: '26'),
                  _policyItem(key: 'POLICY TYPE', value: 'WHOLE LIFE'),
                  _policyItem(key: 'PAID UP DATE', value: '01/03/2086'),
                  _policyItem(
                      key: 'EXCESS CREDIT OPTION', value: 'PAID-UP ADDITIONS'),
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
                  "THE INFORMATION CONTAINED HEREIN IS PROVIDED\nAS A GUIDE ONLY AND IS SUBJECT TO THE ACTUAL\nPROVISIONS CONTAINED IN YOUR POLICY OR\nCONTRACT.",
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                Gap(12.h),
                Row(
                  children: [
                    profileImage(
                      imageUrl:
                          "https://www.happierhuman.com/wp-content/uploads/2022/07/glass-half-full-type-persons-lessons-learned.jpg",
                      circleRadius: 100.w,
                      imageSize: 80.w,
                    ),
                    Gap(20.w),
                    Text(
                      "ADAM R",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                Gap(12.h),
                _policyItem(key: 'WAIVER OF PREMIUM', value: '\$0.00'),
                _policyItem(
                    key: 'ACCIDENTAL DEATH BENEFIT', value: '\$10,000.00'),
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
                    "WELLS FARGO BANK, NA (...1258)",
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
                    "\$78.17",
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
                    "EFT",
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
                    "MONTHLY",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    "TO MAKE A PAYMENT, PLEASE CALL THE FARMERS NEW WORLD LIFE CONTACT CENTER 1-800-238-9671, MON-FRI,\n7AM TO 7PM CT.",
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
                    "03RD OF THE MONTH",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    "THE DAY OF THE MONTH YOU WANT US TO WITHDRAW\nYOUR PREMIUM FROM YOUR DESIGNATED ACCOUNT.",
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Gap(8.h),
                ],
              ),
            ),
            Gap(20.h),
            PrimaryButton(
              buttonText: "Flow",
              onTap: () {
                Get.toNamed(Routes.HOME_POLICY);
              },
            ),
          ]),
        ),
      ),
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
