import 'package:american_mile/app/modules/car_details/components/details.dart';
import 'package:american_mile/app/modules/car_details/components/vehicle_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/car_details_controller.dart';

class OtpVerification extends GetView<CarDetailsController> {
  const OtpVerification({Key? key}) : super(key: key);
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
                      "Otp Verification",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Enter your Mobile Number, We will sent you an OTP to Verify",
                  textAlign: TextAlign.start,
                  style: Get.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor),
                ),
              ),
              Gap(40.h),
              LoginTextField(
                hintText: "Enter mobile number",
                labelText: "Mobile Number",
                controller: controller.otpController,
              ),
              Gap(24.h),
              Padding(
                padding: EdgeInsets.all(30.w),
                child: PrimaryButton(
                  buttonText: "Send OTP",
                  onTap: () {
                    Get.to(() => const VehicleDetails());
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
