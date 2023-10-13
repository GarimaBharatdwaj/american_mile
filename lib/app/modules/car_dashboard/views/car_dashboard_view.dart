import 'dart:ui';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';
import '../controllers/car_dashboard_controller.dart';

class CarDashboardView extends GetView<CarDashboardController> {
  const CarDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF3E3E3E),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: context.height,
                width: context.width,
                color: const Color(0xFF3E3E3E),
              ),
              Positioned(
                left: 166.w,
                top: -90.h,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 30.0,
                    sigmaY: 30.0,
                  ),
                  child: Container(
                    height: 200.w,
                    width: 200.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFFED0808).withOpacity(.10),
                          const Color(0xFFED0808).withOpacity(.10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35.w,
                top: -140.h,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 30.0,
                    sigmaY: 30.0,
                  ),
                  child: Container(
                    height: 200.w,
                    width: 200.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFFED08A1).withOpacity(.10),
                          const Color(0xFFED08A1).withOpacity(.10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(200.h),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: context.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.black,
                        ),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Gap(180.h),
                            Text(
                              "Range Rover",
                              style: Get.textTheme.titleMedium?.copyWith(
                                color: AppColors.white,
                                fontSize: 26.sp,
                              ),
                            ),
                            Gap(12.h),
                            Gap(400.h),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 120.w,
                        top: 120.h,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 30.0,
                            sigmaY: 30.0,
                          ),
                          child: Container(
                            height: 450.w,
                            width: 450.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xFFC908ED).withOpacity(.10),
                                  const Color(0xFFC908ED).withOpacity(.10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 120.w,
                        top: 20.h,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 30.0,
                            sigmaY: 30.0,
                          ),
                          child: Container(
                            height: 450.w,
                            width: 450.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xFF089DED).withOpacity(.10),
                                  const Color(0xFF089DED).withOpacity(.10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Gap(420.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.dataList.length,
                        (index) {
                          var item = controller.dataList[index];
                          return Container(
                            padding: EdgeInsets.only(
                              right: 25.w,
                              left: index == 0 ? 25.w : 0,
                            ),
                            child: _borderBox(
                              image: item['image'],
                              text: item['text'],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Gap(20.h),
                  _blueGradientTypePressureBox(context),
                ],
              ),
            ],
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
              fontSize: 18.sp,
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
                              _widgetTyre(),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Image.asset(
                                  ImagePaths.chipRoad,
                                  width: 40.w,
                                  height: 80.h,
                                ),
                              ),
                              _widgetTyre(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _widgetTyre(),
                              Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Image.asset(
                                  ImagePaths.verRoad,
                                  // width: 40.w,
                                  height: 80.h,
                                ),
                              ),
                              _widgetTyre()
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

  _widgetTyre() {
    return Row(
      children: [
        Text(
          '33',
          style: Get.textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontSize: 14.sp,
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

  _borderBox({
    required String image,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.all(
        20.w,
      ),
      height: 150.w,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 2.w,
          color: AppColors.white,
        ),
        gradient: LinearGradient(
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
          Image.asset(
            image,
            height: 45.w,
            width: 35.w,
          ),
          Gap(6.h),
          Text(
            text,
            style: Get.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 18.sp,
              height: 1.44,
            ),
          ),
        ],
      ),
    );
  }
}
