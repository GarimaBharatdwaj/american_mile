import 'package:american_mile/common_lib.dart';
import '../../../../core/components/index.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/utils/index.dart';
import '../controllers/set_mile_password_controller.dart';

class SetMilePasswordView extends GetView<SetMilePasswordController> {
  const SetMilePasswordView({Key? key}) : super(key: key);
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
                    'Set Password',
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
              hintText: "Enter Password",
              labelText: "Password",
              controller: controller.password,
            ),
            Gap(24.h),
            LoginTextField(
              hintText: "Enter Confirm Password",
              labelText: "Confirm Password",
              controller: controller.confirmPassword,
            ),
            Gap(50.h),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: PrimaryButton(
                buttonText: "Submit",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
