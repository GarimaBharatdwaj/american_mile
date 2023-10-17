import '../../common_lib.dart';
import '../utils/index.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;
  final bool? enabled;
  final String? Function(String?)? validator;
  const LoginTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.labelText,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: validator,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.all(
                      20.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: 1.w,
                          color: AppColors.borderColor,
                        ),
                        color: AppColors.white),
                    child: TextFormField(
                      enabled: enabled,
                      style: Get.textTheme.titleMedium
                          ?.copyWith(color: AppColors.textBlackColor),
                      controller: controller,
                      decoration: InputDecoration.collapsed(
                        hintText: hintText,
                        hintStyle: Get.textTheme.titleMedium?.copyWith(
                            fontSize: 14.sp, color: AppColors.textLight),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        labelText,
                        style: Get.textTheme.titleSmall?.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (state.hasError) Gap(15.h),
              if (state.hasError)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    state.errorText ?? "",
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
