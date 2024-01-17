import 'package:american_mile/app/modules/home_policy/views/view_home_policy.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/request_change.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/secondry_button.dart';
import '../../../../core/utils/divider.dart';
import '../../../../core/utils/index.dart';
import '../controllers/home_policy_controller.dart';

class HomePolicyView extends GetView<HomePolicyController> {
  const HomePolicyView({Key? key}) : super(key: key);

  homePolicyDetails(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EFFECTIVE DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      controller.homeDetails!['home_policies'][0]['description']
                          .toString()
                          .toLowerCase()
                          .replaceAll("effective", "#"),
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EFFECTIVE DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      controller.homeDetails!['home_policies'][0]['name']
                          .toString(),
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NEXT RENEWAL DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      controller.homeDetails!['home_policies'][0]
                          ['renewal_date'],
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CURRENT PREMIUM",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      "\$${controller.homeDetails!['home_policies'][0]['total_premium_usd']}",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(10.h),
          Text(
            'Additional fees may apply please review your policy documents for details',
            textAlign: TextAlign.start,
            style: Get.textTheme.bodySmall?.copyWith(
              color: AppColors.textLight,
            ),
          ),
          Gap(10.h),
          SecondryButton(
            onTap: () {
              controller.type.value = 1;
            },
            buttonText: 'Policy Documents',
          ),
          Gap(20.h),
          Container(
            height: 0.5,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            color: Colors.grey.withOpacity(0.6),
          ),





          if (controller.type.value == 1)
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

                  ShadowContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.homeDetails!['full_address'],
                            style: Get.textTheme.titleMedium?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryDark),
                          ),
                          Gap(8.h),
                          Image.asset(
                            ImagePaths.house,
                          ),
                          Gap(8.h),
                          if (controller.homeDetails!['coverages']
                          ['medical_payments'] !=
                              null)
                            _houseItem(
                              key: "MEDICAL PAYMENTS",
                              value:
                              controller.homeDetails!['coverages']
                              ['medical_payments'],
                            ),
                          if (controller.homeDetails!['coverages']
                          ['persoal_liability'] !=
                              null)
                            _houseItem(
                              key: "PERSONAL LIABILITY",
                              value:
                              controller.homeDetails!['coverages']
                              ['persoal_liability'],
                            ),
                          if (controller.homeDetails!['coverages']
                          ['loss_of_use'] !=
                              null)
                            _houseItem(
                              key: "LOSS OF USE",
                              value:
                              controller.homeDetails!['coverages']
                              ['loss_of_use'],
                            ),
                          if (controller.homeDetails!['coverages']
                          ['persoal_prop_liability'] !=
                              null)
                            _houseItem(
                              key: "Persoal Prop Liability",
                              value:
                              controller.homeDetails!['coverages']
                              ['persoal_prop_liability'],
                            ),
                          if (controller.homeDetails!['coverages']
                          ['security_liability'] !=
                              null)
                            _houseItem(
                              key: "Security Liability",
                              value:
                              controller.homeDetails!['coverages']
                              ['security_liability'],
                            ),
                          if (controller.homeDetails!['coverages']
                          ['dwelling_liability'] !=
                              null)
                            _houseItem(
                              key: "Dwelling Liability",
                              value:
                              controller.homeDetails!['coverages']
                              ['dwelling_liability'],
                            ),

                          // _houseItem(
                          //   key: "FENCES",
                          //   value: "COVERED",
                          // ),
                          // _houseItem(
                          //   key: "PERSONAL PROP",
                          //   value: "40%",
                          // ),
                          // _houseItem(
                          //   key: "CONTENTS REPLACEMENT COST",
                          //   value: "YES",
                          // ),
                          // _houseItem(
                          //   key: "SEP STRUCTURES",
                          //   value: "59%",
                          // ),
                          // _houseItem(
                          //   key: "PACKAGE - CVGA-DWELLING",
                          //   value: "\$609,000",
                          // ),
                          // _houseItem(
                          //   key:
                          //   "SPECIAL LIMITS ON PERSONAL PROPERTY",
                          //   value: "COVERED",
                          // ),
                          // _houseItem(
                          //   key: "EXTENDED REPLACEMENT COST",
                          //   value: "150%",
                          // ),
                          // _houseItem(
                          //   key: "SERVICE LINE",
                          //   value: "\$10,000",
                          // ),
                          // _houseItem(
                          //   key: "LIMITED PLUMBING SYSTEM REPAIR",
                          //   value: "\$1,000",
                          // ),
                          // _houseItem(
                          //   key: "PERSONALS INJURY",
                          //   value: "COVERED",
                          // ),
                          // _houseItem(
                          //   key: "RESIDENCE GLASS",
                          //   value: "COVERED",
                          // ),
                          // _houseItem(
                          //   key: "EXTENDED ACCES",
                          //   value: "COVERED",
                          // ),
                          Gap(12.h),
                          SecondryButton(
                              onTap: () {
                                Get.toNamed(Routes.MY_FAMILY);
                              },
                              buttonText: "Manage Homes"),

                          Gap(30.h),

                          if (controller.homeDetails!['deductible']
                          ['All Perils'] !=
                              null ||
                              controller.homeDetails!['deductible']
                              ['windstorm_or_hail'] !=
                                  null ||
                              controller.homeDetails!['deductible']
                              ['all_other_perils'] !=
                                  null)
                            ShadowContainer(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deductibles',
                                      style: Get.textTheme.titleMedium
                                          ?.copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black),
                                    ),
                                    Gap(6.h),
                                    Text(
                                      "For home policies, there are three common types of deductibles; flat, percent, and split deductibles",
                                      style: Get.textTheme.bodyMedium
                                          ?.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Gap(20.h),
                                    if (controller
                                        .homeDetails!['deductible']
                                    ['All Perils'] !=
                                        null)
                                      _houseItem(
                                        key: "All Perils",
                                        value: controller
                                            .homeDetails!['deductible']
                                        ['All Perils'],
                                      ),
                                    if (controller
                                        .homeDetails!['deductible']
                                    ['all_other_perils'] !=
                                        null)
                                      _houseItem(
                                        key: "All Other Perils",
                                        value: controller
                                            .homeDetails!['deductible']
                                        ['all_other_perils'],
                                      ),
                                    if (controller
                                        .homeDetails!['deductible']
                                    ['windstorm_or_hail'] !=
                                        null)
                                      _houseItem(
                                        key: "Windstorm Or Hail",
                                        value: controller
                                            .homeDetails!['deductible']
                                        ['windstorm_or_hail'],
                                      ),
                                  ],
                                )),
                        ],
                      ))

                  // ...List.generate(
                  //     controller.homeDetails!['coverages'].length,
                  //     (index) {
                  //   var coverage =
                  //       controller.homeDetails!['coverages'][index];
                  //   return ShadowContainer(
                  //       child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         coverage['full_address'],
                  //         style: Get.textTheme.titleMedium
                  //             ?.copyWith(
                  //                 fontSize: 18.sp,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: AppColors.primaryDark),
                  //       ),
                  //       Gap(8.h),
                  //       Image.asset(
                  //         ImagePaths.house,
                  //       ),
                  //       Gap(8.h),
                  //       _houseItem(
                  //         key: "PACKAGE-COVE-PERSONAL LIABILITY",
                  //         value: "\$1,000,000",
                  //       ),
                  //       _houseItem(
                  //         key: "PACKAGE - COVF-GUEST MEDICAL",
                  //         value: "\$1,000",
                  //       ),
                  //       _houseItem(
                  //         key: "LOSS OF USE",
                  //         value: "10%",
                  //       ),
                  //       _houseItem(
                  //         key: "ALE TERM",
                  //         value: "24 MONTHS",
                  //       ),
                  //       _houseItem(
                  //         key: "IDENTITY FRAUD EXPENSE",
                  //         value: "\$28,500",
                  //       ),
                  //       _houseItem(
                  //         key: "SEWER & DRAIN DAMAGE-HIGHER LIMITS",
                  //         value: "\$25,000",
                  //       ),
                  //       _houseItem(
                  //         key: "FENCES",
                  //         value: "COVERED",
                  //       ),
                  //       _houseItem(
                  //         key: "PERSONAL PROP",
                  //         value: "40%",
                  //       ),
                  //       _houseItem(
                  //         key: "CONTENTS REPLACEMENT COST",
                  //         value: "YES",
                  //       ),
                  //       _houseItem(
                  //         key: "SEP STRUCTURES",
                  //         value: "59%",
                  //       ),
                  //       _houseItem(
                  //         key: "PACKAGE - CVGA-DWELLING",
                  //         value: "\$609,000",
                  //       ),
                  //       _houseItem(
                  //         key:
                  //             "SPECIAL LIMITS ON PERSONAL PROPERTY",
                  //         value: "COVERED",
                  //       ),
                  //       _houseItem(
                  //         key: "EXTENDED REPLACEMENT COST",
                  //         value: "150%",
                  //       ),
                  //       _houseItem(
                  //         key: "SERVICE LINE",
                  //         value: "\$10,000",
                  //       ),
                  //       _houseItem(
                  //         key: "LIMITED PLUMBING SYSTEM REPAIR",
                  //         value: "\$1,000",
                  //       ),
                  //       _houseItem(
                  //         key: "PERSONALS INJURY",
                  //         value: "COVERED",
                  //       ),
                  //       _houseItem(
                  //         key: "RESIDENCE GLASS",
                  //         value: "COVERED",
                  //       ),
                  //       _houseItem(
                  //         key: "EXTENDED ACCES",
                  //         value: "COVERED",
                  //       ),
                  //       Gap(12.h),
                  //       SecondryButton(
                  //           onTap: () {
                  //             Get.toNamed(Routes.MY_FAMILY);
                  //           },
                  //           buttonText: "Manage Homes"),
                  //     ],
                  //   ));
                  // }),
                ],
              ),
          if (controller.type.value == 2) _policyDocuments(context),
          Gap(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coverage",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 24.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SecondryButton(
                  onTap: () {
                    Get.offAllNamed(Routes.HOME,arguments: "home");
                  },
                  height: 40.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                  ),
                  buttonText: 'Manage Homes'),
            ],
          ),
          Gap(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                ...List.generate(1, (index) {
                  return GestureDetector(
                    onTap: () {

                      Get.to(()=>ViewHomePolicy(homeDetails: controller.homeDetails!,));

                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.homeDetails!['full_address'],
                                style: Get.textTheme.titleMedium?.copyWith(
                                  fontSize: 16.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Gap(30.w),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 35.h,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        Gap(10.h),
                        Container(
                          height: 0.5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Gap(10.h),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 1), () {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
      ));
    });


    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        floatingActionButton: GestureDetector(
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
                      " Add Home Policy ",
                      style: Get.textTheme.labelLarge?.copyWith(
                          color: AppColors.white, fontFamily: "Poppins"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        body: controller.isLoading.value == true
            ? showProgressIndicator()
            : SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      const MyAppBar(
                        title: 'Home Policy',
                      ),

                      Text(
                        controller.homeDetails!['home_policies'][0]['name']
                            .toString()
                            .toLowerCase()
                            .replaceAll("homeowners #", "#"),
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          fontFamily: "Poppins",
                          color: AppColors.primary,
                        ),
                      ),

                      Image.asset(
                        ImagePaths.house,
                        fit: BoxFit.cover,
                        height: 170.h,
                        width: 170.h,
                      ),

                      homePolicyDetails(context),

                      ///=====================

                      // Gap(600.h),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 80.w),
                      //   child: ShadowContainer(
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           "Named Insured",
                      //           style: Get.textTheme.titleMedium?.copyWith(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 18.sp,
                      //           ),
                      //         ),
                      //         Gap(6.h),
                      //         Text(
                      //           "Named Insured",
                      //           style: Get.textTheme.bodyMedium?.copyWith(
                      //             fontSize: 12.sp,
                      //           ),
                      //         ),
                      //         Gap(6.h),
                      //         Text(
                      //           controller.homeDetails!['named_insureds'],
                      //           style: Get.textTheme.titleMedium?.copyWith(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 18.sp,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Gap(40.h),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //     top: 20.h,
                      //     bottom: 20.h,
                      //     left: 20.h,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(
                      //       20.r,
                      //     ),
                      //     color: AppColors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: AppColors.shadowColor,
                      //         blurRadius: 10.w,
                      //         offset: Offset(
                      //           0,
                      //           3.h,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "Addresses",
                      //             style: Get.textTheme.titleMedium?.copyWith(
                      //               fontWeight: FontWeight.w600,
                      //               fontSize: 18.sp,
                      //             ),
                      //           ),
                      //           GestureDetector(
                      //               onTap: () {
                      //                 Get.toNamed(Routes.MY_FAMILY);
                      //               },
                      //               child: const RequestChange(
                      //                 title: 'Manage Homes',
                      //               )),
                      //         ],
                      //       ),
                      //       Text(
                      //         "RESIDENTIAL",
                      //         style: Get.textTheme.bodyMedium?.copyWith(
                      //           fontSize: 12.sp,
                      //         ),
                      //       ),
                      //       Gap(8.h),
                      //       Text(
                      //         controller.homeDetails!['address'],
                      //         style: Get.textTheme.titleMedium?.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 18.sp,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Gap(40.h),
                      // ShadowContainer(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Mortgage",
                      //         style: Get.textTheme.titleMedium?.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 18.sp,
                      //         ),
                      //       ),
                      //       Gap(6.h),
                      //       Text(
                      //         "The Party to a mortgage who makes the loan, usually\na lender or bank.",
                      //         style: Get.textTheme.bodyMedium?.copyWith(
                      //           fontSize: 12.sp,
                      //         ),
                      //       ),
                      //       Gap(16.h),
                      //       Text("LENDER", style: Get.textTheme.bodyMedium),
                      //       Gap(6.h),
                      //       Text(
                      //         "${controller.homeDetails!['mortgagee']['name']}\nLoan #${controller.homeDetails!['mortgagee']['loan']}",
                      //         style: Get.textTheme.titleMedium?.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //           height: 1.4,
                      //           fontSize: 18.sp,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Gap(40.h),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //         controller.type.value = 0;
                      //       },
                      //       child: Text(
                      //         "CURRENT DETAILS",
                      //         style: Get.textTheme.titleMedium?.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //           height: 1.4,
                      //           color: controller.type.value == 0
                      //               ? AppColors.primaryDark
                      //               : AppColors.textLight,
                      //           fontSize: 18.sp,
                      //         ),
                      //       ),
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         controller.type.value = 1;
                      //       },
                      //       child: Text(
                      //         "POLICY DOCUMENTS",
                      //         style: Get.textTheme.titleMedium?.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //           height: 1.4,
                      //           color: controller.type.value == 1
                      //               ? AppColors.primaryDark
                      //               : AppColors.textLight,
                      //           fontSize: 18.sp,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Gap(40.h),
                      // if (controller.type.value == 0)
                      //   if (controller.homeDetails!['home_policies'].isNotEmpty)
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         ShadowContainer(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 controller.homeDetails!['home_policies']
                      //                     [0]['name'],
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 18.sp,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //               Gap(8.h),
                      //               Text(
                      //                 "EFFECTIVE DATE",
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 14.sp,
                      //                 ),
                      //               ),
                      //               Gap(8.h),
                      //               Text(
                      //                 controller.homeDetails!['home_policies']
                      //                     [0]['description'],
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 14.sp,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               Gap(8.h),
                      //               Text(
                      //                 "NEXT RENEWAL DATE",
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 14.sp,
                      //                 ),
                      //               ),
                      //               Gap(8.h),
                      //               Text(
                      //                 controller.homeDetails!['home_policies']
                      //                     [0]['renewal_date'],
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 14.sp,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               Gap(8.h),
                      //               Text(
                      //                 "CURRENT PREMIUM",
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 12.sp,
                      //                 ),
                      //               ),
                      //               Gap(4.h),
                      //               Text(
                      //                 "\$${controller.homeDetails!['home_policies'][0]['total_premium_usd']}",
                      //                 style:
                      //                     Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 20.sp,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               Gap(8.h),
                      //               Text(
                      //                 'Additional fees may apply \nplease review your policy\ndocuments for details',
                      //                 textAlign: TextAlign.center,
                      //                 style: Get.textTheme.bodySmall?.copyWith(
                      //                   color: AppColors.textLight,
                      //                 ),
                      //               ),
                      //               Gap(20.h),
                      //               SecondryButton(
                      //                 onTap: () {
                      //                   controller.type.value = 1;
                      //                 },
                      //                 buttonText: 'Policy Documents',
                      //               ),
                      //               Gap(20.h),
                      //             ],
                      //           ),
                      //         ),
                      //         Gap(40.h),
                      //
                      //         ShadowContainer(
                      //             child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               controller.homeDetails!['full_address'],
                      //               style: Get.textTheme.titleMedium?.copyWith(
                      //                   fontSize: 18.sp,
                      //                   fontWeight: FontWeight.w600,
                      //                   color: AppColors.primaryDark),
                      //             ),
                      //             Gap(8.h),
                      //             Image.asset(
                      //               ImagePaths.house,
                      //             ),
                      //             Gap(8.h),
                      //             if (controller.homeDetails!['coverages']
                      //                     ['medical_payments'] !=
                      //                 null)
                      //               _houseItem(
                      //                 key: "MEDICAL PAYMENTS",
                      //                 value:
                      //                     controller.homeDetails!['coverages']
                      //                         ['medical_payments'],
                      //               ),
                      //             if (controller.homeDetails!['coverages']
                      //                     ['persoal_liability'] !=
                      //                 null)
                      //               _houseItem(
                      //                 key: "PERSONAL LIABILITY",
                      //                 value:
                      //                     controller.homeDetails!['coverages']
                      //                         ['persoal_liability'],
                      //               ),
                      //             if (controller.homeDetails!['coverages']
                      //                     ['loss_of_use'] !=
                      //                 null)
                      //               _houseItem(
                      //                 key: "LOSS OF USE",
                      //                 value:
                      //                     controller.homeDetails!['coverages']
                      //                         ['loss_of_use'],
                      //               ),
                      //             if (controller.homeDetails!['coverages']
                      //                     ['persoal_prop_liability'] !=
                      //                 null)
                      //               _houseItem(
                      //                 key: "Persoal Prop Liability",
                      //                 value:
                      //                     controller.homeDetails!['coverages']
                      //                         ['persoal_prop_liability'],
                      //               ),
                      //             if (controller.homeDetails!['coverages']
                      //                     ['security_liability'] !=
                      //                 null)
                      //               _houseItem(
                      //                 key: "Security Liability",
                      //                 value:
                      //                     controller.homeDetails!['coverages']
                      //                         ['security_liability'],
                      //               ),
                      //             if (controller.homeDetails!['coverages']
                      //                     ['dwelling_liability'] !=
                      //                 null)
                      //               _houseItem(
                      //                 key: "Dwelling Liability",
                      //                 value:
                      //                     controller.homeDetails!['coverages']
                      //                         ['dwelling_liability'],
                      //               ),
                      //
                      //             // _houseItem(
                      //             //   key: "FENCES",
                      //             //   value: "COVERED",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "PERSONAL PROP",
                      //             //   value: "40%",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "CONTENTS REPLACEMENT COST",
                      //             //   value: "YES",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "SEP STRUCTURES",
                      //             //   value: "59%",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "PACKAGE - CVGA-DWELLING",
                      //             //   value: "\$609,000",
                      //             // ),
                      //             // _houseItem(
                      //             //   key:
                      //             //   "SPECIAL LIMITS ON PERSONAL PROPERTY",
                      //             //   value: "COVERED",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "EXTENDED REPLACEMENT COST",
                      //             //   value: "150%",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "SERVICE LINE",
                      //             //   value: "\$10,000",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "LIMITED PLUMBING SYSTEM REPAIR",
                      //             //   value: "\$1,000",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "PERSONALS INJURY",
                      //             //   value: "COVERED",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "RESIDENCE GLASS",
                      //             //   value: "COVERED",
                      //             // ),
                      //             // _houseItem(
                      //             //   key: "EXTENDED ACCES",
                      //             //   value: "COVERED",
                      //             // ),
                      //             Gap(12.h),
                      //             SecondryButton(
                      //                 onTap: () {
                      //                   Get.toNamed(Routes.MY_FAMILY);
                      //                 },
                      //                 buttonText: "Manage Homes"),
                      //
                      //             Gap(30.h),
                      //
                      //             if (controller.homeDetails!['deductible']
                      //                         ['All Perils'] !=
                      //                     null ||
                      //                 controller.homeDetails!['deductible']
                      //                         ['windstorm_or_hail'] !=
                      //                     null ||
                      //                 controller.homeDetails!['deductible']
                      //                         ['all_other_perils'] !=
                      //                     null)
                      //               ShadowContainer(
                      //                   child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text(
                      //                     'Deductibles',
                      //                     style: Get.textTheme.titleMedium
                      //                         ?.copyWith(
                      //                             fontSize: 18.sp,
                      //                             fontWeight: FontWeight.w600,
                      //                             color: AppColors.black),
                      //                   ),
                      //                   Gap(6.h),
                      //                   Text(
                      //                     "For home policies, there are three common types of deductibles; flat, percent, and split deductibles",
                      //                     style: Get.textTheme.bodyMedium
                      //                         ?.copyWith(
                      //                       fontSize: 12.sp,
                      //                     ),
                      //                   ),
                      //                   Gap(20.h),
                      //                   if (controller
                      //                               .homeDetails!['deductible']
                      //                           ['All Perils'] !=
                      //                       null)
                      //                     _houseItem(
                      //                       key: "All Perils",
                      //                       value: controller
                      //                               .homeDetails!['deductible']
                      //                           ['All Perils'],
                      //                     ),
                      //                   if (controller
                      //                               .homeDetails!['deductible']
                      //                           ['all_other_perils'] !=
                      //                       null)
                      //                     _houseItem(
                      //                       key: "All Other Perils",
                      //                       value: controller
                      //                               .homeDetails!['deductible']
                      //                           ['all_other_perils'],
                      //                     ),
                      //                   if (controller
                      //                               .homeDetails!['deductible']
                      //                           ['windstorm_or_hail'] !=
                      //                       null)
                      //                     _houseItem(
                      //                       key: "Windstorm Or Hail",
                      //                       value: controller
                      //                               .homeDetails!['deductible']
                      //                           ['windstorm_or_hail'],
                      //                     ),
                      //                 ],
                      //               )),
                      //           ],
                      //         ))
                      //
                      //         // ...List.generate(
                      //         //     controller.homeDetails!['coverages'].length,
                      //         //     (index) {
                      //         //   var coverage =
                      //         //       controller.homeDetails!['coverages'][index];
                      //         //   return ShadowContainer(
                      //         //       child: Column(
                      //         //     crossAxisAlignment: CrossAxisAlignment.start,
                      //         //     children: [
                      //         //       Text(
                      //         //         coverage['full_address'],
                      //         //         style: Get.textTheme.titleMedium
                      //         //             ?.copyWith(
                      //         //                 fontSize: 18.sp,
                      //         //                 fontWeight: FontWeight.w600,
                      //         //                 color: AppColors.primaryDark),
                      //         //       ),
                      //         //       Gap(8.h),
                      //         //       Image.asset(
                      //         //         ImagePaths.house,
                      //         //       ),
                      //         //       Gap(8.h),
                      //         //       _houseItem(
                      //         //         key: "PACKAGE-COVE-PERSONAL LIABILITY",
                      //         //         value: "\$1,000,000",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "PACKAGE - COVF-GUEST MEDICAL",
                      //         //         value: "\$1,000",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "LOSS OF USE",
                      //         //         value: "10%",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "ALE TERM",
                      //         //         value: "24 MONTHS",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "IDENTITY FRAUD EXPENSE",
                      //         //         value: "\$28,500",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "SEWER & DRAIN DAMAGE-HIGHER LIMITS",
                      //         //         value: "\$25,000",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "FENCES",
                      //         //         value: "COVERED",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "PERSONAL PROP",
                      //         //         value: "40%",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "CONTENTS REPLACEMENT COST",
                      //         //         value: "YES",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "SEP STRUCTURES",
                      //         //         value: "59%",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "PACKAGE - CVGA-DWELLING",
                      //         //         value: "\$609,000",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key:
                      //         //             "SPECIAL LIMITS ON PERSONAL PROPERTY",
                      //         //         value: "COVERED",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "EXTENDED REPLACEMENT COST",
                      //         //         value: "150%",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "SERVICE LINE",
                      //         //         value: "\$10,000",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "LIMITED PLUMBING SYSTEM REPAIR",
                      //         //         value: "\$1,000",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "PERSONALS INJURY",
                      //         //         value: "COVERED",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "RESIDENCE GLASS",
                      //         //         value: "COVERED",
                      //         //       ),
                      //         //       _houseItem(
                      //         //         key: "EXTENDED ACCES",
                      //         //         value: "COVERED",
                      //         //       ),
                      //         //       Gap(12.h),
                      //         //       SecondryButton(
                      //         //           onTap: () {
                      //         //             Get.toNamed(Routes.MY_FAMILY);
                      //         //           },
                      //         //           buttonText: "Manage Homes"),
                      //         //     ],
                      //         //   ));
                      //         // }),
                      //       ],
                      //     ),
                      // if (controller.type.value == 1) _policyDocuments(context),
                      // Gap(22.h),
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
                    GestureDetector(
                      onTap: () {
                        controller.viewDocumentAPI(doc['docId']);
                      },
                      child: Container(
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
