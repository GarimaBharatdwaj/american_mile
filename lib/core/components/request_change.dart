import '../../common_lib.dart';
import '../utils/index.dart';

class RequestChange extends StatelessWidget {
  const RequestChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.w),
            bottomLeft: Radius.circular(50.w),
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryDark,
            AppColors.primary,
          ])),
      child: Text(
        "Request Change",
        style: Get.textTheme.titleMedium?.copyWith(
          color: AppColors.white,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
