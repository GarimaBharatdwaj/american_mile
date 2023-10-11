import 'package:american_mile/app/modules/insurance_provider/component/security_measures.dart';
import 'package:american_mile/core/components/primary_button.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/insurance_provider_controller.dart';

class InsuranceProviderView extends GetView<InsuranceProviderController> {
  const InsuranceProviderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              const MyAppBar(
                title: 'Insurance provider',
              ),
              Gap(30.h),
              ...List.generate(controller.insuranceProviderList.length,
                  (index) {
                var item = controller.insuranceProviderList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: ShadowContainer(
                    child: Row(
                      children: [
                        profileImage(
                          imageUrl:
                              'https://1000logos.net/wp-content/uploads/2020/09/21st-Century-Insurance-Emblem.jpg',
                          circleRadius: 30.w,
                          imageSize: 30.w,
                        ),
                        Gap(20.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: Get.textTheme.titleLarge?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Gap(6.h),
                              Text(
                                item['website'],
                                style: Get.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Don't know your Credential?",
                style: Get.textTheme.titleLarge?.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                child: PrimaryButton(
                  buttonText: "Scan & Snap",
                  onTap: () {
                    Get.to(
                      () => const InsuranceSecurityMesaures(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
