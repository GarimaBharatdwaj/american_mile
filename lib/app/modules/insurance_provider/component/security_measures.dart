import 'package:american_mile/core/utils/index.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';

class InsuranceSecurityMesaures extends StatelessWidget {
  const InsuranceSecurityMesaures({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              const MyAppBar(
                title: 'Security measures',
              ),
              Gap(30.h),
              Text(
                "American Mile Insurance uses state of the art security\nmeasures to protect your information",
                style: Get.textTheme.titleSmall,
              ),
              Gap(30.h),
              _widget(
                icon: ImagePaths.shield,
                title: "Secure",
                subTitle:
                    "Transfer of your information is encrypted\nend-to-end",
              ),
              Gap(30.h),
              _widget(
                icon: ImagePaths.eye,
                title: "Private",
                subTitle:
                    "Your credentials will never be made available\nto American Mile Insurance",
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              Text(
                "By selecting '"
                'Continue'
                "' you agree to the Canopy End\nUser Privacy Policy",
                textAlign: TextAlign.center,
                style: Get.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _widget({
    required String icon,
    required String title,
    required String subTitle,
  }) {
    return ShadowContainer(
      child: Column(
        children: [
          Gap(30.h),
          Image.asset(
            icon,
            height: 40.w,
            width: 40.w,
          ),
          Gap(12.h),
          Text(
            title,
            style: Get.textTheme.titleLarge?.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(8.h),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Get.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
          Gap(30.h),
        ],
      ),
    );
  }
}
