import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/utils/form_validation.dart';
import '../../../../core/utils/index.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.all(15.w),
            children: [
              const MyAppBar(title: 'Log In'),
            
              // Row(
              //   children: [
              //     RRectIcon(
              //       image: ImagePaths.arrow,
              //       onTap: () {},
              //     ),
              //     Expanded(
              //       child: Text(
              //         'Log In',
              //         textAlign: TextAlign.center,
              //         style: Get.textTheme.titleLarge?.copyWith(
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //     Opacity(
              //       opacity: 0,
              //       child: RRectIcon(
              //         image: ImagePaths.menu,
              //         onTap: () {},
              //       ),
              //     ),
              //   ],
              // ),
            
              ///Gap(40.h),
              // Obx(
              //   () => Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       ToggleEmailPhone(
              //         text: 'Email',
              //         value: true,
              //         groupValue: controller.isLoginTypeEmail.value,
              //         onChange: (val) {
              //           controller.isLoginTypeEmail.value = true;
              //         },
              //       ),
              //       Gap(8.w),
              //       ToggleEmailPhone(
              //         text: 'Phone',
              //         value: false,
              //         groupValue: controller.isLoginTypeEmail.value,
              //         onChange: (val) {
              //           controller.isLoginTypeEmail.value = false;
              //         },
              //       ),
              //     ],
              //   ),
              /// ),
              Gap(48.h),
              Obx(
                () => Visibility(
                  visible: controller.isLoginTypeEmail.value,
                  child: LoginTextField(
                    hintText: "Enter Email Address",
                    labelText: "Email Address",
                    textCapitalization: TextCapitalization.none,
                    validator: (value) => FormValidation.emailValidator(
                      controller.emailController.text,
                    ),
                    controller: controller.emailController,
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !controller.isLoginTypeEmail.value,
                  child: LoginTextField(
                    hintText: "Enter Mobile Number",
                    labelText: "Mobile Number",
                    validator: (value) => FormValidation.nameValidator(
                        controller.mobileController.text,
                        tag: "Please enter mobile number"),
                    controller: controller.mobileController,
                  ),
                ),
              ),
              Gap(28.h),
              LoginTextField(
                hintText: "Enter Password",
                labelText: "Password",
                textCapitalization: TextCapitalization.none,
                validator: (value) => FormValidation.nameValidator(
                    controller.passwordController.text,
                    tag: "Please enter password."),
                controller: controller.passwordController,
              ),
              /// Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: Text(
              //       'Forgot Password?',
              //       style: Get.textTheme.titleMedium,
              //     ),
              //   ),
              /// ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.all(30.w),
                child: Obx(
                  () => PrimaryButton(
                    buttonText: "Log In",
                    isLoading: controller.isLoading.value,
                    onTap: controller.validateMethode,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleEmailPhone<T> extends StatelessWidget {
  const ToggleEmailPhone({
    super.key,
    required this.text,
    required this.value,
    this.groupValue,
    required this.onChange,
  });

  final String text;
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChange;

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return Expanded(
      child: InkWell(
        onTap: () => onChange(value),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              border: Border.all(
                width: 0.7,
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(15.r)),
          width: context.width / 2,
          child: Text(
            text,
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
