import '../../common_lib.dart';
import '../utils/index.dart';

class SecondryButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const SecondryButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      width: context.width * .38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
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
    );
  }
}
