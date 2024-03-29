import 'dart:io';

import 'package:american_mile/app/modules/car_dashboard/controllers/car_dashboard_controller.dart';
import 'package:american_mile/app/modules/car_dashboard/new_car_dashboard_deisgn.dart';
import 'package:american_mile/app/modules/home/componments/my_profile.dart';
import 'package:american_mile/app/modules/home/componments/new_designs/new_profile.dart';
import 'package:american_mile/app/ui/widgets/error_dialog.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/profile_image_circle.dart';
import 'package:american_mile/core/components/rect_icon.dart';
import 'package:american_mile/core/components/secondry_button.dart';
import 'package:american_mile/core/utils/divider.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../../../core/helpers/device_helper.dart';
import '../componments/map.dart';
import '../componments/new_designs/all_policy_dashboard.dart';
import '../componments/policy_home_dashboard.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  getData() {
    controller.bottomNavIndex.value = 3;
    controller.myFamilyAPI();
    controller.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    controller.arguments == "auto" || controller.arguments == "home"
        ? getData()
        : controller.bottomNavIndex.value = 0;
    return Obx(() => WillPopScope(
          onWillPop: () async {
            if (controller.bottomNavIndex.value != 0) {
              controller.bottomNavIndex.value = 0;
              controller.policiesAPI();
              return Future.value(false);
            } else {
              exitAppDialog(message: null, context: context);
              return Future.value(false);
            }
          },
          child: Scaffold(
            appBar: controller.bottomNavIndex.value == 3 && Platform.isIOS
                ? AppBar(
                    elevation: 0,
                    toolbarHeight: 2.h,
                    toolbarOpacity: 0,
                    bottomOpacity: 0,
                    backgroundColor: AppColors.primary,
                  )
                : AppBar(
                    toolbarHeight: 0.h,
                    backgroundColor: AppColors.primary,
                  ),

            /// key: controller.scaffoldkey,

            /// drawer: controller.isLoading.value == true ||
            //         DeviceHelper.getUserId() == null
            //     ? null
            //     : Container(
            //         padding: EdgeInsets.symmetric(
            //           horizontal: 15.w,
            //           vertical: 24.h,
            //         ),
            //         width: context.width * .8,
            //         decoration: BoxDecoration(
            //           color: AppColors.background,
            //           borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(12.r),
            //             bottomRight: Radius.circular(12.r),
            //           ),
            //         ),
            //         child: Column(
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 controller.bottomNavIndex.value = 3;
            //                 Get.close(1);
            //               },
            //               child: profileImage(
            //                 imageUrl: controller.userData?['image'],
            //                 circleRadius: 120.r,
            //                 imageSize: 120.w,
            //               ),
            //             ),
            //             Gap(6.h),
            //             Text(
            //               controller.userData!['fullname'] ?? "Hi User!",
            //               style: Get.textTheme.titleMedium?.copyWith(
            //                 fontWeight: FontWeight.w600,
            //                 fontSize: 18.sp,
            //               ),
            //             ),
            //             Gap(3.h),
            //             Text(
            //               controller.userData!['email'],
            //               style: Get.textTheme.titleMedium?.copyWith(
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 14.sp,
            //               ),
            //             ),
            //             Gap(40.h),
            //             _drawerItem(
            //               title: "My Family",
            //               icon: Icons.people_alt_rounded,
            //               onTap: () {
            //                 Get.close(1);
            //                 Get.toNamed(Routes.MY_FAMILY);
            //               },
            //             ),
            //
            //             /// _drawerItem(
            //             //   title: "My Cars",
            //             //   icon: Icons.car_crash,
            //             //   onTap: () {},
            //             /// ),
            //             _drawerItem(
            //               title: "Update Password",
            //               icon: Icons.password,
            //               onTap: () {
            //                 Get.toNamed(
            //                   Routes.SET_MILE_PASSWORD,
            //                   arguments: controller.userData!['email'],
            //                 );
            //               },
            //             ),
            //             _drawerItem(
            //               title: "Logout",
            //               icon: Icons.logout,
            //               onTap: () {
            //                 DeviceHelper.removeUserId();
            //                 Get.offAllNamed(Routes.LOGIN);
            //               },
            //             ),
            //           ],
            //         ),
            ///       ),
            backgroundColor: AppColors.white,

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: DeviceHelper.getUserId() == null
                ? null
                : FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.CAR_DASHBOARD);
                      // Get.put(CarDashboardController());
                      // Get.to(() => const CarDashboardDesign());
                    },
                    elevation: 2,
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Image.asset(
                      ImagePaths.carKey,
                      height: 24,
                      width: 24,
                    ),
                  ),
            bottomNavigationBar: DeviceHelper.getUserId() == null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SecondryButton(
                          width: context.width,
                          buttonText: "Sign In",
                          onTap: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                        ),
                      ],
                    ),
                  )
                : AnimatedBottomNavigationBar(
                    icons: controller.iconList,
                    activeIndex: controller.bottomNavIndex.value,
                    activeColor: AppColors.white,
                    iconSize: 26.h,
                    gapLocation: GapLocation.center,
                    height: 70.h,
                    notchSmoothness: NotchSmoothness.sharpEdge,
                    leftCornerRadius: 24,
                    rightCornerRadius: 24,
                    backgroundColor: AppColors.primary.withOpacity(0.7),
                    onTap: controller.onBottomTap,
                  ),
            body: controller.isPoliciesLoading.value

                ///controller.isLoading.value || controller.isPoliciesLoading.value
                ? showProgressIndicator()
                : SafeArea(
                    child: SingleChildScrollView(
                      padding: controller.bottomNavIndex.value != 3
                          ? EdgeInsets.all(10.w)
                          : EdgeInsets.all(0.w),
                      child: DeviceHelper.getUserId() != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.bottomNavIndex.value != 3)
                                  Gap(8.h),
                                if (controller.bottomNavIndex.value != 3)
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      /// Opacity(
                                      //   opacity: DeviceHelper.getUserId() == null ? 0 : 1,
                                      //   child: RRectIcon(
                                      //     image: ImagePaths.menu,
                                      //     onTap: () {
                                      //       controller.scaffoldkey.currentState!
                                      //           .openDrawer();
                                      //     },
                                      //   ),
                                      /// ),
                                      Expanded(
                                        child: Text(
                                          controller.getAppBarName(),
                                          textAlign: TextAlign.center,
                                          style: Get.textTheme.titleLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Poppins'),
                                        ),
                                      ),

                                      /// Opacity(
                                      //   opacity: 0,
                                      //   child: RRectIcon(
                                      //     image: ImagePaths.menu,
                                      //     onTap: () {},
                                      //   ),
                                      /// ),
                                    ],
                                  ),
                                controller.bottomNavIndex.value == 1
                                    ? Container()

                                    ///LocationMap()
                                    : controller.bottomNavIndex.value == 2
                                        ? LocationMap()

                                        ///PolicyHomeDashboard()
                                        : controller.bottomNavIndex.value == 3
                                            ? const Profile()

                                            ///MyProfile()
                                            : AllPolicyDashboard()

                                ///_homeWidget(context)
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [_homeWidget(context)],
                            ),
                    ),
                  ),
          ),
        ));
  }

  _optionWidget({
    required String title,
    required String image,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Card(
        color: AppColors.white,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 28.h,
          ),

          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(
          //     20.r,
          //   ),
          //   color: AppColors.white,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 30.w,
                width: 30.w,
              ),
              Gap(4.h),
              Text(
                title,
                style: Get.textTheme.titleMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(4.h),
              Stack(
                children: [
                  Container(
                    height: 4.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      color: AppColors.indicatorBackground,
                    ),
                  ),
                  Container(
                    height: 4.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      color: AppColors.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _drawerItem({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.w,
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25.w,
            ),
            Gap(15.w),
            Text(
              title,
              style: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _homeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(25.h),
        // if (DeviceHelper.getUserId() != null)
        //   Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(
        //         10.r,
        //       ),
        //     ),
        //     child: Column(
        //       children: [
        //         Container(
        //           width: context.width,
        //           alignment: Alignment.centerLeft,
        //           padding: EdgeInsets.symmetric(
        //             horizontal: 30.w,
        //             vertical: 16.h,
        //           ),
        //           decoration: BoxDecoration(
        //             gradient: LinearGradient(
        //               colors: [
        //                 AppColors.primary,
        //                 AppColors.secondry,
        //               ],
        //             ),
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(10.r),
        //               topRight: Radius.circular(10.r),
        //             ),
        //           ),
        //           child: Text(
        //             controller.userData?['name'].toString().split(' ').first ??
        //                 "Hi User!",
        //             textAlign: TextAlign.center,
        //             style: Get.textTheme.titleLarge?.copyWith(
        //               fontWeight: FontWeight.w700,
        //               color: AppColors.white,
        //             ),
        //           ),
        //         ),
        //         Container(
        //           padding: EdgeInsets.symmetric(
        //             horizontal: 30.w,
        //             vertical: 16.h,
        //           ),
        //           decoration: BoxDecoration(
        //             color: AppColors.white,
        //             borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(10.r),
        //               bottomRight: Radius.circular(10.r),
        //             ),
        //           ),
        //           child: Row(
        //             children: [
        //               profileImage(
        //                 imageUrl: controller.userData!['image'],
        //                 circleRadius: 25.r,
        //                 imageSize: 75.w,
        //                 onTap: () {
        //                   controller.bottomNavIndex.value = 3;
        //                 },
        //               ),
        //               Gap(20.w),
        //               Expanded(
        //                 child: Text(
        //                   "Good ${controller.greeting()}. Have a nice\nday man",
        //                   style: Get.textTheme.titleSmall,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        Gap(15.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Drive less then pay less!",
            style: Get.textTheme.titleLarge?.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Gap(25.h),
        _optionWidget(
          title: "Home Owners",
          image: ImagePaths.beg,
          onTap: () {
            Get.toNamed(Routes.INSURANCE_PROVIDER);
          },
        ),
        Gap(15.h),
        Row(
          children: [
            Expanded(
                child: _optionWidget(
                    title: "Auto",
                    image: ImagePaths.car,
                    onTap: () {
                      Get.toNamed(Routes.INSURANCE_PROVIDER);
                    })),
            Gap(20.w),
            Expanded(
                child: _optionWidget(
                    title: "Pets",
                    image: ImagePaths.pets,
                    onTap: () {
                      Get.toNamed(Routes.INSURANCE_PROVIDER);
                    })),
          ],
        ),
        Gap(15.h),
        Row(
          children: [
            Expanded(
                child: _optionWidget(
                    title: "Business",
                    image: ImagePaths.beg,
                    onTap: () {
                      Get.toNamed(Routes.INSURANCE_PROVIDER);
                    })),
            Gap(20.w),
            Expanded(
                child: _optionWidget(
                    title: "Life",
                    image: ImagePaths.heart,
                    onTap: () {
                      Get.toNamed(Routes.INSURANCE_PROVIDER);
                    })),
          ],
        ),
      ],
    );
  }
}
