import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/car_details_controller.dart';

class CarDetailsView extends GetView<CarDetailsController> {
  const CarDetailsView({Key? key}) : super(key: key);
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
              LoginTextField(
                hintText: "Enter VIN",
                labelText: "VIN",
                controller: controller.vinController,
              ),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Year",
                  labelText: "Year",
                  controller: controller.yearController),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Make",
                  labelText: "Make",
                  controller: controller.makeController),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Model",
                  labelText: "Model",
                  controller: controller.modelController),
              Gap(24.h),
              LoginTextField(
                  hintText: "Enter Body Class",
                  labelText: "Body Class",
                  controller: controller.bodyController),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.all(30.w),
                child: PrimaryButton(
                  buttonText: "Yes, It's Correct",
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: PrimaryButton(
                  backgroundColor: AppColors.textBlackColor,
                  buttonText: "No, I need to Change",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

