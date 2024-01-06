import 'package:american_mile/common_lib.dart';

import '../../../../core/components/my_app_bar.dart';
import '../../../../core/components/secondry_button.dart';
import '../../../../core/helpers/image_paths.dart';
import '../../../../core/utils/app_colors.dart';

class ViewHomePolicy extends StatelessWidget {
  const ViewHomePolicy({super.key, this.homeDetails});

  final homeDetails;

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
            color: AppColors.primary,
          ),
        ),
        Gap(12.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const MyAppBar(
                title: 'Home Policy',
              ),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    Text(
                      homeDetails!['full_address'],
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleMedium?.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryDark),
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        Image.asset(
                          ImagePaths.house,
                        ),
                        SecondryButton(
                            height: 35.h,
                            padding: EdgeInsets.all(0.h),
                            onTap: () {
                              Get.offAllNamed(Routes.HOME,arguments: "home");
                            },
                            buttonText: "Manage Homes"),
                      ],
                    ),
                    Gap(8.h),
                    if (homeDetails!['coverages']['medical_payments'] != null)
                      _houseItem(
                        key: "MEDICAL PAYMENTS",
                        value: homeDetails!['coverages']['medical_payments'],
                      ),
                    if (homeDetails!['coverages']['persoal_liability'] != null)
                      _houseItem(
                        key: "PERSONAL LIABILITY",
                        value: homeDetails!['coverages']['persoal_liability'],
                      ),
                    if (homeDetails!['coverages']['loss_of_use'] != null)
                      _houseItem(
                        key: "LOSS OF USE",
                        value: homeDetails!['coverages']['loss_of_use'],
                      ),
                    if (homeDetails!['coverages']['persoal_prop_liability'] !=
                        null)
                      _houseItem(
                        key: "Persoal Prop Liability",
                        value: homeDetails!['coverages']
                            ['persoal_prop_liability'],
                      ),
                    if (homeDetails!['coverages']['security_liability'] != null)
                      _houseItem(
                        key: "Security Liability",
                        value: homeDetails!['coverages']['security_liability'],
                      ),
                    if (homeDetails!['coverages']['dwelling_liability'] != null)
                      _houseItem(
                        key: "Dwelling Liability",
                        value: homeDetails!['coverages']['dwelling_liability'],
                      ),
                    Gap(12.h),
                    Gap(10.h),
                    if (homeDetails!['deductible']['All Perils'] != null ||
                        homeDetails!['deductible']['windstorm_or_hail'] !=
                            null ||
                        homeDetails!['deductible']['all_other_perils'] != null)
                      Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              'Deductibles',
                              style: Get.textTheme.titleMedium?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                            ),
                            Gap(6.h),
                            Text(
                              "For home policies, there are three common types of deductibles; flat, percent, and split deductibles",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(20.h),
                            if (homeDetails!['deductible']['All Perils'] != null)
                              _houseItem(
                                key: "All Perils",
                                value: homeDetails!['deductible']['All Perils'],
                              ),
                            if (homeDetails!['deductible']['all_other_perils'] !=
                                null)
                              _houseItem(
                                key: "All Other Perils",
                                value: homeDetails!['deductible']
                                    ['all_other_perils'],
                              ),
                            if (homeDetails!['deductible']['windstorm_or_hail'] !=
                                null)
                              _houseItem(
                                key: "Windstorm Or Hail",
                                value: homeDetails!['deductible']
                                    ['windstorm_or_hail'],
                              ),
                        ],
                      ),
                          )),
                  ],
                ),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
