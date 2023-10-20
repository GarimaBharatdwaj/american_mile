import 'package:american_mile/app/modules/insurance_provider/component/security_measures.dart';
import 'package:american_mile/core/utils/divider.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/insurance_provider_controller.dart';

class InsuranceProviderView extends GetView<InsuranceProviderController> {
  const InsuranceProviderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<InsuranceProviderController>(
          init: InsuranceProviderController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: AppColors.background,
              body: controller.isLoading
                  ? showProgressIndicator()
                  : SingleChildScrollView(
                      padding: EdgeInsets.all(15.w),
                      child: Column(
                        children: [
                          const MyAppBar(
                            title: 'Insurance provider',
                          ),
                          Gap(20.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.w,
                                color: AppColors.black,
                              ),
                              borderRadius: BorderRadius.circular(
                                12.r,
                              ),
                            ),
                            child: TextField(
                              controller: controller.searchController,
                              decoration: InputDecoration.collapsed(
                                hintText: "Search..",
                                hintStyle: Get.textTheme.bodyMedium,
                              ),
                              onChanged: controller.searchListing,
                            ),
                          ),
                          Gap(30.h),
                          if (controller.insuranceProviderList.isNotEmpty)
                            ...List.generate(
                                controller.insuranceProviderList.length,
                                (index) {
                              var item =
                                  controller.insuranceProviderList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.carrierId = item['carrier_id'];
                                  Get.to(
                                    () => InsuranceSecurityMeasures(),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: ShadowContainer(
                                    child: Row(
                                      children: [
                                        profileImage(
                                          imageUrl: item['imageurl'],
                                          circleRadius: 30.w,
                                          imageSize: 30.w,
                                        ),
                                        Gap(20.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['name'],
                                                style: Get.textTheme.titleLarge
                                                    ?.copyWith(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Gap(6.h),
                                              Text(
                                                item['homepageUrl'],
                                                style: Get.textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                          else
                            Text(
                              'No data available',
                              style: Get.textTheme.titleLarge?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
