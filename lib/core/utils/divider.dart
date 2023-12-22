import 'package:american_mile/core/utils/app_colors.dart';
import '../../common_lib.dart';

Divider showDivider({double? height,Color? color}) => Divider(
      height: height,
      color: color ?? AppColors.primary.withOpacity(0.2),
    );

VerticalDivider showVerticalDivider(
        {Color? color, double? width, double? thickness}) =>
    VerticalDivider(
      color: color,
      width: width,
      thickness: thickness,
    );

Center showProgressIndicator({Color? color}) {
  return Center(
    child: SizedBox.square(
      dimension: 27,
      child: CircularProgressIndicator(
        color: color ?? AppColors.primaryDark,
        strokeWidth: 3.0,
      ),
    ),
  );
}
