import 'package:american_mile/common_lib.dart';

import '../../../../../core/components/rect_icon.dart';
import '../../../../../core/helpers/image_paths.dart';
import '../../../../../core/utils/app_colors.dart';

class AutoDetailsCar extends StatelessWidget {
  const AutoDetailsCar({super.key, this.autoDetails});

  final autoDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 5.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RRectIcon(
                      backgroundColor: AppColors.primary.withOpacity(0.2),
                      image: ImagePaths.arrow,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Gap(10.h),
                _carDetails(context,
                    carImage: ImagePaths.car2, car: autoDetails!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _carDetails(
    BuildContext context, {
    required String carImage,
    required Map<String, dynamic> car,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Card(
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
                      10.r,
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
          style: Get.textTheme.titleMedium
              ?.copyWith(fontSize: 14.sp, color: AppColors.primary),
        ),
        Gap(12.h),
      ],
    );
  }
}
