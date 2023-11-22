import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/form_validation.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../controllers/set_mile_password_controller.dart';

class SetMilePasswordView extends GetView<SetMilePasswordController> {
  const SetMilePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.all(15.w),
            children: [
              const MyAppBar(
                title: 'Set Password',
              ),
              Gap(40.h),
              Text(
                controller.userEmail,
                style: Get.textTheme.titleSmall?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(6.h),
              Text(
                'Set your password for American Mile account.',
                style: Get.textTheme.titleSmall?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(24.h),
              LoginTextField(
                validator: (value) =>
                    FormValidation.passwordValidator(controller.password.text),
                hintText: "Enter Password",
                labelText: "Password",
                controller: controller.password,
              ),
              Gap(24.h),
              LoginTextField(
                validator: (value) => FormValidation.confirmPasswordValidator(
                    controller.confirmPassword.text, controller.password.text),
                hintText: "Enter Confirm Password",
                labelText: "Confirm Password",
                controller: controller.confirmPassword,
              ),
              Gap(50.h),
              Obx(
                () => Padding(
                  padding: EdgeInsets.all(30.w),
                  child: PrimaryButton(
                    isLoading: controller.isLoading.value,
                    buttonText: "Submit",
                    onTap: controller.validateMethode,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
