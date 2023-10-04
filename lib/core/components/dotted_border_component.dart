import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedBorderWidget extends StatelessWidget {
  final Widget bodyWidget;
  const DottedBorderWidget({
    Key? key,
    required this.bodyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.textLight,
      radius: Radius.circular(20.r),
      strokeWidth: 1,
      borderType: BorderType.RRect,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      child: bodyWidget,
    );
  }
}
