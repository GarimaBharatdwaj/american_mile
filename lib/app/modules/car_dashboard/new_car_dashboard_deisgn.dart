import 'package:american_mile/app/modules/car_dashboard/controllers/car_dashboard_controller.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/image_paths.dart';
import 'package:american_mile/core/utils/app_colors.dart';

class CarDashboardDesign extends GetView<CarDashboardController> {
  const CarDashboardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(ImagePaths.blueBackground,width: MediaQuery.of(context).size.width,),

              _evWidget(context)],
          ),
        ),
      ),
    );
  }

  /// Ev Widget
  _evWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [


        evStatusWidget(
            titleOne: "Lock Reminders",
            titleTwo: "Fuel Status",
            percent: controller.carDashBoardData?['fuel.percentRemaining'] ??
                "0%"),
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
              height: 100.h,
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
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titleOne,
              style: Get.textTheme.labelSmall?.copyWith(
                color: AppColors.white,
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
              ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
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
