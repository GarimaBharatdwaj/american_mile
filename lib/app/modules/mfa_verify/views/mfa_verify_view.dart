import 'package:american_mile/core/utils/app_colors.dart';
import 'package:pinput/pinput.dart';
import '../../../../common_lib.dart';
import '../../../../core/components/my_app_bar.dart';
import '../../../../core/components/primary_button.dart';
import '../controllers/mfa_verify_controller.dart';

class MfaVerifyView extends GetView<MfaVerifyController> {
  const MfaVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(
      () => Column(
        children: [
          const MyAppBar(title: 'MFA Verify'),
          !controller.isCodeSent.value
              ? chooseMFAVerificationMethod()
              : otpWidget(),
        ],
      ),
    )));
  }

  chooseMFAVerificationMethod() {
    return Column(
      children: [
        Gap(40.h),
        Text(
          'Please select the desired method for verification below.',
          style: Get.textTheme.titleMedium
              ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        Gap(30.h),
        ...List.generate(
            controller.mfaOptions!.length - 2,
            (index) => ToggleMFAVerification(
                text: controller.mfaOptions!.elementAt(index + 2),
                value: index,
                groupValue: controller.verificationMethod.value,
                onChange: (val) {
                  controller.verificationMethod.value = val;
                })),
        Gap(30.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Obx(
            () => PrimaryButton(
              buttonText: "Continue",
              isLoading: controller.isLoading.value,
              onTap: () {
                controller.sendVerificationCode();
              },
            ),
          ),
        ),
      ],
    );
  }

  otpWidget() {
    return Column(
      children: [
        Gap(40.h),

        /// TODO:

        Text(
          'Please enter the code that was sent to you',
          style: Get.textTheme.titleMedium
              ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        Gap(40.h),
        Pinput(
          controller: controller.otpController,
          length: 6,
          defaultPinTheme: PinTheme(
            width: 45.w,
            height: 45.w,
            textStyle: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(30, 60, 87, 1),
                fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textBlackColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        Gap(30.h),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
          ),
          child: Obx(
            () => PrimaryButton(
              buttonText: "Verify",
              borderRadius: BorderRadius.circular(15.r),
              isLoading: controller.isLoading.value,
              onTap: () {
                controller.submitMfa();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ToggleMFAVerification<T> extends StatelessWidget {
  const ToggleMFAVerification({
    super.key,
    required this.text,
    required this.value,
    this.groupValue,
    required this.onChange,
  });

  final String? text;
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChange;

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return InkWell(
        onTap: () => onChange(value),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isSelected
                  ? const Icon(Icons.radio_button_checked)
                  : const Icon(Icons.radio_button_off),
              Gap(8.h),
              Text(
                text!,
                style: Get.textTheme.titleSmall
                    ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
