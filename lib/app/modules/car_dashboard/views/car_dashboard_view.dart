// import 'dart:ui';
// import 'package:american_mile/app/modules/car_dashboard/widgets/speed_meter.dart';
// import 'package:american_mile/app/modules/car_dashboard/widgets/webview.dart';
// import 'package:american_mile/common_lib.dart';
// import 'package:american_mile/core/components/index.dart';
// import 'package:american_mile/core/components/primary_button.dart';
// import 'package:american_mile/core/utils/divider.dart';
// import 'package:american_mile/core/utils/index.dart';
// import 'package:get_storage/get_storage.dart';
// import '../controllers/car_dashboard_controller.dart';
// import 'package:map_launcher/map_launcher.dart';
//
// class CarDashboardView extends GetView<CarDashboardController> {
//   const CarDashboardView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF3E3E3E),
//       body: Obx(() => controller.isLoading.value
//           ? showProgressIndicator()
//           : controller.webUrl != null
//               ? CarDashBoardWebView(
//                   webUrl: controller.webUrl!,
//                   type: controller.argumentsMap['type'],
//                 )
//               : controller.carDashBoardData == null
//                   ? Container()
//                   : SafeArea(
//                       child: SingleChildScrollView(
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: context.height,
//                               width: context.width,
//                               color: const Color(0xFF3E3E3E),
//                             ),
//                             Positioned(
//                               left: 166.w,
//                               top: -90.h,
//                               child: ImageFiltered(
//                                 imageFilter: ImageFilter.blur(
//                                   sigmaX: 30.0,
//                                   sigmaY: 30.0,
//                                 ),
//                                 child: Container(
//                                   height: 200.w,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     gradient: RadialGradient(
//                                       colors: [
//                                         const Color(0xFFED0808)
//                                             .withOpacity(.10),
//                                         const Color(0xFFED0808)
//                                             .withOpacity(.10),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               left: 35.w,
//                               top: -140.h,
//                               child: ImageFiltered(
//                                 imageFilter: ImageFilter.blur(
//                                   sigmaX: 30.0,
//                                   sigmaY: 30.0,
//                                 ),
//                                 child: Container(
//                                   height: 200.w,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     gradient: RadialGradient(
//                                       colors: [
//                                         const Color(0xFFED08A1)
//                                             .withOpacity(.10),
//                                         const Color(0xFFED08A1)
//                                             .withOpacity(.10),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal: 12.w, vertical: 10.h),
//                                   alignment: Alignment.centerLeft,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       RRectIcon(
//                                         backgroundColor: Colors.black,
//                                         image: ImagePaths.arrow,
//                                         onTap: () {
//                                           Get.back();
//                                         },
//                                       ),
//
//                                       /// RRectIcon(
//                                       //   backgroundColor: Colors.black,
//                                       //   image: ImagePaths.menu,
//                                       //   onTap: () {},
//                                       /// ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 Stack(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.symmetric(
//                                           horizontal: 10.w),
//                                       width: context.width,
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(20.r),
//                                         color: AppColors.black,
//                                       ),
//                                       child: Column(
//                                         // mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           _evWidget(context),
//
//                                           ///Gap(180.h),
//                                           Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 50.w),
//                                             child: Text(
//                                               controller.carDashBoardData?[
//                                                   'vehiclename'],
//                                               textAlign: TextAlign.center,
//                                               style: Get.textTheme.titleMedium
//                                                   ?.copyWith(
//                                                 color: AppColors.white,
//                                                 fontSize: 26.sp,
//                                               ),
//                                             ),
//                                           ),
//                                           Gap(30.h),
//
//                                           /// Gap(12.h),
//                                           controller.carDashBoardData?[
//                                                       'tires.passenger_front'] !=
//                                                   null
//                                               ? Gap(730.h)
//                                               : Gap(480.h),
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 120.w,
//                                       top: 120.h,
//                                       child: ImageFiltered(
//                                         imageFilter: ImageFilter.blur(
//                                           sigmaX: 30.0,
//                                           sigmaY: 30.0,
//                                         ),
//                                         child: Container(
//                                           height: 450.w,
//                                           width: 450.w,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             gradient: RadialGradient(
//                                               colors: [
//                                                 const Color(0xFFC908ED)
//                                                     .withOpacity(.10),
//                                                 const Color(0xFFC908ED)
//                                                     .withOpacity(.10),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       right: 120.w,
//                                       top: 20.h,
//                                       child: ImageFiltered(
//                                         imageFilter: ImageFilter.blur(
//                                           sigmaX: 30.0,
//                                           sigmaY: 30.0,
//                                         ),
//                                         child: Container(
//                                           height: 450.w,
//                                           width: 450.w,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             gradient: RadialGradient(
//                                               colors: [
//                                                 const Color(0xFF089DED)
//                                                     .withOpacity(.10),
//                                                 const Color(0xFF089DED)
//                                                     .withOpacity(.10),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                                 /// bottom spacing
//                                 Gap(20.h),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Gap(350.h),
//                                 SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                     children: List.generate(
//                                       controller.dataList.length,
//                                       (index) {
//                                         var item = controller.dataList[index];
//
//                                         return Container(
//                                           padding: EdgeInsets.only(
//                                             right: 25.w,
//                                             left: index == 0 ? 25.w : 0,
//                                           ),
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               controller.isLockList[index] =
//                                                   !controller.isLockList[index];
//
//                                               controller.lockUnlockVehicleAPI(
//                                                   controller.isLockList[index],
//                                                   index);
//                                             },
//                                             child: Obx(() => _borderBox(
//                                                 image: item['image'].toString(),
//                                                 text: item['text'].toString(),
//                                                 isLocked: controller
//                                                     .isLockList[index])),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 Gap(20.h),
//                                 if (controller.carDashBoardData?['odometer'] !=
//                                     null)
//                                   _blueGradientSpeedMeterBox(context),
//                                 Gap(20.h),
//                                 if (controller.carDashBoardData?[
//                                         'tires.passenger_front'] !=
//                                     null)
//                                   _blueGradientTypePressureBox(context),
//                                 Padding(
//                                   padding: const EdgeInsets.all(18.0),
//                                   child: PrimaryButton(
//                                       borderRadius: BorderRadius.circular(15.w),
//                                       buttonText: "Open Map",
//                                       onTap: () async {
//                                         final availableMaps =
//                                             await MapLauncher.installedMaps;
//                                         debugPrint(availableMaps
//                                             .toString()); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]
//                                         await availableMaps.first.showMarker(
//                                           coords: Coords(
//                                               controller.carDashBoardData?[
//                                                   'location.latitude'],
//                                               controller.carDashBoardData?[
//                                                   'location.longitude']),
//                                           title: "Smart car",
//                                         );
//                                       }),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
//     );
//   }
//
//   /// Ev Widget
//   _evWidget(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(
//         20.w,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           evStatusWidget(
//               titleOne: "Lock Reminders",
//               titleTwo: "Fuel Status",
//               percent: controller.carDashBoardData?['fuel.percentRemaining'] ??
//                   "0%"),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (controller.carDashBoardData?['charge.status'] != null)
//                 Row(
//                   children: [
//                     Text(
//                       controller.carDashBoardData?['charge.status'] ?? "",
//                       style: Get.textTheme.labelSmall?.copyWith(
//                         color: AppColors.evGreenColor,
//                       ),
//                     ),
//                     Image.asset(
//                       ImagePaths.evChargingIcon,
//                       width: 22.w,
//                       height: 22.h,
//                     ),
//                   ],
//                 ),
//               Image.asset(
//                 ImagePaths.car2,
//                 width: 115.w,
//                 height: 100.h,
//               ),
//             ],
//           ),
//           evStatusWidget(
//               titleOne: "Guardian Mode",
//               titleTwo: "Oil Life",
//               percent: controller.carDashBoardData?['engine_oil'] ?? "0%")
//         ],
//       ),
//     );
//   }
//
//   Column evStatusWidget(
//       {required String titleOne,
//       required String titleTwo,
//       required String percent}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               titleOne,
//               style: Get.textTheme.labelSmall?.copyWith(
//                 color: AppColors.white,
//               ),
//             ),
//             Icon(
//               Icons.toggle_on_rounded,
//               size: 20.h,
//               color: AppColors.evGreenColor,
//             ),
//           ],
//         ),
//         Gap(12.h),
//         Text(
//           titleTwo,
//           style: Get.textTheme.labelSmall
//               ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
//         ),
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Image.asset(
//               ImagePaths.oilStatus,
//               width: 85.w,
//               height: 85.h,
//             ),
//             Positioned(
//               top: 32.h,
//               child: Text(
//                 percent,
//                 style: Get.textTheme.labelSmall?.copyWith(
//                     color: AppColors.primary,
//                     fontSize: 8.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   _blueGradientSpeedMeterBox(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 20.w),
//           padding: EdgeInsets.all(
//             25.w,
//           ),
//           height: 200.w,
//           width: context.width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20.r),
//             border: Border.all(
//               width: 2.w,
//               color: const Color(0xFF0886CA),
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 const Color(0xFF0886CA).withOpacity(.76),
//                 const Color(0xFF0886CA).withOpacity(.05),
//               ],
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Speed \n& Miles',
//                 style: Get.textTheme.titleMedium?.copyWith(
//                   color: AppColors.primary,
//                   height: 1.4,
//                   fontSize: 18.sp,
//                 ),
//               ),
//               const SpeedMeter(
//                 speed: 30,
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           right: 68.w,
//           bottom: -15.h,
//           child: kiloMetersDriven(
//               kiloMeterDriven: int.parse(controller
//                   .carDashBoardData!['odometer']
//                   .split(' ')[0]
//                   .toString()
//                   .split('.')[0])),
//         ),
//       ],
//     );
//   }
//
//   _blueGradientTypePressureBox(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20.w),
//       padding: EdgeInsets.all(
//         25.w,
//       ),
//       height: 200.w,
//       width: context.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(
//           width: 2.w,
//           color: const Color(0xFF0886CA),
//         ),
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF0886CA).withOpacity(.76),
//             const Color(0xFF0886CA).withOpacity(.05),
//           ],
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Tire \nPressure',
//             style: Get.textTheme.titleMedium?.copyWith(
//               color: AppColors.primary,
//               height: 1.4,
//               fontSize: 18.sp,
//             ),
//           ),
//           Row(
//             children: [
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               _widgetTyre(
//                                   tyrePressure: controller.carDashBoardData?[
//                                           'tires.passenger_front'] ??
//                                       "0"),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 12.w),
//                                 child: Image.asset(
//                                   ImagePaths.chipRoad,
//                                   width: 40.w,
//                                   height: 80.h,
//                                 ),
//                               ),
//                               _widgetTyre(
//                                   tyrePressure: controller.carDashBoardData?[
//                                           'tires.driver_front'] ??
//                                       "0"),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               _widgetTyre(
//                                   tyrePressure: controller.carDashBoardData?[
//                                           'tires.passenger_rear'] ??
//                                       ""),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 12.w),
//                                 child: Image.asset(
//                                   ImagePaths.verRoad,
//                                   // width: 40.w,
//                                   height: 80.h,
//                                 ),
//                               ),
//                               _widgetTyre(
//                                   tyrePressure: controller.carDashBoardData?[
//                                           'tires.driver_rear'] ??
//                                       "0"),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   _widgetTyre({required String tyrePressure}) {
//     return Row(
//       children: [
//         Text(
//           tyrePressure,
//           style: Get.textTheme.titleMedium?.copyWith(
//             color: AppColors.primary,
//             fontSize: 14.sp,
//           ),
//         ),
//         Gap(8.w),
//         Image.asset(
//           ImagePaths.tyre,
//           width: 40.w,
//           height: 20.h,
//         ),
//       ],
//     );
//   }
//
//   _borderBox(
//       {required String image, required String text, required var isLocked}) {
//     return Container(
//       padding: EdgeInsets.all(
//         20.w,
//       ),
//       height: 150.w,
//       width: 150.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(
//           width: 2.w,
//           color: AppColors.white,
//         ),
//         gradient: isLocked
//             ? LinearGradient(
//                 colors: [
//                   const Color(0xFF0886CA).withOpacity(.76),
//                   const Color(0xFF0886CA).withOpacity(.05),
//                 ],
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//               )
//             : LinearGradient(
//                 colors: [
//                   AppColors.white.withOpacity(.76),
//                   AppColors.white.withOpacity(.05),
//                 ],
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//               ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.asset(
//                 image,
//                 height: 45.w,
//                 width: 35.w,
//                 color: AppColors.white,
//               ),
//               if (isLocked)
//                 Icon(
//                   Icons.check_circle,
//                   color: AppColors.white,
//                   size: 44.h,
//                 ),
//             ],
//           ),
//           Gap(6.h),
//           Text(
//             text,
//             style: Get.textTheme.titleMedium?.copyWith(
//               color: AppColors.white,
//               fontSize: 18.sp,
//               height: 1.44,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

///===============================
import 'package:american_mile/app/modules/car_dashboard/controllers/car_dashboard_controller.dart';
import 'package:american_mile/app/modules/car_dashboard/widgets/speed_meter.dart';
import 'package:american_mile/app/modules/car_dashboard/widgets/webview.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/helpers/image_paths.dart';
import 'package:american_mile/core/utils/app_colors.dart';
import '../../../../core/utils/divider.dart';

class CarDashboardView extends GetView<CarDashboardController> {
  const CarDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () => controller.isLoading.value
            ? showProgressIndicator()
            : controller.webUrl != null
                ? CarDashBoardWebView(
                    webUrl: controller.webUrl!,

                    ///type: controller.argumentsMap?['type'],
                  )
                : controller.carDashBoardData == null
                    ? Container()
                    : SafeArea(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.w, right: 4.w, bottom: 5.h),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RRectIcon(
                                      backgroundColor:
                                          AppColors.primary.withOpacity(0.2),
                                      image: ImagePaths.arrow,
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Obx(
                                      () => Row(
                                        children: [
                                          ...List.generate(
                                              controller
                                                  .familyDetails?['vehicles']
                                                  .length, (index) {
                                            var vehicle = controller
                                                    .familyDetails?['vehicles']
                                                [index];

                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.selectedIndex
                                                      .value = index;

                                                  controller
                                                      .getCarDashBoardData(
                                                          id: vehicle['id']);
                                                },
                                                child: Chip(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5.r))),
                                                  side: BorderSide.none,
                                                  elevation: 1,
                                                  avatar: Icon(
                                                    Icons.drive_eta,
                                                    size: 18.h,
                                                    color: controller
                                                                .selectedIndex
                                                                .value ==
                                                            index
                                                        ? AppColors.white
                                                        : AppColors.primary,
                                                  ),
                                                  labelStyle: Get
                                                      .textTheme.labelMedium
                                                      ?.copyWith(
                                                    color: controller
                                                                .selectedIndex
                                                                .value ==
                                                            index
                                                        ? AppColors.white
                                                        : AppColors.primary,
                                                    fontSize: 10,
                                                  ),
                                                  label: Text(
                                                    "${vehicle['year']} ${vehicle['make']} ${vehicle['model']}"
                                                        .toUpperCase(),
                                                  ),
                                                  backgroundColor: controller
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? AppColors.primary
                                                      : AppColors.white,
                                                ),
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    )),
                                Card(
                                  color: AppColors.white,
                                  elevation: 1,
                                  child: Column(
                                    children: [
                                      Gap(25.h),
                                      _evWidget(context),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.w),
                                        child: Text(
                                          controller.carDashBoardData?[
                                                  'vehiclename'] ??
                                              "Range Rover",
                                          textAlign: TextAlign.center,
                                          style: Get.textTheme.titleMedium
                                              ?.copyWith(
                                            color: AppColors.primary,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 26.sp,
                                          ),
                                        ),
                                      ),
                                      Gap(25.h),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: List.generate(
                                            controller.dataList.length,
                                            (index) {
                                              var item =
                                                  controller.dataList[index];

                                              return Container(
                                                padding: EdgeInsets.only(
                                                  right: 20.w,
                                                  left: index == 0 ? 20.w : 0,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (index == 0) {
                                                      controller.isLockList[
                                                              index] =
                                                          !controller
                                                                  .isLockList[
                                                              index];

                                                      controller
                                                          .lockUnlockVehicleAPI(
                                                              controller
                                                                      .isLockList[
                                                                  index],
                                                              index,
                                                              controller
                                                                  .tempId);
                                                    }
                                                  },
                                                  child: Obx(() => _borderBox(
                                                      image: item['image']
                                                          .toString(),
                                                      text: item['text']
                                                          .toString(),
                                                      isLocked: controller
                                                          .isLockList[index])),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Gap(25.h),

                                      ///if (controller.carDashBoardData?['odometer'] != null)
                                      _blueGradientSpeedMeterBox(context),

                                      Gap(20.h),

                                      /// if (controller.carDashBoardData?['tires.passenger_front'] !=
                                      ///     null)
                                      _blueGradientTypePressureBox(context),
                                      Gap(25.h),
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

  _blueGradientTypePressureBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(
        25.w,
      ),
      height: 200.w,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 2.w,
          color: const Color(0xFF0886CA),
        ),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0886CA).withOpacity(.76),
            const Color(0xFF0886CA).withOpacity(.05),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tire \nPressure',
            style: Get.textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
              height: 1.4,
              fontSize: 17.sp,
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _widgetTyre(
                                  tyrePressure: controller.carDashBoardData?[
                                          'tires.passenger_front'] ??
                                      "0"),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Image.asset(
                                  ImagePaths.chipRoad,
                                  width: 40.w,
                                  height: 80.h,
                                ),
                              ),
                              _widgetTyre(
                                  tyrePressure: controller.carDashBoardData?[
                                          'tires.driver_front'] ??
                                      "0"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _widgetTyre(
                                  tyrePressure: controller.carDashBoardData?[
                                          'tires.passenger_rear'] ??
                                      "0"),
                              Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Image.asset(
                                  ImagePaths.verRoad,
                                  // width: 40.w,
                                  height: 80.h,
                                ),
                              ),
                              _widgetTyre(
                                  tyrePressure: controller.carDashBoardData?[
                                          'tires.driver_rear'] ??
                                      "0"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _widgetTyre({required String tyrePressure}) {
    return Row(
      children: [
        Text(
          tyrePressure,
          style: Get.textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontSize: 13.sp,
          ),
        ),
        Gap(8.w),
        Image.asset(
          ImagePaths.tyre,
          width: 40.w,
          height: 20.h,
        ),
      ],
    );
  }

  _blueGradientSpeedMeterBox(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(
            20.w,
          ),
          height: 200.w,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              width: 2.w,
              color: const Color(0xFF0886CA),
            ),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF0886CA).withOpacity(.76),
                const Color(0xFF0886CA).withOpacity(.05),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Speed \n& Miles',
                style: Get.textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  height: 1.4,
                  fontSize: 18.sp,
                ),
              ),
              const SpeedMeter(
                speed: 30,
              ),
            ],
          ),
        ),
        Positioned(
          right: 68.w,
          bottom: -15.h,
          child: kiloMetersDriven(
              kiloMeterDriven: int.parse(controller
                      .carDashBoardData?['odometer']
                      .split(' ')[0]
                      .toString()
                      .split('.')[0] ??
                  "1213")),
        ),
      ],
    );
  }

  _borderBox(
      {required String image, required String text, required var isLocked}) {
    return Container(
      padding: EdgeInsets.all(
        15.w,
      ),
      height: 145.w,
      width: 145.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 2.w,
          color: AppColors.primary,
        ),
        gradient: isLocked
            ? LinearGradient(
                colors: [
                  const Color(0xFF0886CA).withOpacity(.76),
                  const Color(0xFF0886CA).withOpacity(.05),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
            : LinearGradient(
                colors: [
                  AppColors.white.withOpacity(.76),
                  AppColors.white.withOpacity(.05),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                height: 40.w,
                width: 30.w,
                color: isLocked ? AppColors.white : AppColors.primary,
              ),
              if (isLocked)
                Icon(
                  Icons.check_circle,
                  color: AppColors.white,
                  size: 40.h,
                ),
            ],
          ),
          Gap(4.h),
          Text(
            text,
            style: Get.textTheme.titleMedium?.copyWith(
              color: isLocked ? AppColors.white : AppColors.primary,
              fontSize: 18.sp,
              height: 1.44,
            ),
          ),
        ],
      ),
    );
  }

  /// Ev Widget
  _evWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        evStatusWidget(
            titleOne: "Lock Reminders",
            titleTwo: "Fuel Status",
            percent:
                controller.carDashBoardData?['fuel.percentRemaining'] ?? "0%"),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (controller.carDashBoardData?['charge.status'] != null)
              Row(
                children: [
                  Text(
                    controller.carDashBoardData?['charge.status'] ?? "",
                    style: Get.textTheme.labelSmall?.copyWith(
                      color: AppColors.evGreenColor,
                    ),
                  ),
                  Image.asset(
                    ImagePaths.evChargingIcon,
                    width: 22.w,
                    height: 22.h,
                  ),
                ],
              ),
            Image.asset(
              ImagePaths.car2,
              width: 115.w,
              height: 115.h,
            ),
          ],
        ),
        evStatusWidget(
            titleOne: "Guardian Mode",
            titleTwo: "Oil Life",
            percent: controller.carDashBoardData?['engine_oil'] ?? "0%")
      ],
    );
  }

  /// Ev Status
  Column evStatusWidget(
      {required String titleOne,
      required String titleTwo,
      required String percent}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titleOne,
              style: Get.textTheme.labelSmall?.copyWith(
                color: AppColors.primary,
              ),
            ),
            Icon(
              Icons.toggle_on_rounded,
              size: 20.h,
              color: AppColors.evGreenColor,
            ),
          ],
        ),
        Gap(12.h),
        Text(
          titleTwo,
          style: Get.textTheme.labelSmall
              ?.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              ImagePaths.oilStatus,
              width: 85.w,
              height: 85.h,
            ),
            Positioned(
              top: 32.h,
              child: Text(
                percent,
                style: Get.textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
