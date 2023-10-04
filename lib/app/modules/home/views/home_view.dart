import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/profile_image_circle.dart';
import 'package:american_mile/core/components/rect_icon.dart';
import 'package:american_mile/core/utils/index.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RRectIcon(
                    image: ImagePaths.menu,
                    onTap: () {},
                  ),
                  Expanded(
                    child: Text(
                      AppStrings.insuranceDashboard,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  RRectIcon(
                    image: ImagePaths.menu,
                    onTap: () {},
                  ),
                ],
              ),
              Gap(25.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                  10.r,
                )),
                child: Column(
                  children: [
                    Container(
                      width: context.width,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.secondry,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "Hue Chi",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          profileImage(
                            imageUrl:
                                "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/1.jpg",
                            circleRadius: 25.r,
                            imageSize: 75.w,
                          ),
                          Gap(20.w),
                          Expanded(
                            child: Text(
                              "Good Morning. Have a nice\nday man",
                              style: Get.textTheme.titleMedium,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(15.h),
              Text(
                "Drive less then pay less!",
                style: Get.textTheme.titleLarge?.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(15.h),
              _optionWidget(
                title: "Homeowners",
                image: ImagePaths.beg,
              ),
              Gap(15.h),
              Row(
                children: [
                  Expanded(
                      child: _optionWidget(
                    title: "Auto",
                    image: ImagePaths.car,
                  )),
                  Gap(20.w),
                  Expanded(
                      child: _optionWidget(
                    title: "Pets",
                    image: ImagePaths.pets,
                  )),
                ],
              ),
              Gap(15.h),
              Row(
                children: [
                  Expanded(
                      child: _optionWidget(
                    title: "Business",
                    image: ImagePaths.beg,
                  )),
                  Gap(20.w),
                  Expanded(
                      child: _optionWidget(
                    title: "Life",
                    image: ImagePaths.heart,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _optionWidget({
    required String title,
    required String image,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 28.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 30.w,
            width: 30.w,
          ),
          Gap(4.h),
          Text(
            title,
            style: Get.textTheme.titleMedium?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(4.h),
          Stack(
            children: [
              Container(
                height: 4.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  color: AppColors.indicatorBackground,
                ),
              ),
              Container(
                height: 4.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  color: AppColors.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
