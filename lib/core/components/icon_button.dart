import '../../common_lib.dart';
import '../utils/index.dart';

class AppIconButton extends StatelessWidget {
  final String buttonText;
  final String icon;
  final void Function() onTap;
  const AppIconButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: AppColors.primaryDark,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 22.w,
              width: 18.w,
            ),
            Expanded(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              width: 18.w,
            )
          ],
        ),
      ),
    );
  }
}
