import 'package:american_mile/app/modules/driver_licence/controllers/driver_licence_controller.dart';
import 'package:american_mile/core/utils/form_validation.dart';
import 'package:flutter/cupertino.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';

class DriverDetails extends StatelessWidget {
  DriverDetails({super.key});

  final controller = Get.find<DriverLicenceController>();

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
                    enabled: controller.isAddingManually.value,
                    hintText: "Enter Name",
                    labelText: "Name",
                    validator: (value) => FormValidation.nameValidator(
                        controller.nameController.text,
                        tag: 'Enter Name',
                        isMandatory: true),
                    controller: controller.nameController,
                  ),
                  Gap(24.h),
                  LoginTextField(
                    enabled: controller.isAddingManually.value,
                    hintText: "Enter Gender",
                    labelText: "Gender",
                    controller: controller.genderController,
                    validator: (value) => FormValidation.genderValidator(
                        controller.genderController.text,
                        isMandatory: true),
                  ),
                  Gap(24.h),
                  LoginTextField(
                    enabled: controller.isAddingManually.value,
                    hintText: "Enter Date Of Birth",
                    labelText: "Date Of Birth",
                    controller: controller.dobController,
                    validator: (value) => FormValidation.dobValidator(
                      controller.dobController.text,
                    ),
                  ),
                  Gap(24.h),
                  LoginTextField(
                    enabled: controller.isAddingManually.value,
                    hintText: "Enter Driver's License Number",
                    labelText: "Driver's License Number",
                    controller: controller.dlController,
                    validator: (value) => FormValidation.addressLineValidator(
                        controller.dlController.text),
                  ),
                  Gap(24.h),
                  LoginTextField(
                    enabled: controller.isAddingManually.value,
                    hintText: "Enter Address",
                    labelText: "Address",
                    controller: controller.addressController,
                    validator: (value) => FormValidation.addressLineValidator(
                        controller.dlController.text),
                  ),
                  Gap(30.h),
                  Padding(
                    padding: EdgeInsets.all(30.w),
                    child: PrimaryButton(
                      buttonText: controller.isAddingManually.value
                          ? "Submit"
                          : "Yes, It's Correct",
                      onTap: () {
                        controller.isAddingManually.value
                            ? controller.validateMethode()
                            : () {};

                        /// Get.toNamed(Routes.SEARCH_BY_VIN);
                      },
                    ),
                  ),
                  if (!controller.isAddingManually.value)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: PrimaryButton(
                        backgroundColor: AppColors.textBlackColor,
                        buttonText: "No, I need to Change",
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

  void _showDialog(Widget child, {required void Function() onTap}) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 300.h,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: AppColors.textLight,
            child: SafeArea(
              top: false,
              child: child,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            color: AppColors.textLight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: PrimaryButton(
                backgroundColor: AppColors.textBlackColor,
                buttonText: "Done",
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
