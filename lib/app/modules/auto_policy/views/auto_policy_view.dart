import 'package:american_mile/app/modules/auto_policy/views/view_auto_policy.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/icon_button.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/request_change.dart';
import '../../../../core/components/secondry_button.dart';
import '../../../../core/utils/divider.dart';
import '../../../../core/utils/index.dart';
import '../controllers/auto_policy_controller.dart';

class AutoPolicyView extends GetView<AutoPolicyController> {
  const AutoPolicyView({Key? key}) : super(key: key);

  /// =========================

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
                      " Add Auto Policy ",
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: const MyAppBar(title: 'Auto Policy Details'),
                        ),
                        Gap(15.h),
                        autoPolicyDetails(context),
                        Gap(45.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  controller.autoDetails!['data']['vehicles']
                                      .length, (index) {
                                var car = controller.autoDetails!['data']
                                    ['vehicles'][index];

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ViewAutoPolicy(
                                      details: controller.autoDetails!['data']
                                          ['vehicles'][index],
                                    ));
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${car['year']} ${car['make']} ${car['model']}",
                                              style: Get.textTheme.titleMedium
                                                  ?.copyWith(
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
                                        height: 1,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      Gap(15.h),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  _containerItem({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              key,
              style: Get.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  fontFamily: "Poppins"),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: Get.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 10.sp,
                  fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );
  }

  autoPolicyDetails(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.autoDetails!['data']['car_policy_data'][0]['name'],
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
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
                      "EFFECTIVE DATE",
                      style: Get.textTheme.titleMedium?.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      controller.autoDetails!['data']['car_policy_data'][0]
                              ['description']
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
                      controller.autoDetails!['data']['car_policy_data'][0]
                          ['expiry_date'],
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
                      controller.autoDetails!['data']['car_policy_data'][0]
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
                      "\$${controller.autoDetails!['data']['car_policy_data'][0]['total_premium_usd']}",
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
          Row(
            children: [
              SecondryButton(
                  onTap: () {
                    controller.type.value = !controller.type.value;
                    controller.typeOne.value = false;
                  },
                  height: 40.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                  ),
                  buttonText: 'Current ID Cards'),
              Gap(15.h),
              SecondryButton(
                  onTap: () {
                    controller.typeOne.value = !controller.typeOne.value;
                    controller.type.value = false;
                  },
                  height: 40.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                  ),
                  buttonText: 'Policy Documents'),
            ],
          ),
          Gap(20.h),
          if (controller.type.value == true) _autoIdCards(context),
          if (controller.typeOne.value == true) _autoDocuments(context),
          Gap(10.h),
          Container(
            height: 0.5,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            color: Colors.grey.withOpacity(0.6),
          ),
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
                    Get.offAllNamed(Routes.HOME, arguments: "auto");
                  },
                  height: 40.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                  ),
                  buttonText: 'Manage Vehicles'),
            ],
          ),
          Gap(30.h),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Obx(
  //     () => Scaffold(
  //       backgroundColor: AppColors.background,
  //       body: controller.isLoading.value == true
  //           ? showProgressIndicator()
  //           : SingleChildScrollView(
  //               padding: EdgeInsets.symmetric(vertical: 15.w),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.symmetric(horizontal: 15.w),
  //                     child: const MyAppBar(title: 'Auto Policy Details'),
  //                   ),
  //                   Gap(40.h),
  //                   SingleChildScrollView(
  //                     scrollDirection: Axis.horizontal,
  //                     child: Row(
  //                       children: [
  //                         Gap(15.w),
  //                         ShadowContainer(
  //                           width: context.width * .75,
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 "Named Insured",
  //                                 style: Get.textTheme.titleMedium?.copyWith(
  //                                   fontWeight: FontWeight.w600,
  //                                   fontSize: 18.sp,
  //                                 ),
  //                               ),
  //                               ...List.generate(
  //                                   controller
  //                                       .autoDetails!['data']['named_insureds']
  //                                       .length, (index) {
  //                                 return Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     Gap(6.h),
  //                                     Text(
  //                                       "NAMED INSURED",
  //                                       style:
  //                                           Get.textTheme.bodyMedium?.copyWith(
  //                                         fontSize: 12.sp,
  //                                       ),
  //                                     ),
  //                                     Gap(6.h),
  //                                     Text(
  //                                       controller.autoDetails!['data']
  //                                           ['named_insureds'][index],
  //                                       style:
  //                                           Get.textTheme.titleMedium?.copyWith(
  //                                         fontWeight: FontWeight.w600,
  //                                         fontSize: 16.sp,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 );
  //                               }),
  //                             ],
  //                           ),
  //                         ),
  //                         Gap(15.w),
  //                         Container(
  //                           width: context.width * .75,
  //                           padding: EdgeInsets.only(
  //                             top: 20.h,
  //                             bottom: 20.h,
  //                             left: 20.h,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(
  //                               20.r,
  //                             ),
  //                             color: AppColors.white,
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: AppColors.shadowColor,
  //                                 blurRadius: 10.w,
  //                                 offset: Offset(
  //                                   0,
  //                                   3.h,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Drivers",
  //                                     style:
  //                                         Get.textTheme.titleMedium?.copyWith(
  //                                       fontWeight: FontWeight.w600,
  //                                       fontSize: 18.sp,
  //                                     ),
  //                                   ),
  //                                   GestureDetector(
  //                                       onTap: () {
  //                                         Get.toNamed(Routes.MY_FAMILY);
  //                                       },
  //                                       child: const RequestChange(
  //                                         title: 'Manage Driver',
  //                                       )),
  //                                 ],
  //                               ),
  //                               ...List.generate(
  //                                   controller
  //                                       .autoDetails!['data']['driver_data']
  //                                       .length, (index) {
  //                                 var driver = controller.autoDetails!['data']
  //                                     ['driver_data'][index];
  //                                 return Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     Text(
  //                                       "DRIVERS",
  //                                       style:
  //                                           Get.textTheme.bodyMedium?.copyWith(
  //                                         fontSize: 12.sp,
  //                                       ),
  //                                     ),
  //                                     Gap(6.h),
  //                                     Text(
  //                                       driver['name'],
  //                                       style:
  //                                           Get.textTheme.titleMedium?.copyWith(
  //                                         fontWeight: FontWeight.w600,
  //                                         fontSize: 16.sp,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 );
  //                               }),
  //                             ],
  //                           ),
  //                         ),
  //                         Gap(15.w),
  //                         Container(
  //                           width: context.width * .75,
  //                           padding: EdgeInsets.only(
  //                             top: 20.h,
  //                             bottom: 20.h,
  //                             left: 20.h,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(
  //                               20.r,
  //                             ),
  //                             color: AppColors.white,
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: AppColors.shadowColor,
  //                                 blurRadius: 10.w,
  //                                 offset: Offset(
  //                                   0,
  //                                   3.h,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Addresses",
  //                                     style:
  //                                         Get.textTheme.titleMedium?.copyWith(
  //                                       fontWeight: FontWeight.w600,
  //                                       fontSize: 18.sp,
  //                                     ),
  //                                   ),
  //                                   GestureDetector(
  //                                       onTap: () {
  //                                         Get.toNamed(Routes.MY_FAMILY);
  //                                       },
  //                                       child: const RequestChange(
  //                                         title: 'Manage Homes',
  //                                       )),
  //                                 ],
  //                               ),
  //                               Text(
  //                                 "ADDRESS",
  //                                 style: Get.textTheme.bodyMedium?.copyWith(
  //                                   fontSize: 12.sp,
  //                                 ),
  //                               ),
  //                               Gap(6.h),
  //                               Text(
  //                                 controller.autoDetails!['data']['address'],
  //                                 style: Get.textTheme.titleMedium?.copyWith(
  //                                   fontWeight: FontWeight.w600,
  //                                   fontSize: 16.sp,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         Gap(15.w),
  //                       ],
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.symmetric(horizontal: 15.w),
  //                     child: Column(
  //                       children: [
  //                         Gap(40.h),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             GestureDetector(
  //                               onTap: () {
  //                                 controller.type.value = 0;
  //                               },
  //                               child: Text(
  //                                 "DETAILS",
  //                                 style: Get.textTheme.titleMedium?.copyWith(
  //                                   fontWeight: FontWeight.w600,
  //                                   height: 1.4,
  //                                   color: controller.type.value == 0
  //                                       ? AppColors.primaryDark
  //                                       : AppColors.textLight,
  //                                   fontSize: 18.sp,
  //                                 ),
  //                               ),
  //                             ),
  //                             GestureDetector(
  //                               onTap: () {
  //                                 controller.type.value = 1;
  //                               },
  //                               child: Text(
  //                                 "ID CARDS",
  //                                 style: Get.textTheme.titleMedium?.copyWith(
  //                                   fontWeight: FontWeight.w600,
  //                                   height: 1.4,
  //                                   color: controller.type.value == 1
  //                                       ? AppColors.primaryDark
  //                                       : AppColors.textLight,
  //                                   fontSize: 18.sp,
  //                                 ),
  //                               ),
  //                             ),
  //                             GestureDetector(
  //                               onTap: () {
  //                                 controller.type.value = 2;
  //                               },
  //                               child: Text(
  //                                 "DOCUMENTS",
  //                                 style: Get.textTheme.titleMedium?.copyWith(
  //                                   fontWeight: FontWeight.w600,
  //                                   height: 1.4,
  //                                   color: controller.type.value == 2
  //                                       ? AppColors.primaryDark
  //                                       : AppColors.textLight,
  //                                   fontSize: 18.sp,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Gap(40.h),
  //                         controller.type.value == 0
  //                             ? _autoDetails(context)
  //                             : controller.type.value == 1
  //                                 ? _autoIdCards(context)
  //                                 : _autoDocuments(context),
  //                         Gap(40.h),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //     ),
  //   );
  // }
  //
  _autoDocuments(BuildContext context) {
    return Column(
      children: List.generate(
          controller.autoDetails!['data']['auto_id_doc'].length, (index) {
        var doc = controller.autoDetails!['data']['auto_id_doc'][index];
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
                        controller.viewDocumentAPI(doc['doc_id']);
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
                  doc['doc_type'],
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

  _autoIdCards(BuildContext context) {
    return Column(
      children: [
        _idCardItem(context),
      ],
    );
  }

  _idCardItem(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          ...List.generate(
              controller.autoDetails!['data']['auto_id_cards'].length, (index) {
            var idCard =
                controller.autoDetails!['data']['auto_id_cards'][index];
            return Column(
              children: [
                ShadowContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PROOF OF COVERAGE',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        'CURRENT',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                      Gap(10.h),
                      Text(
                        'EFFECTIVE DATE',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        idCard['effective_date'],
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      Gap(10.h),
                      Text(
                        'EXPIRATION DATE',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        idCard['expiry_date'],
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      Gap(10.h),
                      Text(
                        'VEHICLES',
                        style: Get.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(4.h),
                      ...List.generate(
                          idCard['vehiclename'].length,
                          (index) => Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 6.h),
                                    child: Text(
                                      idCard['vehiclename'][index],
                                      style:
                                          Get.textTheme.titleMedium?.copyWith(
                                        fontSize: 12.sp,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                      Gap(10.h),
                      if (idCard['fax'] == null) ...[
                        Text(
                          'EVIDENCE OF INSURANCE',
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'EVIDENCE OF INSURANCE',
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(20.h),
                        _pdfComponent(context, 'Paper Size', onTap: () {
                          controller.viewDocumentAPI(idCard['papersize']);
                        }),
                      ],
                      if (idCard['fax'] != null) ...[
                        Text(
                          'ID CARD',
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'DOWNLOAD/PRINT',
                          style: Get.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(14.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  _pdfComponent(context, 'Wallet Size',
                                      onTap: () {
                                    controller
                                        .viewDocumentAPI(idCard['walletsize']);
                                  }),
                                  Gap(14.h),
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
                                  _pdfComponent(context, 'Paper Size',
                                      onTap: () {
                                    controller
                                        .viewDocumentAPI(idCard['papersize']);
                                  }),
                                  Gap(14.h),
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
                    ],
                  ),
                ),
                Gap(20.h),
              ],
            );
          }),

          // controller.autoDetails!['data']['auto_id_cards']['doc_type'] !=
          //         'INSURANCE_ID_CARD'
          //     ? ShadowContainer(
          //         child: Column(
          //           children: [
          //             Text(
          //               controller.autoDetails!['data']['auto_id_cards']
          //                   ['title'],
          //               style: Get.textTheme.titleMedium?.copyWith(
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 14.sp,
          //               ),
          //             ),
          //             Gap(10.h),
          //             Text(
          //               controller.autoDetails!['data']['auto_id_cards']
          //                   ['desc'],
          //               style: Get.textTheme.titleMedium?.copyWith(
          //                 fontSize: 12.sp,
          //               ),
          //             ),
          //             Gap(10.h),
          //             _pdfComponent(
          //               context,
          //               'Paper Size',
          //               onTap: (){
          //                 controller.viewDocumentAPI(controller.autoDetails!['data']['auto_id_cards']['docid']);
          //               }
          //             ),
          //             // Row(
          //             //   children: [
          //             //     Expanded(
          //             //       child: Column(
          //             //         children: [
          //             //           _pdfComponent(
          //             //             context,
          //             //             'Paper Size',
          //             //           ),
          //             //           Gap(12.h),
          //             //           Text(
          //             //             '2019 LAND ROVER RANGE\nROVER SPORT 4D 4X4 LUX',
          //             //             textAlign: TextAlign.center,
          //             //             style: Get.textTheme.bodySmall?.copyWith(
          //             //               fontSize: 8.sp,
          //             //             ),
          //             //           )
          //             //         ],
          //             //       ),
          //             //     ),
          //             //     Gap(20.w),
          //             //     Expanded(
          //             //       child: Column(
          //             //         children: [
          //             //           _pdfComponent(
          //             //             context,
          //             //             'Paper Size',
          //             //           ),
          //             //           Gap(12.h),
          //             //           Text(
          //             //             '2016 JEEP GRAND CHEROKEE\n4D 4X4 LIMITED',
          //             //             textAlign: TextAlign.center,
          //             //             style: Get.textTheme.bodySmall?.copyWith(
          //             //               fontSize: 8.sp,
          //             //             ),
          //             //           )
          //             //         ],
          //             //       ),
          //             //     ),
          //             //   ],
          //             // ),
          //           ],
          //         ),
          //       )
          //     : ShadowContainer(
          //         child: Column(
          //           children: [
          //             Text(
          //               "ID CARD",
          //               style: Get.textTheme.titleMedium?.copyWith(
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 14.sp,
          //               ),
          //             ),
          //             Gap(10.h),
          //             Text(
          //               "DOWNLOAD/PRINT",
          //               style: Get.textTheme.titleMedium?.copyWith(
          //                 fontSize: 12.sp,
          //               ),
          //             ),
          //             Gap(10.h),
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Column(
          //                     children: [
          //                       _pdfComponent(
          //                         context,
          //                         'Paper Size',
          //                       ),
          //                       Gap(12.h),
          //                       AppIconButton(
          //                         buttonText: "Fax",
          //                         icon: ImagePaths.fax,
          //                         onTap: () {},
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 Gap(20.w),
          //                 Expanded(
          //                   child: Column(
          //                     children: [
          //                       _pdfComponent(
          //                         context,
          //                         'Paper Size',
          //                       ),
          //                       Gap(12.h),
          //                       AppIconButton(
          //                         buttonText: "Mail",
          //                         icon: ImagePaths.mail,
          //                         onTap: () {},
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),

          // ShadowContainer(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "PROOF OF COVERAGE",
          //         style: Get.textTheme.titleMedium?.copyWith(
          //           fontWeight: FontWeight.w600,
          //           fontSize: 14.sp,
          //         ),
          //       ),
          //       Gap(4.h),
          //       Text(
          //         "RENEWAL",
          //         style: Get.textTheme.titleMedium?.copyWith(
          //           fontSize: 10.sp,
          //         ),
          //       ),
          //       Gap(10.h),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "EFFECTIVE DATE",
          //                 style: Get.textTheme.titleMedium?.copyWith(
          //                   fontSize: 12.sp,
          //                 ),
          //               ),
          //               Gap(6.h),
          //               Text(
          //                 controller.autoDetails!['data']['auto_id_cards']
          //                     ['effective_date'],
          //                 style: Get.textTheme.titleMedium?.copyWith(
          //                   fontSize: 12.sp,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "EXPIRATION DATE",
          //                 style: Get.textTheme.titleMedium?.copyWith(
          //                   fontSize: 12.sp,
          //                 ),
          //               ),
          //               Gap(6.h),
          //               Text(
          //                 controller.autoDetails!['data']['auto_id_cards']
          //                     ['expiry_date'],
          //                 style: Get.textTheme.titleMedium?.copyWith(
          //                   fontSize: 12.sp,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Gap(70.w),
          //         ],
          //       ),
          //       Gap(10.h),
          //       Text(
          //         "VEHICLES",
          //         style: Get.textTheme.titleMedium?.copyWith(
          //           fontWeight: FontWeight.w600,
          //           fontSize: 14.sp,
          //         ),
          //       ),
          //       Gap(8.h),
          //       ...List.generate(
          //           controller.autoDetails!['data']['auto_id_cards']['vehicles']
          //               .length, (index) {
          //         var item = controller.autoDetails!['data']['auto_id_cards']
          //             ['vehicles'][index];
          //         return Padding(
          //           padding: EdgeInsets.only(bottom: 6.h),
          //           child: Text(
          //             "${item['year']} ${item['make']} ${item['model']}\n${item['vin_number']}",
          //             style: Get.textTheme.titleMedium?.copyWith(
          //               fontSize: 12.sp,
          //               height: 1.3,
          //             ),
          //           ),
          //         );
          //       }),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  _pdfComponent(BuildContext context, String text,
      {void Function()? onTap, double? width}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? context.width,
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
              Text(
                controller.autoDetails!['data']['car_policy_data'][0]['name'],
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
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
                controller.autoDetails!['data']['car_policy_data'][0]
                    ['description'],
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
              Text(
                "EXPIRATION DATE",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(10.h),
              Text(
                controller.autoDetails!['data']['car_policy_data'][0]
                    ['expiry_date'],
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
              // Text(
              //   '**** 7555 Bank Account',
              //   style: Get.textTheme.bodySmall?.copyWith(
              //     color: AppColors.textLight,
              //   ),
              // ),
              // Gap(10.h),
              Text(
                "NEXT RENEWAL DATE",
                style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(10.h),
              Text(
                controller.autoDetails!['data']['car_policy_data'][0]
                    ['renewal_date'],
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
                "\$${controller.autoDetails!['data']['car_policy_data'][0]['total_premium_usd']}",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecondryButton(
                        onTap: () {
                          controller.type.value = !controller.type.value;
                        },
                        buttonText: 'Current ID Cards'),
                    Gap(15.h),
                    SecondryButton(
                        onTap: () {
                          controller.typeOne.value = !controller.typeOne.value;
                        },
                        buttonText: 'Policy Documents'),
                  ],
                ),
              ),
              Gap(20.h),
            ],
          ),
        ),
        Gap(40.h),
        ...List.generate(controller.autoDetails!['data']['vehicles'].length,
            (index) {
          return _carDetails(context,
              carImage: ImagePaths.car2,
              car: controller.autoDetails!['data']['vehicles'][index]);
        }),
        Gap(40.h),
      ],
    );
  }

  _carDetails(
    BuildContext context, {
    required String carImage,
    required Map<String, dynamic> car,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: ShadowContainer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${car['year']} ${car['make']} ${car['model']}",
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
              InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.CAR_DASHBOARD,
                    arguments: {
                      "id": car['vehicleid'],
                      "type": "1",
                    },
                  );
                },
                child: Container(
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
                ),
              )
            ],
          ),
          Text(
            "VIN #${car['vin_number']}",
            style: Get.textTheme.titleMedium
                ?.copyWith(fontSize: 14.sp, color: AppColors.textLight),
          ),
          Gap(12.h),
          // _carItem(key: "ACCIDENT FORGIVENESS", value: "YES"),
          _carItem(key: "BODILY INJURY", value: car['bodily_injury']),
          _carItem(key: "PROPERTY DAMAGE", value: car['proper_damage']),
          _carItem(key: "UNINSURED MOTORIST", value: car['unnisured_motorist']),
          _carItem(
              key: "UNDERINSURED MOTORIST",
              value: car['underinsured_motorist']),
          _carItem(
              key: "SAFETY GLASS-WAIVER OF DEDUCTIBLE",
              value: car['safety_glass']),
          _carItem(key: "COMPREHENSIVE", value: car['comprehensiv']),
          _carItem(key: "COLLISION", value: car['collision']),
          _carItem(
              key: "ENHANCED ROADSIDE AND RIDE ASSISTANCE",
              value: car['roadside_ride']),
          // _carItem(key: "NEW ORIGINAL PARTS", value: "NA"),
          // _carItem(key: "VECHILE REPLACEMENT PLUS", value: "NA"),
        ],
      )),
    );
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
