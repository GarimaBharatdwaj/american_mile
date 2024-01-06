import 'package:american_mile/common_lib.dart';

import '../../../../core/components/my_app_bar.dart';
import '../../../../core/helpers/image_paths.dart';
import '../../../../core/utils/app_colors.dart';

class ViewAutoPolicy extends StatelessWidget {
  const ViewAutoPolicy({super.key, this.details});

  final details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: const MyAppBar(title: 'Auto Policy Details'),
        ),
        _carDetails(context, carImage: ImagePaths.car2, car: details)
      ]),
    ))));
  }

  _carDetails(
    BuildContext context, {
    required String carImage,
    required Map<String, dynamic> car,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.h),
            Text(
              "${car['year']} ${car['make']} ${car['model']}",
              textAlign: TextAlign.center,
              style: Get.textTheme.titleMedium?.copyWith(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: AppColors.primaryDark),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  carImage,
                  height: 185.w,
                  width: 185.w,
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
                        5.r,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "VIN #${car['vin_number']}",
                    style: Get.textTheme.titleMedium
                        ?.copyWith(fontSize: 14.sp, color: AppColors.textLight),
                  ),
                  Gap(12.h),
                  _carItem(key: "BODILY INJURY", value: car['bodily_injury']),
                  _carItem(key: "PROPERTY DAMAGE", value: car['proper_damage']),
                  _carItem(
                      key: "UNINSURED MOTORIST",
                      value: car['unnisured_motorist']),
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
              ),
            ),
          ],
        ),
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
