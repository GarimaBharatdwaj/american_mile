import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/components/profile_image_circle.dart';
import 'package:american_mile/core/components/rect_icon.dart';
import 'package:american_mile/core/components/secondry_button.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../../../core/helpers/device_helper.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavIndex = 0;
    final iconList = <IconData>[
      Icons.home,
      Icons.brightness_4,
      Icons.brightness_6,
      Icons.person,
    ];
    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldkey,
        // drawer: controller.isLoading.value == true
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
        //                 Get.close(1);
        //                 Get.toNamed(Routes.USER_PROFILE)?.then((value) {
        //                   if (value) {
        //                     controller.getUserProfile();
        //                   }
        //                 });
        //               },
        //               child: profileImage(
        //                 imageUrl: controller.userData!['image'],
        //                 circleRadius: 120.r,
        //                 imageSize: 120.w,
        //               ),
        //             ),
        //             Gap(6.h),
        //             Text(
        //               controller.userData!['fullname'],
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
        //               title: "My Profile",
        //               icon: Icons.person,
        //               onTap: () {
        //                 Get.close(1);
        //                 Get.toNamed(Routes.USER_PROFILE)?.then((value) {
        //                   if (value) {
        //                     controller.getUserProfile();
        //                   }
        //                 });
        //               },
        //             ),
        //             _drawerItem(
        //               title: "My Family",
        //               icon: Icons.people_alt_rounded,
        //               onTap: () {
        //                 Get.close(1);
        //                 Get.toNamed(Routes.MY_FAMILY);
        //               },
        //             ),
        //             _drawerItem(
        //               title: "My Cars",
        //               icon: Icons.car_crash,
        //               onTap: () {},
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
        //       ),
        backgroundColor: AppColors.background,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Get.toNamed(Routes.CAR_DASHBOARD),
        //   elevation: 0,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(100),
        //   ),
        //   child: Image.asset(
        //     ImagePaths.carKey,
        //     height: 24,
        //     width: 24,
        //   ),
        // ),
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        //   icons: iconList,
        //   activeIndex: bottomNavIndex,
        //   gapLocation: GapLocation.center,
        //   height: 70,
        //   notchSmoothness: NotchSmoothness.defaultEdge,
        //   leftCornerRadius: 24,
        //   rightCornerRadius: 24,
        //   onTap: (index) {},
        //   //other params
        // ),
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RRectIcon(
                    image: ImagePaths.menu,
                    onTap: () {},
                  ),
                  Expanded(
                    child: Text(
                      AppStrings.insuranceDashboard,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  RRectIcon(
                    image: ImagePaths.menu,
                    onTap: () {},
                  ),
                ],
              ),
              Gap(25.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: context.width,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.secondry,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        DeviceHelper.getUserId() != null
                            ? "Hue Chi"
                            : "Hi User!",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: DeviceHelper.getUserId() == null
                          ? SecondryButton(
                              width: context.width,
                              buttonText: "Sign In",
                              onTap: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                            )
                          : Row(
                              children: [
                                profileImage(
                                  imageUrl:
                                      "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/1.jpg",
                                  circleRadius: 25.r,
                                  imageSize: 75.w,
                                  onTap: () {
                                    Get.toNamed(Routes.SEARCH_BY_VIN);

                                    /// Get.toNamed(Routes.LIFE_POLICY);
                                  },
                                ),
                                Gap(20.w),
                                Expanded(
                                  child: Text(
                                    "Good Morning. Have a nice\nday man",
                                    style: Get.textTheme.titleSmall,
                                  ),
                                )
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              Gap(15.h),
              Text(
                "Drive less then pay less!",
                style: Get.textTheme.titleLarge?.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(15.h),
              _optionWidget(
                title: "Homeowners",
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
                  )),
                  Gap(20.w),
                  Expanded(
                      child: _optionWidget(
                    title: "Pets",
                    image: ImagePaths.pets,
                  )),
                ],
              ),
              Gap(15.h),
              Row(
                children: [
                  Expanded(
                      child: _optionWidget(
                    title: "Business",
                    image: ImagePaths.beg,
                  )),
                  Gap(20.w),
                  Expanded(
                      child: _optionWidget(
                    title: "Life",
                    image: ImagePaths.heart,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _optionWidget({
    required String title,
    required String image,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 28.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          color: AppColors.white,
        ),
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
}
