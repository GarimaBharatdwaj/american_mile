import 'package:american_mile/core/utils/form_validation.dart';
import 'package:flutter/services.dart';

import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../../../../core/utils/text_capitalization_formatter.dart';
import '../controllers/car_details_controller.dart';

class CarDetailsView extends GetView<CarDetailsController> {
  const CarDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Obx(
            () => Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const MyAppBar(
                    title: 'Vin',
                  ),
                  Gap(40.h),
                  LoginTextField(
                    enabled: controller.isAddingManually.value,
                    hintText: "Enter VIN",
                    labelText: "VIN",
                    controller: controller.vinController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[A-Z 0-9]'))
                    ],
                    textCapitalization: TextCapitalization.characters,
                    validator: (value) => FormValidation.vinValidator(
                        controller.vinController.text),
                  ),
                  Gap(24.h),
                  GestureDetector(
                    onTap: controller.isAddingManually.value
                        ? () {
                            controller.showDatePickerMethod(
                                context, controller.yearController);
                          }
                        : () {},
                    child: LoginTextField(
                        enabled: false,
                        hintText: "Enter Year",
                        labelText: "Year",
                        validator: (value) =>
                            FormValidation.addressLineValidator(
                                controller.yearController.text,
                                "Please enter year"),
                        controller: controller.yearController),
                  ),
                  Gap(24.h),
                  LoginTextField(
                      enabled: controller.isAddingManually.value,
                      hintText: "Enter Make",
                      labelText: "Make",
                      validator: (value) => FormValidation.addressLineValidator(
                          controller.makeController.text, "Please enter make"),
                      controller: controller.makeController),
                  Gap(24.h),
                  LoginTextField(
                      enabled: controller.isAddingManually.value,
                      hintText: "Enter Model",
                      labelText: "Model",
                      validator: (value) => FormValidation.addressLineValidator(
                          controller.modelController.text,
                          "Please enter model"),
                      controller: controller.modelController),
                  Gap(24.h),
                  LoginTextField(
                      enabled: controller.isAddingManually.value,
                      hintText: "Enter Body Class",
                      labelText: "Body Class",
                      validator: (value) => FormValidation.addressLineValidator(
                          controller.bodyController.text,
                          "Please enter body class"),
                      controller: controller.bodyController),
                  Gap(30.h),
                  Padding(
                    padding: EdgeInsets.all(30.w),
                    child: PrimaryButton(
                      isLoading: controller.isLoading.value,
                      buttonText: controller.isAddingManually.value
                          ? "Submit"
                          : "Continue",
                      onTap: controller.validateMethode,
                    ),
                  ),
                  if (!controller.isAddingManually.value)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: PrimaryButton(
                        backgroundColor: AppColors.textBlackColor,
                        buttonText: "No, i need  to change",
                        onTap: () {
                          controller.makeFormEditable();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
