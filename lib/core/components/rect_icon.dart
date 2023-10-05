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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          image,
          height: 22.w,
          width: 22.w,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
