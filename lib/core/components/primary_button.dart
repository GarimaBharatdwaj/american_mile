import '../../common_lib.dart';
import '../utils/index.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final double? buttonWidth;
  final void Function()? onTap;
  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.buttonWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 18.h,
        ),
        width: buttonWidth ?? context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.w),
          color: AppColors.primaryDark,
        ),
        child: Text(
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
