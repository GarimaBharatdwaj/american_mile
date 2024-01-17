import 'package:american_mile/app/modules/home/controllers/home_controller.dart';
import 'package:american_mile/core/components/secondry_button.dart';
import 'package:american_mile/core/components/shadow_container.dart';
import 'package:american_mile/core/helpers/image_paths.dart';
import 'package:american_mile/core/utils/app_colors.dart';
import 'package:american_mile/core/utils/divider.dart';
import '../../../../common_lib.dart';

class LocationMap extends StatelessWidget {
  LocationMap({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(children: [
          controller.isLoading.value
              ? Container(
                  height: context.height-150.h,
                  alignment: Alignment.center,
                  child: showProgressIndicator())
              : _vehicalComponent(context),
        ]));
  }

  _restoreVehicleComponent(BuildContext context, List list) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        vertical: 18.h,
      ),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: AppColors.primaryDark,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " ${controller.restoreVehicleList.length} Click Add from Policy Vehicles",
              style: Get.textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
            Gap(8.h),
            ...List.generate(
                list.length,
                (index) => GestureDetector(
                      onTap: () {
                        controller.restoreVehicleAPI(list[index]['id']);
                      },
                      child: Column(
                        children: [
                          Gap(8.h),
                          Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 30.h,
                              ),
                              Text(
                                list[index]['make'] +
                                    " " +
                                    list[index]['model'],
                                style: Get.textTheme.titleMedium?.copyWith(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Gap(8.h),
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }

  _containerItem({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              key,
              style: Get.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Get.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _vehicalComponent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10.h),
          Obx(() => controller.restoreVehicleList.isNotEmpty
              ? _restoreVehicleComponent(context, controller.restoreVehicleList)
              : const SizedBox()),
          Gap(20.h),
          ...List.generate(controller.familyDetails?['vehicles'].length,
              (index) {
            var vehical = controller.familyDetails?['vehicles'][index];
            return Column(
              children: [
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Gap(16.h),

                        CircleAvatar(
                            radius: 55.h,

                            ///backgroundColor: AppColors.primary,
                            child: CircleAvatar(
                                radius: 55.h,
                                foregroundImage: AssetImage(
                                  ImagePaths.carIcon,
                                ))),

                        Gap(16.h),
                        Text(
                          "${vehical['year']} ${vehical['make']} ${vehical['model']}",
                          style: Get.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.primary,
                            fontSize: 20.sp,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(16.h),
                        _containerItem(
                          key: "VIN # :",
                          value: vehical['vin_number'],
                        ),
                        _containerItem(
                          key: "Year :",
                          value: vehical['year'],
                        ),
                        _containerItem(
                          key: "Make :",
                          value: vehical['make'],
                        ),
                        _containerItem(
                          key: "Model :",
                          value: vehical['model'],
                        ),
                        vehical['body'] == null || vehical['body'] == ""
                            ? Container()
                            : _containerItem(
                                key: "Body :",
                                value: vehical['body'],
                              ),
                        Gap(16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondryButton(
                              buttonText: "Edit",
                              onTap: () {
                                Get.toNamed(Routes.CAR_DETAILS, arguments: {
                                  'isAddingManually': true,
                                  'vinNumber': vehical['vin_number'],
                                  'year': vehical['year'],
                                  'make': vehical['make'],
                                  'model': vehical['model'],
                                  'body': vehical['body'],
                                  'type': '1',
                                  'vehical_id': vehical['id'],
                                })?.then(
                                  (value) {
                                    if (value) {
                                      controller.myFamilyAPI();
                                    }
                                  },
                                );
                              },
                            ),
                            Gap(16.h),
                            SecondryButton(
                              buttonText: "Remove",
                              onTap: () {
                                controller.deleteVehicleAPI(
                                  vehical['id'],
                                );
                              },
                            ),
                          ],
                        ),

                        /// Gap(8.h),
                        // SecondryButton(
                        //   width: context.width,
                        //   buttonText: "Connect car",
                        //   onTap: () {
                        //     Get.toNamed(
                        //       Routes.CAR_DASHBOARD,
                        //       arguments: {
                        //         "id": vehical['id'],
                        //         "type": "2",
                        //       },
                        //     );
                        //   },
                        /// ),
                        Gap(16.h),
                      ],
                    ),
                  ),
                ),
                Gap(16.h),
              ],
            );
          }),
        ],
      ),
    );
  }
}
