import '../../common_lib.dart';
import '../utils/index.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final double? buttonWidth;
  final Color? backgroundColor;
  final void Function() onTap;
  final bool isLoading;
  final AlignmentGeometry? alignment;
  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.buttonWidth,
    this.backgroundColor,
    this.isLoading = false,
    required this.onTap, this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment ?? Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 18.h,
        ),
        width: buttonWidth ?? context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.w),
          color: backgroundColor ?? AppColors.primaryDark,
        ),
        child: isLoading
            ? SizedBox(
                height: 25.h,
                width: 25.h,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2,
                ))
            : Text(
                buttonText,
                style: Get.textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
      ),
    );
  }
}
