import '../../common_lib.dart';
import '../utils/index.dart';

class SecondryButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const SecondryButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width, this.height, this.padding,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.symmetric(
          vertical: 14.h,
        ),
        width: width ?? context.width * .38,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryDark,
              AppColors.primary,
            ],
          ),
        ),
        child: Text(
          buttonText,
          style: Get.textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
