import 'package:american_mile/common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/form_validation.dart';
import '../../../../core/utils/index.dart';
import '../../../../core/utils/text_capitalization_formatter.dart';
import '../controllers/driver_details_controller.dart';

class DriverDetailsView extends GetView<DriverDetailsController> {
  const DriverDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  inputFormatters: [UpperCaseTextFormatter()],
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
                  inputFormatters: [UpperCaseTextFormatter()],
                  controller: controller.genderController,
                  validator: (value) => FormValidation.genderValidator(
                      controller.genderController.text,
                      isMandatory: true),
                ),
                Gap(24.h),
                GestureDetector(
                  onTap: controller.isAddingManually.value
                      ? () {
                          controller.showDatePickerMethod(
                              context, controller.dobController);
                        }
                      : () {},
                  child: LoginTextField(
                    enabled: false,
                    hintText: "Enter Date Of Birth",
                    labelText: "Date Of Birth",
                    controller: controller.dobController,
                    validator: (value) => FormValidation.dobValidator(
                      controller.dobController.text,
                    ),
                  ),
                ),
                Gap(24.h),
                LoginTextField(
                  enabled: controller.isAddingManually.value,
                  hintText: "Enter Driver's License Number",
                  labelText: "Driver's License Number",
                  controller: controller.dlController,
                  validator: (value) => FormValidation.addressLineValidator(
                      controller.dlController.text,
                      "Driver's license is required"),
                ),
                Gap(24.h),
                LoginTextField(
                  enabled: controller.isAddingManually.value,
                  hintText: "Enter Address",
                  labelText: "Address",
                  controller: controller.addressController,
                  validator: (value) => FormValidation.addressLineValidator(
                      controller.addressController.text, 'Address is required'),
                ),
                Gap(30.h),
                Padding(
                  padding: EdgeInsets.all(30.w),
                  child: PrimaryButton(
                    isLoading: controller.isLoading.value,
                    buttonText: controller.isAddingManually.value
                        ? "Submit"
                        : "Yes, It's Correct",
                    onTap: controller.validateMethode,
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
    );
  }
}
