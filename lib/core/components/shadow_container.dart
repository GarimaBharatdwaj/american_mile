import '../../common_lib.dart';
import '../utils/app_colors.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  const ShadowContainer({
    super.key,
    required this.child,
    this.width,
    this.backgroundColor,
    this.padding, this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width,
      padding: padding ?? EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(
          20.r,
        ),
        color: backgroundColor ?? AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.w,
            offset: Offset(
              0,
              3.h,
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
