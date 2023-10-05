import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/request_change.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/secondry_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/home_policy_controller.dart';

class HomePolicyView extends GetView<HomePolicyController> {
  const HomePolicyView({Key? key}) : super(key: key);
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
                        'Home Policy',
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
                          "Adam Robbins",
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
                        "9926 N 16th PI E Phoneix, AZ 85020",
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
                        "UNITED WHOLESALE MORTGAGE LLC\nPO BOX 202028 \nFLORENCE, SC 29502",
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
                    Text(
                      "CURRENT DETAILS",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: AppColors.primaryDark,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "RENEWAL DETAILS",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: AppColors.textLight,
                        fontSize: 18.sp,
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
                          Text(
                            "AUTO POLICY ",
                            style: Get.textTheme.titleMedium?.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            "#53520-65-55",
                            style: Get.textTheme.titleMedium?.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Gap(8.h),
                      Text(
                        "EFFECTIVE DATE",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "03/11/2023 - 09/11/2023",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "NEXT RENEWAL DATE",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "09/11/2023",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        '**** 7555 Bank Account',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "NEXT RENEWAL DATE",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "09/11/2023",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        "CURRENT PREMIUM",
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        "\$2,263.00",
                        style: Get.textTheme.titleMedium?.copyWith(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SecondryButton(
                              onTap: () {}, buttonText: 'Pay Options'),
                          SecondryButton(
                              onTap: () {}, buttonText: 'Manage Autopay'),
                        ],
                      ),
                      Gap(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SecondryButton(
                              onTap: () {}, buttonText: 'Current ID Cards'),
                          SecondryButton(
                              onTap: () {}, buttonText: 'Policy Documents'),
                        ],
                      ),
                      Gap(20.h),
                    ],
                  ),
                ),
                Gap(40.h),
                ShadowContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "9926 N 16TH PI E",
                      style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryDark),
                    ),
                    Gap(8.h),
                    Text(
                      "PHOENIX, AZ 85020",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Image.asset(
                      ImagePaths.house,
                    ),
                    Text(
                      "(VIN #SALWR2REXKA826211)",
                      style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp, color: AppColors.textLight),
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
                      key: "SPECIAL LIMITS ON PERSONAL PROPERTY",
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
                    SecondryButton(onTap: () {}, buttonText: "Request Change"),
                  ],
                )),
              ],
            ),
          )),
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
}
