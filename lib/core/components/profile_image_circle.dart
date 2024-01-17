// Package imports:

import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/helpers/device_helper.dart';
import 'package:american_mile/core/utils/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget profileImage({
  required String? imageUrl,
  double? imageSize,
  double? circleRadius,
  void Function()? onTap,
}) {
  double? size = imageSize ?? 120.w;
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(circleRadius ?? 40.r),
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl != null && imageUrl != "" && imageUrl.isNotEmpty
                ? imageUrl
                : "https://americanmile.com/assets/images/no-image-icon.png",
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(circleRadius ?? 40.r),
                ),
              );
            },
            // placeholder: (context, url) => Container(
            //   height: size,
            //   width: size,
            //   decoration: BoxDecoration(
            //     color: AppColors.background,
            //     borderRadius: BorderRadius.circular(circleRadius ?? 40.r),
            //   ),
            // ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, value, error) {
              return Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://americanmile.com/assets/images/no-image-icon.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(circleRadius ?? 40.r),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
