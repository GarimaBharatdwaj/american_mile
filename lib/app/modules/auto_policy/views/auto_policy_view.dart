import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/icon_button.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/request_change.dart';
import '../../../../core/components/secondry_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/auto_policy_controller.dart';

class AutoPolicyView extends GetView<AutoPolicyController> {
  const AutoPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 15.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: const MyAppBar(title: 'Auto Policy Details'),
                ),
                Gap(40.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Gap(15.w),
                      ShadowContainer(
                        width: context.width * .75,
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
                              "NAMED INSURED",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(6.h),
                            Text(
                              "Adam Robbins, 37",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15.w),
                      Container(
                        width: context.width * .75,
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
                            ),
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
                                  "Drivers",
                                  style: Get.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                const RequestChange(),
                              ],
                            ),
                            Text(
                              "DRIVERS",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(6.h),
                            Text(
                              "Adam Robbins, 37",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15.w),
                      Container(
                        width: context.width * .75,
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
                            ),
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
                                  "Addressess",
                                  style: Get.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                const RequestChange(),
                              ],
                            ),
                            Text(
                              "RESIDENTIALS",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(6.h),
                            Text(
                              "9926 N 16th PI E Phoneix, AZ 85020",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15.w),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      Gap(40.h),
                      Row(
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
                              "ID CARDS",
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
                          GestureDetector(
                            onTap: () {
                              controller.type.value = 2;
                            },
                            child: Text(
                              "DOCUMENTS",
                              style: Get.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: controller.type.value == 2
                                    ? AppColors.primaryDark
                                    : AppColors.textLight,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(40.h),
                      controller.type.value == 0
                          ? _autoDetails(context)
                          : controller.type.value == 1
                              ? _autoIdCards(context)
                              : _autoDocuments(context),
                      Gap(40.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _autoDocuments(BuildContext context) {
    return Column(
      children: List.generate(6, (index) {
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
                          "07/17/2023",
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
                  "AUTO INSURANCE- RENEWAL",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(8.h),
                Text(
                  "DOCUMENT 01",
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

  _autoIdCards(BuildContext context) {
    return Column(
      children: [
        _idCardItem(context),
        Gap(40.h),
        _idCardItem(context),
      ],
    );
  }

  _idCardItem(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          ShadowContainer(
            child: Column(
              children: [
                Text(
                  "EVIDENCE OF INSURANCE",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(10.h),
                Text(
                  "LIENHOLDER INTEREST FROM: BINDER",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _pdfComponent(
                            context,
                            'Paper Size',
                          ),
                          Gap(12.h),
                          Text(
                            '2019 LAND ROVER RANGE\nROVER SPORT 4D 4X4 LUX',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodySmall?.copyWith(
                              fontSize: 8.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(20.w),
                    Expanded(
                      child: Column(
                        children: [
                          _pdfComponent(
                            context,
                            'Paper Size',
                          ),
                          Gap(12.h),
                          Text(
                            '2016 JEEP GRAND CHEROKEE\n4D 4X4 LIMITED',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodySmall?.copyWith(
                              fontSize: 8.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(40.h),
          ShadowContainer(
            child: Column(
              children: [
                Text(
                  "ID CARD",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(10.h),
                Text(
                  "DOWNLOAD/PRINT",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _pdfComponent(
                            context,
                            'Paper Size',
                          ),
                          Gap(12.h),
                          AppIconButton(
                            buttonText: "Fax",
                            icon: ImagePaths.fax,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Gap(20.w),
                    Expanded(
                      child: Column(
                        children: [
                          _pdfComponent(
                            context,
                            'Paper Size',
                          ),
                          Gap(12.h),
                          AppIconButton(
                            buttonText: "Mail",
                            icon: ImagePaths.mail,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
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
                  "PROOF OF COVERAGE",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(4.h),
                Text(
                  "RENEWAL",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EFFECTIVE DATE",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          "09/11/2023",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EXPIRATION DATE",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(6.h),
                        Text(
                          "09/11/2023",
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gap(70.w),
                  ],
                ),
                Gap(10.h),
                Text(
                  "VEHICLES",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(10.h),
                Text(
                  "2019 LAND ROVER RANGE ROVER SPORT 4D 4X4 LUX\n(VIN #SALWRZREXKA226211)",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                    height: 1.3,
                  ),
                ),
                Gap(4.h),
                Text(
                  "2016 JEEP GRAND CHEROKEE 4D 4X4 LIMITED\n(VIN#1C4RJFBT4GC312961)",
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontSize: 12.sp,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _pdfComponent(
    BuildContext context,
    String text,
  ) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
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
            height: 22.w,
            width: 18.w,
          ),
          Gap(8.h),
          Text(
            text,
            style: Get.textTheme.bodySmall?.copyWith(
              color: AppColors.white,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }

  _autoDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Text(
                "EFFECTIVE DATE",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(10.h),
              Text(
                "03/11/2023 - 09/11/2023",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
              Text(
                "NEXT RENEWAL DATE",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(10.h),
              Text(
                "09/11/2023",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
              Text(
                '**** 7555 Bank Account',
                style: Get.textTheme.bodySmall?.copyWith(
                  color: AppColors.textLight,
                ),
              ),
              Gap(10.h),
              Text(
                "NEXT RENEWAL DATE",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(10.h),
              Text(
                "09/11/2023",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
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
              Gap(10.h),
              Text(
                'Additional fees may apply \nplease review your policy\ndocuments for details',
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall?.copyWith(
                  color: AppColors.textLight,
                ),
              ),
              Gap(20.h),
              Center(
                child: Column(
                  children: [
                    SecondryButton(
                        onTap: () {}, buttonText: 'Current ID Cards'),
                    Gap(15.h),
                    SecondryButton(
                        onTap: () {}, buttonText: 'Policy Documents'),
                    Gap(15.h),
                    SecondryButton(onTap: () {}, buttonText: 'Manage Autopay'),
                  ],
                ),
              ),
              Gap(20.h),
            ],
          ),
        ),
        Gap(40.h),
        _carDetails(
          context,
          carTitle: "2019 LAND ROVER RANGE ROVER\nSPORT 4D 4X4 LUX",
          carVin: "(VIN #SALWR2REXKA826211)",
          carImage: ImagePaths.car2,
        ),
        Gap(40.h),
        _carDetails(
          context,
          carTitle: "2016 JEEP GRAND CHEROKEE\n4D 4X4 LIMITED",
          carVin: "(VIN #1C4RJFBT4GC312961)",
          carImage: ImagePaths.car1,
        ),
      ],
    );
  }

  _carDetails(
    BuildContext context, {
    required String carTitle,
    required String carVin,
    required String carImage,
  }) {
    return ShadowContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          carTitle,
          style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              carImage,
              height: 175.w,
              width: 175.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  80.r,
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryDark,
                    AppColors.primary,
                  ],
                ),
              ),
              child: Text(
                "Connect Car",
                style: Get.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
        Text(
          carVin,
          style: Get.textTheme.titleMedium
              ?.copyWith(fontSize: 14.sp, color: AppColors.textLight),
        ),
        Gap(12.h),
        _carItem(
          key: "ACCIDENT FORGIVENESS",
          value: "YES",
        ),
        _carItem(
          key: "BODILY INJURY",
          value: "\$100,000/\$300,000",
        ),
        _carItem(
          key: "PROPERTY DAMAGE",
          value: "\$100,000",
        ),
        _carItem(
          key: "UNINSURED MOTORIST",
          value: "\$100,000/\$300,000",
        ),
        _carItem(
          key: "UNDERINSURED MOTORIST",
          value: "\$100,000/\$300,000",
        ),
        _carItem(
          key: "COMPREHENSIVE",
          value: "\$500",
        ),
        _carItem(
          key: "COLLISION",
          value: "\$500",
        ),
        _carItem(
          key: "ENHANCED ROADSIDE AND RIDE ASSISTANCE",
          value: "YES",
        ),
        _carItem(
          key: "NEW ORIGINAL PARTS",
          value: "NA",
        ),
        _carItem(
          key: "VECHILE REPLACEMENT PLUS",
          value: "NA",
        ),
      ],
    ));
  }

  _carItem({
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
