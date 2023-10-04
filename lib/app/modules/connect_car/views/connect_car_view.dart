import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/my_app_bar.dart';
import 'package:american_mile/core/components/small_button.dart';
import '../../../../core/components/index.dart';
import '../../../../core/utils/index.dart';
import '../controllers/connect_car_controller.dart';

class ConnectCarView extends GetView<ConnectCarController> {
  const ConnectCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              const MyAppBar(title: 'Connect Car'),
              Gap(40.h),
              Row(
                children: [
                  _component(
                    titleText: "Connect with",
                    subTitleText: "SMART CAR",
                    image: ImagePaths.steering,
                  ),
                  Gap(20.w),
                  _component(
                    titleText: "Upload Manual",
                    subTitleText: "ODOMETER",
                    color: AppColors.primaryDark,
                    imageColor: AppColors.white,
                    image: ImagePaths.speedometer,
                  ),
                ],
              ),
              Gap(40.h),
              Text(
                "Please fill Odometer Form",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(30.h),
              DottedBorderWidget(
                bodyWidget: Padding(
                  padding: EdgeInsets.all(60.w),
                  child: Image.asset(
                    ImagePaths.imagePlace,
                    height: 60.w,
                    width: 80.w,
                  ),
                ),
              ),
              Gap(30.h),
              Text(
                "Step 01: Upload Odometer Picture",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(15.h),
              Text(
                "Photo should be clearly visible and\nmake sure your flashlight is on.",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(30.h),
              DottedBorderWidget(
                bodyWidget: Padding(
                  padding: EdgeInsets.all(60.w),
                  child: Image.asset(
                    ImagePaths.camera,
                    height: 60.w,
                    width: 80.w,
                  ),
                ),
              ),
              Gap(30.h),
              Text(
                "Step 02: Take a selfie",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(15.h),
              Text(
                "Photo should be clearly visible and\ndon't use any kind of filter & other editings",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(30.h),
              Text(
                "Step 03: Enter Mile",
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(15.h),
              Text(
                "Please enter Mile(s) number, Which is\nCurrently showing in your odometer.",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: ShadowContainer(
                  child: Center(
                    child: Text(
                      "9,154",
                      style: Get.textTheme.bodyMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(30.h),
              RectSmallButton(
                buttonText: "Get Qoute",
                onTap: () {},
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }

  _component({
    required String titleText,
    required String subTitleText,
    required String image,
    Color? color,
    Color? imageColor,
  }) {
    return Expanded(
      child: Column(
        children: [
          ShadowContainer(
            backgroundColor: color,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Image.asset(
                image,
                height: 70.w,
                width: 70.w,
                color: imageColor ?? AppColors.textLight,
              ),
            ),
          ),
          Gap(12.h),
          Text(
            titleText,
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Gap(6.h),
          Text(
            subTitleText,
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 12.sp,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
