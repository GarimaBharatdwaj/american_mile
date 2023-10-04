import 'package:american_mile/common_lib.dart';

import '../utils/index.dart';

class RRectIcon extends StatelessWidget {
  final String image;
  final void Function() onTap;
  const RRectIcon({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: Image.asset(
          image,
          height: 30.w,
          width: 30.w,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
