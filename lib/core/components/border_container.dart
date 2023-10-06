import '../../common_lib.dart';
import '../utils/index.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  const BorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(
          width: 1.w,
          color: AppColors.black.withOpacity(.4),
        ),
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
