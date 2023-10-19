import 'package:american_mile/app/modules/canopy_login/controllers/canopy_login_controller.dart';
import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/components/primary_button.dart';
import 'package:american_mile/core/utils/divider.dart';
import '../../../../core/utils/index.dart';

class CanopyLoginView extends GetView<CanopyLoginController> {
  const CanopyLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: controller.isLoading.value
              ? showProgressIndicator()
              : ListView(
                  padding: EdgeInsets.all(15.w),
                  children: [
                    Row(
                      children: [
                        RRectIcon(
                          image: ImagePaths.arrow,
                          onTap: () {},
                        ),
                        Expanded(
                          child: Text(
                            'Log In',
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
                      controller: controller.emailController,
                    ),
                    Gap(24.h),
                    LoginTextField(
                      hintText: "Enter Password",
                      labelText: "Password",
                      controller: controller.passwordController,
                    ),
                    Gap(50.h),
                    Padding(
                      padding: EdgeInsets.all(30.w),
                      child: PrimaryButton(
                        buttonText: "Log In",
                        onTap: () {
                          controller.canopyLogin();
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
