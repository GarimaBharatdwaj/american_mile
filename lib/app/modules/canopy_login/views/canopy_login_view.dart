import 'package:american_mile/app/modules/canopy_login/controllers/canopy_login_controller.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/utils/form_validation.dart';
import '../../../../core/utils/index.dart';

class CanopyLoginView extends GetView<CanopyLoginController> {
  const CanopyLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: controller.isLoading.value
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 27,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                          strokeWidth: 3.0,
                        ), 
                      ),
                      Gap(20.w),
                      Text(
                        "Please wait....\nWhile we fetching your insurance details.",
                        style: Get.textTheme.titleSmall?.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ) 
              : Form(
                  key: controller.formKey,
                  child: ListView(
                    padding: EdgeInsets.all(15.w),
                    children: [
                      const MyAppBar(title: 'Log In'),
                      Gap(40.h),
                      Text(
                        'Enter your progressive credentials to enable Canopy\nConnect to securely retrieve your insurance information.',
                        style: Get.textTheme.titleSmall?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(24.h),
                      LoginTextField(
                        hintText: "Enter Email Address",
                        labelText: "Email Address",
                        validator: (value) => FormValidation.nameValidator(
                            controller.emailController.text,
                            tag: "Email can't be empty"),
                        textCapitalization: TextCapitalization.none,
                        controller: controller.emailController,
                      ),
                      Gap(24.h),
                      LoginTextField(
                        hintText: "Enter Password",
                        labelText: "Password",
                        validator: (value) => FormValidation.nameValidator(
                            controller.passwordController.text,
                            tag: "Password can't be empty"),
                        textCapitalization: TextCapitalization.none,
                        controller: controller.passwordController,
                      ),
                      Gap(50.h),
                      Padding(
                        padding: EdgeInsets.all(30.w),
                        child: PrimaryButton(
                          buttonText: "Log In",
                          onTap: controller.validateMethode,
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
