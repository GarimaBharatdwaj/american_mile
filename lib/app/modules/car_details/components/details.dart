import 'package:american_mile/app/modules/car_details/components/otp_verification.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              Row(
                children: [
                  RRectIcon(
                    image: ImagePaths.arrow,
                    onTap: () {},
                  ),
                  Expanded(
                    child: Text(
                      "Details",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: RRectIcon(
                      image: ImagePaths.menu,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Gap(40.h),
              callEmailButton(
                  onTap: () {},
                  context: context,
                  buttonColor: AppColors.textBlackColor,
                  icon: Icons.email,
                  text: "Email address"),
              Gap(40.h),
              callEmailButton(
                  onTap: () {
                    Get.to(() => const OtpVerification());
                  },
                  context: context,
                  buttonColor: AppColors.primary,
                  icon: Icons.call,
                  text: "Phone Number")
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector callEmailButton(
      {BuildContext? context,
      Color? buttonColor,
      IconData? icon,
      String? text,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context!.width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 75.0),
          child: Column(
            children: [
              Icon(
                icon!,
                size: 100.h,
                color: AppColors.white,
              ),
              Text(
                text!,
                textAlign: TextAlign.center,
                style: Get.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
