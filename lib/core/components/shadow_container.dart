import '../../common_lib.dart';
import '../utils/app_colors.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  const ShadowContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        color: AppColors.white,
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
