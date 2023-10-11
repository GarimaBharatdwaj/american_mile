import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import 'package:american_mile/core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
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
            // Text(
            //   'Enter your progressive credentials to enable Canopy\nConnect to securely retrieve your insurance information.',
            //   style: Get.textTheme.titleSmall?.copyWith(
            //     fontSize: 14.sp,
            //   ),
            // ),
            Gap(24.h),
            LoginTextField(
              hintText: "Enter Email Address",
              labelText: "Email Address",
              controller: TextEditingController(),
            ),
            Gap(24.h),
            LoginTextField(
              hintText: "Enter Password",
              labelText: "Password",
              controller: TextEditingController(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: Get.textTheme.titleMedium,
                ),
              ),
            ),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: PrimaryButton(
                buttonText: "Log In",
                onTap: () {
                  Get.toNamed(Routes.DRIVER_LICENCE);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
