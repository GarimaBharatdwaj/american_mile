import '../../common_lib.dart';
import '../utils/index.dart';

class RectSmallButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const RectSmallButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryDark, AppColors.primary],
            ),
            borderRadius: BorderRadius.circular(15.r)),
        child: Text(
          buttonText,
          style: Get.textTheme.titleSmall?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
